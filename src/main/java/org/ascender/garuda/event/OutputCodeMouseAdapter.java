package org.ascender.garuda.event;

import org.ascender.garuda.app.Garuda;
import org.eclipse.swt.events.MouseAdapter;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Label;

public class OutputCodeMouseAdapter extends MouseAdapter {

	private Label showLabel;
	private Garuda app;
	public OutputCodeMouseAdapter(Label showLabel, Garuda app) {
		super();
		this.showLabel = showLabel;
		this.app = app;
	}
	@Override
	public void mouseDown(MouseEvent e) {
		super.mouseDown(e);
		showLabel.setVisible(true);
		showLabel.setText("Watting...");
		Button this_ = (Button) e.widget;
		this_.setEnabled(false);
		app.gererateCode();
		showLabel.setText("Success!!!");
		this_.setEnabled(true);
	}
}
