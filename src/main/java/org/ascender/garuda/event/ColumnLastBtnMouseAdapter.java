package org.ascender.garuda.event;

import org.ascender.garuda.app.Garuda;
import org.eclipse.swt.events.MouseAdapter;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.widgets.Group;

public class ColumnLastBtnMouseAdapter extends MouseAdapter {

	private Group columnGroup;
	private Garuda app;
	public ColumnLastBtnMouseAdapter(Group columnGroup,Garuda app) {
		super();
		this.columnGroup = columnGroup;
		this.app = app;
	}
	
	@Override
	public void mouseDown(MouseEvent e) {
		super.mouseDown(e);
		columnGroup.dispose();
		app.createBasicInfoPanel();
		app.repaint();
	}
}
