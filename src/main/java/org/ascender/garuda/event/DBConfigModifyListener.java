package org.ascender.garuda.event;

import org.ascender.garuda.util.ConfigUtil;
import org.ascender.garuda.util.DBUtil;
import org.eclipse.swt.events.ModifyEvent;
import org.eclipse.swt.events.ModifyListener;
import org.eclipse.swt.widgets.Combo;
import org.eclipse.swt.widgets.Text;

/**
 * 监听数据库配置修改
 * @author 737878
 *
 */
public class DBConfigModifyListener implements ModifyListener {
	private Combo db;
	private Text host;
	private Text port;
	private Text inst;
	private Text user;
	private Text pwd;

	public DBConfigModifyListener(Combo db, Text host, Text port, Text inst, Text user, Text pwd) {
		super();
		this.db = db;
		this.host = host;
		this.port = port;
		this.inst = inst;
		this.user = user;
		this.pwd = pwd;
	}

	@Override
	public void modifyText(ModifyEvent e) {
		//保存设置
		String db = this.db.getText();
		String host = this.host.getText();
		String port = this.port.getText();
		String inst = this.inst.getText();
		String user = this.user.getText();
		String pwd = this.pwd.getText();
		ConfigUtil.saveDBConfig(db, host, port, inst, user, pwd);
		
		//重新初始化数据库配置
		String driverName = ConfigUtil.getDriverName();
		String url = ConfigUtil.getUrl();
		String username = ConfigUtil.getUsername();
		String password = ConfigUtil.getPassword();
		DBUtil.init(driverName, url, username, password);
	}

}
