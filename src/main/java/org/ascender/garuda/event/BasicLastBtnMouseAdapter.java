package org.ascender.garuda.event;

import org.ascender.garuda.app.Garuda;
import org.eclipse.swt.events.MouseAdapter;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.widgets.Group;

public class BasicLastBtnMouseAdapter extends MouseAdapter {

	private Group basicGroup;//基本信息panel
	private Garuda app;
	public BasicLastBtnMouseAdapter(Group basicGroup, Garuda app) {
		super();
		this.basicGroup = basicGroup;
		this.app = app;
	}

	@Override
	public void mouseDown(MouseEvent e) {
		super.mouseDown(e);
		basicGroup.dispose();
		
		app.createDBConfigPanel();
		app.repaint();
	}
}
