package org.ascender.garuda.event;

import org.ascender.garuda.app.Garuda;
import org.eclipse.swt.events.MouseAdapter;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.widgets.Group;

public class OutputLastBtnMouseAdapter extends MouseAdapter {

	private Group outputGroup;
	private Garuda app;
	
	public OutputLastBtnMouseAdapter(Group outputGroup, Garuda app) {
		super();
		this.outputGroup = outputGroup;
		this.app = app;
	}

	@Override
	public void mouseDown(MouseEvent e) {
		super.mouseDown(e);
		this.outputGroup.dispose();
		this.app.createColumnsPanel();
		this.app.repaint();
	}
}
