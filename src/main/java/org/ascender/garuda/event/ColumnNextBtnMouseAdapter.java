package org.ascender.garuda.event;

import org.ascender.garuda.app.Garuda;
import org.eclipse.swt.events.MouseAdapter;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.widgets.Group;
import org.eclipse.swt.widgets.Label;

public class ColumnNextBtnMouseAdapter extends MouseAdapter {
	
	private Group columnGroup;
	private Garuda app;
	private Label showLabel;

	public ColumnNextBtnMouseAdapter(Group columnGroup,Label showLabel, Garuda app) {
		super();
		this.columnGroup = columnGroup;
		this.app = app;
		this.showLabel = showLabel;
	}

	@Override
	public void mouseDown(MouseEvent e) {
		super.mouseDown(e);
		String msg = app.validateColumnsInfo();
		if(!"success".equals(msg)){
			showLabel.setText(msg);
			return;
		} else {
			showLabel.setText("");
		}
		//构造输出代码所需的列信息
		app.buildOutputColumnsInfo();
		columnGroup.dispose();
		app.createOutputPanel();
		app.repaint();
	}
	
}
