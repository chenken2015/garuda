package org.ascender.garuda.event;

import org.ascender.garuda.util.CodeUtil;
import org.eclipse.swt.events.ModifyEvent;
import org.eclipse.swt.events.ModifyListener;
import org.eclipse.swt.widgets.Combo;
import org.eclipse.swt.widgets.Text;

public class TableNameModifyListener implements ModifyListener {

	private Text entityText;
	private Text commentText;
	
	public TableNameModifyListener(Text entityText, Text commentText) {
		super();
		this.entityText = entityText;
		this.commentText = commentText;
	}

	@Override
	public void modifyText(ModifyEvent e) {
		Combo target = (Combo) e.widget;
		String tableName = target.getText();
		entityText.setText(CodeUtil.getEntityName(tableName));
		commentText.setText("");
	}

}
