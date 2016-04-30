package org.ascender.garuda.event;

import java.sql.Connection;

import org.ascender.garuda.app.Garuda;
import org.ascender.garuda.util.DBUtil;
import org.eclipse.swt.SWT;
import org.eclipse.swt.events.MouseAdapter;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Group;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Widget;
import org.eclipse.wb.swt.SWTResourceManager;
/**
 * 数据库连接界面点击"下一步"按钮
 * @author 737878
 *
 */
public class DBNextBtnMouseAdapter extends MouseAdapter {
	private Group dbGroup;
	private Garuda app;
	private Label showLabel;
	
	public DBNextBtnMouseAdapter(Group dbGroup, Label showLabel, Garuda app) {
		super();
		this.dbGroup = dbGroup;
		this.showLabel = showLabel;
		this.app = app;
	}

	@Override
	public void mouseDown(MouseEvent e) {
		super.mouseDown(e);
		//1.检测连接
		Widget w = e.widget;
		Button target = (Button)w;
		target.setEnabled(false);//防止连续点击导致程序崩溃
		showLabel.setVisible(true);
		showLabel.setText("watting...");
		Connection conn = DBUtil.getConnection();
		if(conn != null){
			showLabel.setForeground(SWTResourceManager.getColor(SWT.COLOR_BLACK));
			showLabel.setText("连接成功!!!");
			target.setEnabled(true);
		} else {
			showLabel.setForeground(SWTResourceManager.getColor(SWT.COLOR_RED));
			showLabel.setText("连接失败!!!");
			target.setEnabled(true);
			return;
		}
		DBUtil.close(conn);
		
		//2.销毁数据库界面panel
		dbGroup.dispose();
		
		app.createBasicInfoPanel();
		app.repaint();
	}
}
