package org.ascender.garuda.event;

import java.sql.Connection;

import org.ascender.garuda.util.DBUtil;
import org.eclipse.swt.SWT;
import org.eclipse.swt.events.MouseAdapter;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Widget;
import org.eclipse.wb.swt.SWTResourceManager;

/**
 * 测试数据库连接按钮点击
 * @author 737878
 *
 */
public class TestDBMouseAdapter extends MouseAdapter {
	private Label showLabel;

	public TestDBMouseAdapter(Label showLabel) {
		super();
		this.showLabel = showLabel;
	}
	
	@Override
	public void mouseDown(MouseEvent event) {
		super.mouseDown(event);
		Widget w = event.widget;
		Button target = (Button)w;
		target.setEnabled(false);//防止连续点击导致程序崩溃
		showLabel.setVisible(true);
		showLabel.setText("watting...");
		Connection conn = DBUtil.getConnection();
		if(conn != null){
			showLabel.setForeground(SWTResourceManager.getColor(SWT.COLOR_BLACK));
			showLabel.setText("连接成功!!!");
		} else {
			showLabel.setForeground(SWTResourceManager.getColor(SWT.COLOR_RED));
			showLabel.setText("连接失败!!!");
		}
		DBUtil.close(conn);
		target.setEnabled(true);
	}
}
