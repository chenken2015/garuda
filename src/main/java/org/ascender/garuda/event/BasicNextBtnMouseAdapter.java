package org.ascender.garuda.event;

import org.ascender.garuda.app.Garuda;
import org.eclipse.swt.events.MouseAdapter;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.widgets.Group;
import org.eclipse.swt.widgets.Label;

public class BasicNextBtnMouseAdapter extends MouseAdapter {

	private Group basicGroup;//基本信息panel
	private Garuda app;
	private Label showLabel;
	public BasicNextBtnMouseAdapter(Group basicGroup, Label showLabel, Garuda app) {
		super();
		this.basicGroup = basicGroup;
		this.app = app;
		this.showLabel = showLabel;
	}
	
	@Override
	public void mouseDown(MouseEvent e) {
		super.mouseDown(e);
		String msg = app.validateTableInfo();
		if(!"success".equals(msg)){
			showLabel.setText(msg);
			return;
		} else {
			showLabel.setText("");
		}
		
		//跳转之前要做的事:
		app.beforeGoToColumnPanel();
		
		basicGroup.dispose();
		app.createColumnsPanel();
		app.repaint();
	}
}
