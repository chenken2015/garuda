package org.ascender.garuda.app;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ascender.garuda.entity.Column;
import org.ascender.garuda.entity.Table;
import org.ascender.garuda.event.BasicLastBtnMouseAdapter;
import org.ascender.garuda.event.BasicNextBtnMouseAdapter;
import org.ascender.garuda.event.CheckboxMouseAdapter;
import org.ascender.garuda.event.ColumnLastBtnMouseAdapter;
import org.ascender.garuda.event.ColumnNextBtnMouseAdapter;
import org.ascender.garuda.event.DBConfigModifyListener;
import org.ascender.garuda.event.DBNextBtnMouseAdapter;
import org.ascender.garuda.event.OutputCodeMouseAdapter;
import org.ascender.garuda.event.OutputLastBtnMouseAdapter;
import org.ascender.garuda.event.TableMouseAdapter;
import org.ascender.garuda.event.TableNameModifyListener;
import org.ascender.garuda.event.TestDBMouseAdapter;
import org.ascender.garuda.util.CodeUtil;
import org.ascender.garuda.util.ConfigUtil;
import org.ascender.garuda.util.DBUtil;
import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.TableEditor;
import org.eclipse.swt.events.ControlAdapter;
import org.eclipse.swt.events.ControlEvent;
import org.eclipse.swt.events.ModifyEvent;
import org.eclipse.swt.events.ModifyListener;
import org.eclipse.swt.layout.FormAttachment;
import org.eclipse.swt.layout.FormData;
import org.eclipse.swt.layout.FormLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Combo;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Group;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Menu;
import org.eclipse.swt.widgets.MenuItem;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.TableColumn;
import org.eclipse.swt.widgets.TableItem;
import org.eclipse.swt.widgets.Text;
import org.eclipse.wb.swt.SWTResourceManager;
import org.eclipse.swt.widgets.Composite;

/**
 * 
 * @author 737878
 *
 */
public class Garuda {

	protected Shell shell;
	private Text hostText;
	private Text portText;
	private Text entityText;
	private Text commentText;
	private Combo projectCombo;
	private Combo moduleCombo;
	private Combo tableCombo;
	private Text tableTypeText;
	private org.eclipse.swt.widgets.Table columnsTable;
	

	private Table table;//实体信息
	private List<Column> columns;//属性列表
	private Map<Integer,Boolean> primaryMap;
	private Map<Integer,Boolean> searchMap;
	private Map<Integer,Boolean> gridMap;//存储每列是否出现在grid中
	private Combo dbTypeCombo;
	private Text instText;
	private Text userText;
	private Text pwdText;
	private Text pathText;
	private Text seqText;
	
	/**
	 * Launch the application.
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			Garuda window = new Garuda();
			window.open();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Garuda() {
		super();
		this.init();
	}
	
	/**
	 * 重新渲染
	 */
	public void repaint(){
		shell.layout();
	}

	/**
	 * Open the window.
	 */
	public void open() {
		Display display = Display.getDefault();
		createContents();
		shell.open();
		shell.layout();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch()) {
				display.sleep();
			}
		}
	}
	
	/**
	 * Create contents of the window.
	 */
	protected void createContents() {
		shell = new Shell();
		shell.setImage(SWTResourceManager.getImage(Garuda.class, "plane.png"));
		shell.setSize(700, 520);
		shell.setText("SMS代码生成-0.0.1-SNAPSHOT");
		shell.setLayout(new FormLayout());
		
		this.buildMenu();
		this.createDBConfigPanel();
	}
	
	private void init(){
		File folder = new File(ConfigUtil.folderPath);
		if(!folder.exists())
			folder.mkdirs();
		File tplFolder = new File(ConfigUtil.userTemplateFolder);
		if(!tplFolder.exists()){
			tplFolder.mkdirs();
		}
		File dbFile = new File(ConfigUtil.dbConfigPath);
		if(!dbFile.exists()){
			try {
				dbFile.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		File projectFile = new File(ConfigUtil.historyPath);
		if(!projectFile.exists()){
			try {
				projectFile.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		//初始化DBUtil,注册驱动,连接参数
		String driverName = ConfigUtil.getDriverName();
		String url = ConfigUtil.getUrl();
		String username = ConfigUtil.getUsername();
		String password = ConfigUtil.getPassword();
		DBUtil.init(driverName, url, username, password);
	}
	
	/**
	 * 构建菜单项
	 */
	private void buildMenu(){
		Menu menu = new Menu(shell, SWT.BAR);
		shell.setMenuBar(menu);
		
		MenuItem menuItem = new MenuItem(menu, SWT.CASCADE);
		menuItem.setText("设置");
		
		Menu menu_1 = new Menu(menuItem);
		menuItem.setMenu(menu_1);
		
		MenuItem menuItem_3 = new MenuItem(menu_1, SWT.NONE);
		menuItem_3.setText("数据库配置");
		
		MenuItem menuItem_4 = new MenuItem(menu_1, SWT.NONE);
		menuItem_4.setText("模板维护");
		
		MenuItem menuItem_1 = new MenuItem(menu, SWT.CASCADE);
		menuItem_1.setText("帮助?");
		
		Menu menu_2 = new Menu(menuItem_1);
		menuItem_1.setMenu(menu_2);
		
		MenuItem menuItem_2 = new MenuItem(menu_2, SWT.NONE);
		menuItem_2.setText("使用说明");
		
		MenuItem mntmgaruda = new MenuItem(menu_2, SWT.NONE);
		mntmgaruda.setText("关于garuda");		
	}
	
	public void createDBConfigPanel(){
		Group dbGroup = new Group(shell, SWT.NONE);
		dbGroup.setLayout(null);
		FormData layoutData = new FormData();
		layoutData.top = new FormAttachment(0, 10);
		layoutData.right = new FormAttachment(100, -10);
		layoutData.bottom = new FormAttachment(100, -10);
		layoutData.left = new FormAttachment(0, 10);
		
		dbGroup.setLayoutData(layoutData);
		dbGroup.setText("数据库配置");
		
		Label dbTypeLabel = new Label(dbGroup, SWT.NONE);
		dbTypeLabel.setAlignment(SWT.RIGHT);
		dbTypeLabel.setBounds(113, 48, 60, 17);
		dbTypeLabel.setText("数据库");
		
		dbTypeCombo = new Combo(dbGroup, SWT.READ_ONLY);
		dbTypeCombo.setBounds(223, 45, 331, 25);
		dbTypeCombo.setItems(new String[] {"Oracle", "MySQL"});
		dbTypeCombo.setText(ConfigUtil.getDBType());
		
		Label hostLabel = new Label(dbGroup, SWT.NONE);
		hostLabel.setAlignment(SWT.RIGHT);
		hostLabel.setBounds(113, 99, 60, 17);
		hostLabel.setText("主机IP");
		
		hostText = new Text(dbGroup, SWT.BORDER);
		hostText.setBounds(223, 96, 331, 23);
		hostText.setText(ConfigUtil.getHost());
		
		Label portLabel = new Label(dbGroup, SWT.NONE);
		portLabel.setAlignment(SWT.RIGHT);
		portLabel.setBounds(113, 149, 60, 17);
		portLabel.setText("端口号");
		
		portText = new Text(dbGroup, SWT.BORDER);
		portText.setBounds(223, 146, 331, 23);
		portText.setText(ConfigUtil.getPort());
		
		Label instLabel = new Label(dbGroup, SWT.NONE);
		instLabel.setAlignment(SWT.RIGHT);
		instLabel.setBounds(113, 199, 60, 17);
		instLabel.setText("实例名");
		
		instText = new Text(dbGroup, SWT.BORDER);
		instText.setBounds(223, 196, 331, 23);
		instText.setText(ConfigUtil.getInst());
		
		Label userLabel = new Label(dbGroup, SWT.NONE);
		userLabel.setAlignment(SWT.RIGHT);
		userLabel.setBounds(113, 249, 60, 17);
		userLabel.setText("用户名");
		
		userText = new Text(dbGroup, SWT.BORDER);
		userText.setBounds(223, 246, 331, 23);
		userText.setText(ConfigUtil.getUsername());
		
		Label pwdLabel = new Label(dbGroup, SWT.NONE);
		pwdLabel.setAlignment(SWT.RIGHT);
		pwdLabel.setBounds(113, 299, 60, 17);
		pwdLabel.setText("密码");
		
		pwdText = new Text(dbGroup, SWT.PASSWORD);
		pwdText.setBounds(223, 299, 331, 23);
		pwdText.setText(ConfigUtil.getPassword());
		
		//监听数据库配置改变事件
		dbTypeCombo.addModifyListener(new DBConfigModifyListener(dbTypeCombo,hostText,portText,instText,userText,pwdText));
		hostText.addModifyListener(new DBConfigModifyListener(dbTypeCombo,hostText,portText,instText,userText,pwdText));
		portText.addModifyListener(new DBConfigModifyListener(dbTypeCombo,hostText,portText,instText,userText,pwdText));
		instText.addModifyListener(new DBConfigModifyListener(dbTypeCombo,hostText,portText,instText,userText,pwdText));
		userText.addModifyListener(new DBConfigModifyListener(dbTypeCombo,hostText,portText,instText,userText,pwdText));
		pwdText.addModifyListener(new DBConfigModifyListener(dbTypeCombo,hostText,portText,instText,userText,pwdText));
		
		final Composite composite = new Composite(dbGroup, SWT.NONE);
//		composite.setBackground(SWTResourceManager.getColor(SWT.COLOR_GRAY));
		composite.setBounds(260, 355, 216, 77);
		composite.setLayout(null);
		
		Button testDBBtn = new Button(composite, SWT.NONE);
		testDBBtn.setBounds(10, 10, 80, 27);
		testDBBtn.setText("连接测试");
		
		Button dbNextBtn = new Button(composite, SWT.NONE);
		dbNextBtn.setBounds(112, 10, 80, 27);
		dbNextBtn.setText("下一步");
		
		Label showLabel = new Label(composite, SWT.NONE);
		showLabel.setBounds(74, 50, 61, 17);
		showLabel.setVisible(false);
		
		//数据库设置界面的下一步按钮
		dbNextBtn.addMouseListener(new DBNextBtnMouseAdapter(dbGroup,showLabel,this));		
		//点击"连接测试按钮"事件
		testDBBtn.addMouseListener(new TestDBMouseAdapter(showLabel));
		
		dbGroup.addControlListener(new ControlAdapter() {
			@Override
			public void controlResized(ControlEvent e) {
				Group group = (Group) e.widget;
//				System.out.println(group.getSize());//664,442
				if(group.getSize().y >= 442)
					composite.setBounds(group.getSize().x/2 - 80, group.getSize().y-80, 216, 77);
			}
		});		
	}
	
	public void createBasicInfoPanel(){
		Group basicGroup = new Group(shell, SWT.NONE);
		basicGroup.setForeground(SWTResourceManager.getColor(SWT.COLOR_WIDGET_FOREGROUND));
		basicGroup.setLayout(null);
		FormData layoutData = new FormData();
		layoutData.top = new FormAttachment(0, 10);
		layoutData.right = new FormAttachment(100, -10);
		layoutData.bottom = new FormAttachment(100, -10);
		layoutData.left = new FormAttachment(0, 10);
		basicGroup.setLayoutData(layoutData);
		basicGroup.setText("基本信息设置");
		
		Label projectLabel = new Label(basicGroup, SWT.NONE);
		projectLabel.setBounds(113, 47, 48, 17);
		projectLabel.setText("所属项目");
		
		projectCombo = new Combo(basicGroup, SWT.BORDER);
		projectCombo.setBounds(223, 44, 334, 23);
		//初始化项目combo,读取出历史记录
		String[] projects = ConfigUtil.getHistoryProjects();
		for(String p : projects)
			projectCombo.add(p);
		
		Label moduleLabel = new Label(basicGroup, SWT.NONE);
		moduleLabel.setBounds(113, 97, 48, 17);
		moduleLabel.setText("所属模块");
		
		moduleCombo = new Combo(basicGroup, SWT.BORDER);
		moduleCombo.setBounds(223, 94, 334, 23);

		//项目combo改变后,module也要改变
		projectCombo.addModifyListener(new ModifyListener() {
			public void modifyText(ModifyEvent e) {
				Combo combo = (Combo) e.widget;
				String[] modules = ConfigUtil.getHistoryModules(combo.getText());
				moduleCombo.removeAll();
				for(String m : modules)
					moduleCombo.add(m);
			}
		});
		if(projectCombo.getItemCount() > 0)
			projectCombo.select(0);
		if(moduleCombo.getItemCount() > 0)
			moduleCombo.select(0);			

		Label tableLabel = new Label(basicGroup, SWT.NONE);
		tableLabel.setBounds(113, 148, 48, 17);
		tableLabel.setText("对应表名");
		
		tableCombo = new Combo(basicGroup, SWT.READ_ONLY);
		tableCombo.setBounds(223, 144, 334, 25);
		final List<Table> tables = DBUtil.getAllTables();
		for(Table t : tables)
			tableCombo.add(t.getTableName());
		if(this.table != null)
			tableCombo.setText(this.table.getTableName());
		
		//隐藏域,用来存放表的类型,VIEW,TABLE
		tableTypeText = new Text(basicGroup, SWT.BORDER);
		tableTypeText.setBounds(223, 167, 73, 23);
		tableTypeText.setVisible(false);
		if(this.table != null)
			tableTypeText.setText(this.table.getTableType());
		
		//tableCombo
		tableCombo.addModifyListener(new ModifyListener() {
			
			@Override
			public void modifyText(ModifyEvent e) {
				Combo _this = (Combo) e.widget;
				String tableName = _this.getText();
				for(Table t : tables){
					if(t.getTableName().equals(tableName)){
						tableTypeText.setText(t.getTableType());
						break;
					}
				}
			}
			
		});
		
		Label entityLabel = new Label(basicGroup, SWT.NONE);
		entityLabel.setBounds(113, 199, 48, 17);
		entityLabel.setText("实体名称");
		
		entityText = new Text(basicGroup, SWT.BORDER);
		entityText.setBounds(223, 196, 334, 23);
		if(this.table != null)
			entityText.setText(this.table.getEntityName());
		
		Label commentLabel = new Label(basicGroup, SWT.NONE);
		commentLabel.setBounds(113, 249, 48, 17);
		commentLabel.setText("显示名称");
		
		commentText = new Text(basicGroup, SWT.BORDER);
		commentText.setBounds(223, 246, 334, 23);
		if(this.table != null)
			commentText.setText(this.table.getComment());
		
		tableCombo.addModifyListener(new TableNameModifyListener(entityText,commentText));

		final Composite composite = new Composite(basicGroup, SWT.NONE);
//		composite.setBackground(SWTResourceManager.getColor(SWT.COLOR_GRAY));
		composite.setBounds(260, 355, 216, 77);
		composite.setLayout(null);		
		
		//基本信息界面上一步按钮
		Button basicLastBtn = new Button(composite, SWT.NONE);
		basicLastBtn.setBounds(10, 10, 80, 27);
		basicLastBtn.setText("上一步");
		
		//基本信息界面下一步按钮
		Button basicNextBtn = new Button(composite, SWT.NONE);
		basicNextBtn.setBounds(112, 10, 80, 27);
		basicNextBtn.setText("下一步");
		
		Label showLabel = new Label(composite, SWT.NONE);
		showLabel.setBounds(40, 50, 139, 17);
		
		basicLastBtn.addMouseListener(new BasicLastBtnMouseAdapter(basicGroup,this));
		basicNextBtn.addMouseListener(new BasicNextBtnMouseAdapter(basicGroup, showLabel, this));
		
		Label lblNewLabel = new Label(basicGroup, SWT.NONE);
		lblNewLabel.setFont(SWTResourceManager.getFont("微软雅黑", 8, SWT.NORMAL));
		lblNewLabel.setBounds(223, 121, 192, 17);
		lblNewLabel.setText("模块全名,例如com.sf.module.ssv");

		basicGroup.addControlListener(new ControlAdapter() {
			@Override
			public void controlResized(ControlEvent e) {
				Group group = (Group) e.widget;
//				System.out.println(group.getSize());//664,442
				if(group.getSize().y >= 442)
					composite.setBounds(group.getSize().x/2 - 80, group.getSize().y-80, 216, 77);
			}
		});			
	}
	
	private boolean isEmpty(String str){
		if(str == null || str.trim().equals(""))
			return true;
		return false;
	}
	
	public String validateTableInfo(){
		if(this.isEmpty(this.projectCombo.getText()))
			return "请输入项目名称";
		if(this.isEmpty(this.moduleCombo.getText()))
			return "请输入模块名称";
		if(this.isEmpty(this.tableCombo.getText()))
			return "请选择表或视图";
		if(this.isEmpty(this.entityText.getText()))
			return "请输入实体名称";
		if(!this.entityText.getText().matches("[A-Z]\\w*"))
			return "实体名称不合法";		
		if(this.isEmpty(this.commentText.getText()))
			return "请输入显示名称";
		return "success";
	}
	
	public void beforeGoToColumnPanel(){
		//记录输入历史
		this.logBasicInfoHistory();
		//构造table对象和List<Column>
		this.buildTableAndColumns();
	}
	
	/**
	 * 构造Table对象和List<Column>集合
	 * 点击下一步后应该获取实体基本信息
	 */
	private void buildTableAndColumns(){
		if(table == null)
			table = new Table();
		if(!tableCombo.getText().equals(table.getTableName()))
			columns = DBUtil.getAllColumns(tableCombo.getText());
		table.setUsername(System.getProperty("user.name"));
		table.setEntityName(entityText.getText());
		table.setTableName(tableCombo.getText());
		table.setTableType(tableTypeText.getText());
		table.setProject(projectCombo.getText());
		table.setModule(moduleCombo.getText());
		table.setComment(commentText.getText());
		String excelTpl = table.getModule().replace(".", "/")+"/excel/"+
				table.getEntityName().substring(0, 1).toLowerCase()+table.getEntityName().substring(1)+".xlsx";
		table.setExcelTpl(excelTpl);
		//获取模块简称
		String simpleModule = table.getModule().substring(table.getModule().lastIndexOf(".")+1);
		table.setSimpleModule(simpleModule);
	}
	
	private void logBasicInfoHistory(){
		Map<String,String> history = new HashMap<String,String>();
		
		//记录项目
		String[] projectArr = projectCombo.getItems();
		String lastProj = projectCombo.getText();
		List<String> plist = new ArrayList<String>();
		plist.add(lastProj);
		for(String p : projectArr){
			if(p.equals(lastProj))
				continue;
			plist.add(p);
			
			String[] othersArr = ConfigUtil.getHistoryModules(p);
			String otherModules = "";
			for(int i = 0; i < othersArr.length; i++){
				if(i == othersArr.length - 1)
					otherModules += othersArr[i];
				else
					otherModules += ( othersArr[i] + "," );
			}
			history.put(p, otherModules);
		}
		String projects = "";
		for(int i = 0; i < plist.size(); i++){
			if(i == plist.size() - 1)
				projects += plist.get(i);
			else
				projects += ( plist.get(i) + "," );
		}
		history.put("projects", projects);
		
		//模块
		String[] moduleArr = moduleCombo.getItems();
		String lastModule = moduleCombo.getText();
		List<String> mlist = new ArrayList<String>();
		mlist.add(lastModule);
		for(String m : moduleArr){
			if(m.equals(lastModule))
				continue;
			mlist.add(m);
		}		
		String modules = "";
		for(int i = 0; i < mlist.size(); i++){
			if(i == mlist.size() - 1)
				modules += mlist.get(i);
			else
				modules += ( mlist.get(i) + "," );
		}
		history.put(lastProj, modules);
		ConfigUtil.saveBasicInfoHistory(history);
	}
	
	public void createColumnsPanel(){
		Group columnGroup = new Group(shell, SWT.NONE);
		columnGroup.setLayout(null);
		FormData layoutData_1 = new FormData();
		layoutData_1.top = new FormAttachment(0, 10);
		layoutData_1.right = new FormAttachment(100, -10);
		layoutData_1.bottom = new FormAttachment(100, -10);
		layoutData_1.left = new FormAttachment(0, 10);
		columnGroup.setLayoutData(layoutData_1);
		columnGroup.setText("字段映射配置-" + this.table.getTableName());
		
		columnsTable = new org.eclipse.swt.widgets.Table(columnGroup, SWT.BORDER | SWT.FULL_SELECTION);
		columnsTable.setBounds(10, 22, 644, 377);
		columnsTable.setHeaderVisible(true);
		columnsTable.setLinesVisible(true);
		
		TableColumn tableColumn = new TableColumn(columnsTable, SWT.CENTER);
		tableColumn.setWidth(30);
		tableColumn.setText("");
		
		TableColumn tableColumn_1 = new TableColumn(columnsTable, SWT.LEFT);
		tableColumn_1.setWidth(109);
		tableColumn_1.setText("字段名");
		
		TableColumn tableColumn_2 = new TableColumn(columnsTable, SWT.LEFT);
		tableColumn_2.setWidth(120);
		tableColumn_2.setText("字段类型");
		
		TableColumn tableColumn_3 = new TableColumn(columnsTable, SWT.LEFT);
		tableColumn_3.setWidth(100);
		tableColumn_3.setText("属性名");
		
		TableColumn tableColumn_4 = new TableColumn(columnsTable, SWT.LEFT);
		tableColumn_4.setWidth(71);
		tableColumn_4.setText("属性类型");
		
		TableColumn tableColumn_5 = new TableColumn(columnsTable, SWT.LEFT);
		tableColumn_5.setWidth(95);
		tableColumn_5.setText("中文名");
		
		TableColumn tableColumn_6 = new TableColumn(columnsTable, SWT.LEFT);
		tableColumn_6.setWidth(38);
		tableColumn_6.setText("主键");
		
		TableColumn tableColumn_7 = new TableColumn(columnsTable, SWT.LEFT);
		tableColumn_7.setWidth(38);
		tableColumn_7.setText("查询");

		TableColumn tableColumn_8 = new TableColumn(columnsTable, SWT.LEFT);
		tableColumn_8.setWidth(38);
		tableColumn_8.setText("列表");
		
		//遍历columns
		int index = 0;
		if(primaryMap == null)
			primaryMap = new HashMap<Integer,Boolean>();
		if(searchMap == null)
			searchMap = new HashMap<Integer,Boolean>();
		if(gridMap == null)
			gridMap = new HashMap<Integer,Boolean>();
		for(Column c : columns){
			index++;
			TableItem tableItem = new TableItem(columnsTable, SWT.NONE);
			tableItem.setText(new String[] {index+"", 
					c.getColumnName(), 
					c.getDbType(), 
					c.getFieldName(), 
					c.getJavaType(), 
					c.getComment(), 
					"",
					"",
					""});
			primaryMap.put(index, c.isPrimary());
			searchMap.put(index, c.isSearch());
			gridMap.put(index, c.isGrid());
			
			Button primaryCheck = new Button(columnsTable, SWT.CHECK);
			primaryCheck.setSelection(c.isPrimary());
			primaryCheck.pack();
			final TableEditor editor = new TableEditor(columnsTable);
			editor.minimumWidth = primaryCheck.getSize ().x;
			editor.horizontalAlignment = SWT.CENTER;
			editor.setEditor(primaryCheck, tableItem, 6);
			primaryCheck.addMouseListener(new CheckboxMouseAdapter(index,primaryMap));
			
			Button searchCheck = new Button(columnsTable, SWT.CHECK);
			searchCheck.setSelection(c.isSearch());
			searchCheck.pack();
			final TableEditor editor_1 = new TableEditor(columnsTable);
			editor_1.minimumWidth = searchCheck.getSize ().x;
			editor_1.horizontalAlignment = SWT.CENTER;
			editor_1.setEditor(searchCheck, tableItem, 7);
			searchCheck.addMouseListener(new CheckboxMouseAdapter(index,searchMap));
			
			Button gridCheck = new Button(columnsTable, SWT.CHECK);
			gridCheck.setSelection(c.isGrid());
			gridCheck.pack();
			final TableEditor editor_2 = new TableEditor(columnsTable);
			editor_2.minimumWidth = gridCheck.getSize ().x;
			editor_2.horizontalAlignment = SWT.CENTER;
			editor_2.setEditor(gridCheck, tableItem, 8);
			gridCheck.addMouseListener(new CheckboxMouseAdapter(index,gridMap));
		}
		
		columnsTable.addMouseListener(new TableMouseAdapter());
		
		final Composite composite = new Composite(columnGroup, SWT.NONE);
//		composite.setBackground(SWTResourceManager.getColor(SWT.COLOR_WHITE));
		composite.setBounds(233, 405, 356, 34);
		composite.setLayout(null);
		
		Button columnLastBtn = new Button(composite, SWT.NONE);
		columnLastBtn.setBounds(0, 0, 80, 27);
		columnLastBtn.setText("上一步");
		
		Button columnNextBtn = new Button(composite, SWT.NONE);
		columnNextBtn.setBounds(108, 0, 80, 27);
		columnNextBtn.setText("下一步");
		
		Label label = new Label(composite, SWT.NONE);
		label.setBounds(205, 5, 200, 17);
		label.setText("...");
		columnNextBtn.addMouseListener(new ColumnNextBtnMouseAdapter(columnGroup, label, this));
		columnLastBtn.addMouseListener(new ColumnLastBtnMouseAdapter(columnGroup, this));
		
		
		columnGroup.addControlListener(new ControlAdapter() {
			
			@Override
			public void controlResized(ControlEvent e) {
				super.controlResized(e);
				Group group = (Group) e.widget;
				
				//table大小随group改变
				columnsTable.setBounds(10,22,group.getSize().x-20,group.getSize().y-64);
				composite.setBounds(group.getSize().x/2 - 80, group.getSize().y-38, 356, 34);
			}
			
		});			
	}
	
	public String validateColumnsInfo(){
		TableItem[] tableItems = columnsTable.getItems();
		String msg = "success";
		//校验属性名称和备注:
		for(int i = 0; i < tableItems.length; i++){
			TableItem tableItem = tableItems[i];
			if(this.isEmpty(tableItem.getText(3))){
				msg = "请输入属性名:第"+(i+1)+"行";
				break;
			}
			if(!tableItem.getText(3).matches("[a-z]\\w*")){
				msg = "属性名不合法:第"+(i+1)+"行";
				break;
			}
			if(this.isEmpty(tableItem.getText(5))){
				msg = "请输入备注名:第"+(i+1)+"行";
				break;				
			}
		}
		//校验主键
		for(int i = 0; i < primaryMap.size();i++){
			
		}
		return msg;
	}
	
	//跳转到输出界面时需要获取table数据
	public void buildOutputColumnsInfo(){
		TableItem[] tableItems = columnsTable.getItems();
		for(int i = 0; i < tableItems.length; i++){
			TableItem tableItem = tableItems[i];
			Column column = this.columns.get(i);
//			column.setColumnName(tableItem.getText(1));
//			column.setDbType(tableItem.getText(2));
			column.setFieldName(tableItem.getText(3));
			column.setJavaType(tableItem.getText(4));
			column.setComment(tableItem.getText(5));
//			if(column.getComment() == null || column.getComment().trim().equals(""))
//				column.setComment(column.getColumnName());
			//类的全名
			column.setFullJavaType(CodeUtil.getFullJavaType(column.getJavaType()));
			//primay,search
			column.setPrimary(primaryMap.get(i+1));
			column.setSearch(searchMap.get(i+1));
			column.setGrid(gridMap.get(i+1));
		}
		table.setColumns(columns);
	}
	
	public void createOutputPanel(){
		Group outputGroup = new Group(shell, SWT.NONE);
		outputGroup.setLayout(null);
		FormData layoutData = new FormData();
		layoutData.top = new FormAttachment(0, 10);
		layoutData.right = new FormAttachment(100, -10);
		layoutData.bottom = new FormAttachment(100, -10);
		layoutData.left = new FormAttachment(0, 10);
		outputGroup.setLayoutData(layoutData);
		outputGroup.setText("代码输出");
		
		Label pathLabel = new Label(outputGroup, SWT.NONE);
		pathLabel.setAlignment(SWT.RIGHT);
		pathLabel.setBounds(113, 99, 72, 17);
		pathLabel.setText("输出路径");
		
		pathText = new Text(outputGroup, SWT.BORDER);
		pathText.setBounds(223, 96, 331, 23);
		pathText.setText("D:/code");
		
		Label seqLabel = new Label(outputGroup, SWT.NONE);
		seqLabel.setAlignment(SWT.RIGHT);
		seqLabel.setBounds(113, 149, 72, 17);
		seqLabel.setText("主键生成序列");
		
		seqText = new Text(outputGroup, SWT.BORDER);
		seqText.setBounds(223, 146, 331, 23);
		seqText.setText(table.getSequence() == null ? table.getTableName()+"_ID_SEQ" : table.getSequence());
		
		Button lastBtn = new Button(outputGroup, SWT.NONE);
		lastBtn.setBounds(237, 309, 80, 27);
		lastBtn.setText("上一步");
		
		Button outputBtn = new Button(outputGroup, SWT.NONE);
		outputBtn.setBounds(430, 309, 80, 27);
		outputBtn.setText("输出");
		
		lastBtn.addMouseListener(new OutputLastBtnMouseAdapter(outputGroup, this));
		
		Label showLabel = new Label(outputGroup, SWT.NONE);
		showLabel.setFont(SWTResourceManager.getFont("微软雅黑", 13, SWT.NORMAL));
		showLabel.setBounds(324, 233, 86, 23);
		showLabel.setVisible(false);
		outputBtn.addMouseListener(new OutputCodeMouseAdapter(showLabel,this));
	}

	public void gererateCode(){
		String sequence = seqText.getText();
		table.setSequence(sequence);
		String path = pathText.getText();
		CodeUtil.gerenateAllCodes(table, path);
	}
}
