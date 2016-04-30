package org.ascender.garuda.event;

import java.util.Map;

import org.eclipse.swt.events.MouseAdapter;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.widgets.Button;

public class CheckboxMouseAdapter extends MouseAdapter {

	private int curColumn;
	private Map<Integer,Boolean> map;
	public CheckboxMouseAdapter(int curColumn, Map<Integer, Boolean> map) {
		super();
		this.curColumn = curColumn;
		this.map = map;
	}

	public void mouseDown(MouseEvent e) {
		Button _this = (Button) e.widget;
		boolean flag = _this.getSelection();
		map.put(curColumn, !flag);
	};
}
