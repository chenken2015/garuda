package org.ascender.garuda.event;

import org.ascender.garuda.util.CodeUtil;
import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.TableEditor;
import org.eclipse.swt.events.FocusEvent;
import org.eclipse.swt.events.FocusListener;
import org.eclipse.swt.events.ModifyEvent;
import org.eclipse.swt.events.ModifyListener;
import org.eclipse.swt.events.MouseAdapter;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.widgets.Combo;
import org.eclipse.swt.widgets.Table;
import org.eclipse.swt.widgets.TableItem;
import org.eclipse.swt.widgets.Text;

public class TableMouseAdapter extends MouseAdapter {

	@Override
	public void mouseDown(MouseEvent e) {
		super.mouseDown(e);
		this.editFieldName(e);
		this.editJavaType(e);
		this.editComment(e);
	}
	
	private void editFieldName(MouseEvent e){
		Table columnsTable = (Table) e.widget;
		Point point = new Point(e.x, e.y);
		TableItem tableItem = columnsTable.getItem(point);
		if(tableItem == null)
			return;
		
		//编辑属性名:
		Rectangle rect = tableItem.getBounds(3);
		if (rect.contains(point)) {
			//edit
			final TableEditor editor = new TableEditor(columnsTable);
			Text text = new Text(columnsTable,SWT.NONE);
			text.setText(tableItem.getText(3));
			text.setSelection(tableItem.getText(3).length());
			text.setFocus();
			editor.grabHorizontal = true;
			editor.setEditor(text, tableItem, 3);
			
			text.addModifyListener(new ModifyListener() {
				
				@Override
				public void modifyText(ModifyEvent e) {
					Text target = (Text) e.widget;
					editor.getItem().setText(3,target.getText());
				}
				
			});
			
			text.addFocusListener(new FocusListener() {
				
				@Override
				public void focusLost(FocusEvent e) {
					Text target = (Text) e.widget;
					target.dispose();
				}
				
				@Override
				public void focusGained(FocusEvent e) {
					
				}
			});
			
		}
	}
	
	private void editJavaType(MouseEvent e){
		Table columnsTable = (Table) e.widget;
		Point point = new Point(e.x, e.y);
		TableItem tableItem = columnsTable.getItem(point);
		if(tableItem == null)
			return;
		Rectangle rect = tableItem.getBounds(4);
		if (rect.contains(point)) {
			//edit
			final TableEditor editor = new TableEditor(columnsTable);
			Combo combo = new Combo(columnsTable,SWT.READ_ONLY);
			String dbType = tableItem.getText(2);
			String[] possible = CodeUtil.getPossibleJavaType(dbType);
			for(String s : possible)
				combo.add(s);
			combo.setText(tableItem.getText(4));
			combo.setFocus();
			editor.grabHorizontal = true;
			editor.setEditor(combo, tableItem, 4);
			
			combo.addModifyListener(new ModifyListener() {
				
				@Override
				public void modifyText(ModifyEvent e) {
					Combo target = (Combo) e.widget;
					editor.getItem().setText(4,target.getText());
				}
				
			});
			
			combo.addFocusListener(new FocusListener() {
				
				@Override
				public void focusLost(FocusEvent e) {
					Combo target = (Combo) e.widget;
					target.dispose();
				}
				
				@Override
				public void focusGained(FocusEvent e) {
					
				}
			});
			
		}		
	}
	
	private void editComment(MouseEvent e){
		Table columnsTable = (Table) e.widget;
		Point point = new Point(e.x, e.y);
		TableItem tableItem = columnsTable.getItem(point);
		if(tableItem == null)
			return;
		
		//编辑属性名:
		Rectangle rect = tableItem.getBounds(5);
		if (rect.contains(point)) {
			//edit
			final TableEditor editor = new TableEditor(columnsTable);
			Text text = new Text(columnsTable,SWT.NONE);
			text.setText(tableItem.getText(5));
			text.setSelection(tableItem.getText(5).length());
			text.setFocus();
			editor.grabHorizontal = true;
			editor.setEditor(text, tableItem, 5);
			
			text.addModifyListener(new ModifyListener() {
				
				@Override
				public void modifyText(ModifyEvent e) {
					Text target = (Text) e.widget;
					editor.getItem().setText(5,target.getText());
				}
				
			});
			
			text.addFocusListener(new FocusListener() {
				
				@Override
				public void focusLost(FocusEvent e) {
					Text target = (Text) e.widget;
					target.dispose();
				}
				
				@Override
				public void focusGained(FocusEvent e) {
					
				}
			});
			
		}
	}
	
}
