package ${module}.action;

import java.io.InputStream;
import java.util.Collection;

import com.sf.framework.base.IPage;
import com.sf.framework.server.base.action.BaseGridAction;
import com.sf.module.frameworkimpl.domain.QueryObj;
import com.sf.module.liveSsv.util.IExcelHelperBiz;
import ${module}.biz.I${entityName}Biz;
import ${module}.domain.${entityName};

/**
 * ${entityName} Action
 * @author ${username}
 *
 */
@SuppressWarnings("serial")
public class ${entityName}Action extends BaseGridAction<${entityName}> {

	private I${entityName}Biz ${entityName?uncap_first}Biz;
	private ${entityName} ${entityName?uncap_first};
	private String ids;
	private String msg;
	private Collection<${entityName}> ${entityName?uncap_first}s;
	private int total;
	private IExcelHelperBiz excelHelperBiz;
	private InputStream stream;

	public String save${entityName}() {
		try {
			${entityName?uncap_first}Biz.save${entityName}(${entityName?uncap_first});
		} catch (Exception e) {
			msg = e.toString();
			log.error("error", e);
		}
		return SUCCESS;
	}

	public String find${entityName}() {
		${entityName?uncap_first} = ${entityName?uncap_first}Biz.find${entityName}(${entityName?uncap_first}.getId());
		return SUCCESS;
	}

	public String findBy${entityName}() {
		${entityName?uncap_first}s = ${entityName?uncap_first}Biz.findBy(${entityName?uncap_first});
		return SUCCESS;
	}

	public String delete${entityName}s() {
		try {
			${entityName?uncap_first}Biz.delete${entityName}s(ids);
		} catch (Exception e) {
			msg = e.toString();
			log.error("error", e);
		}
		return SUCCESS;
	}

	public String findPageBy${entityName}() {
		QueryObj queryObj = QueryObj.parseQueryObj(this);
		IPage<${entityName}> page = ${entityName?uncap_first}Biz.findPageBy(queryObj);
		${entityName?uncap_first}s = page.getData();
		total = (int) page.getTotalSize();
		return SUCCESS;
	}

	public String export(){
		//查询
		QueryObj queryObj = QueryObj.parseQueryObj(this);
		Collection<${entityName}> rows = this.${entityName?uncap_first}Biz.findBy(queryObj);
		//导出
		String excelTpl = "${excelTpl}";
		stream = excelHelperBiz.readExcelTemplateByClasspath(excelTpl).addExcelData(rows).export();
		return "export";
	}
	
	public boolean isSuccess() {
		return true;
	}

	public void set${entityName}Biz(I${entityName}Biz ${entityName?uncap_first}Biz) {
		this.${entityName?uncap_first}Biz = ${entityName?uncap_first}Biz;
	}

	public ${entityName} get${entityName}() {
		return this.${entityName?uncap_first};
	}

	public void set${entityName}(${entityName} ${entityName?uncap_first}) {
		this.${entityName?uncap_first} = ${entityName?uncap_first};
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getMsg() {
		return this.msg;
	}

	public Collection<${entityName}> get${entityName}s() {
		return this.${entityName?uncap_first}s;
	}
	
	public Collection<${entityName}> getRows() {
		return this.${entityName?uncap_first}s;
	}

	public int getTotal() {
		return this.total;
	}

	public void setExcelHelperBiz(IExcelHelperBiz excelHelperBiz) {
		this.excelHelperBiz = excelHelperBiz;
	}

	public InputStream getStream() {
		return stream;
	}
}
