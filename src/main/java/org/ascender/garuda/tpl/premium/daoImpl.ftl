package com.pti.fsc.api.service.${entityName?lower_case}.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.pti.fsc.api.service.${entityName?lower_case}.vo.${entityName}SearchCriteria;
import com.pti.fsc.api.service.${entityName?lower_case}.vo.Vo${entityName};
import com.pti.fsc.api.service.common.ApiDbConnection;
import com.pti.fsc.common.date.DateUtil;
import com.pti.fsc.common.setup.SetupBaseDao;
import com.pti.fsc.common.sql.PagingStatement;
import com.pti.fsc.common.sql.SQLRunner;
import com.pti.fsc.common.sql.SQLUtil;
import com.pti.util.exception.AppException;
import com.pti.util.log.Logger;

public class ${entityName}DaoImpl extends SetupBaseDao implements ${entityName}Dao {

	private static Logger logger = Logger.getInstance(${entityName}DaoImpl.class.getName());
	
	/**
	 * SQL error code.
	 */
	private static final String SQL_ERROR = "global.error.sql-error";
	
	private static ${entityName}Dao instance = new ${entityName}DaoImpl();
	/**
	 * get the instance
	 * @return
	 */
	public static ${entityName}Dao getInstance() {
		return (instance);
	}
	private ${entityName}DaoImpl() {
		super();
	}
	
	private void setTimeStamp(int index,PreparedStatement stmt,Date date) throws SQLException{
		if (date != null) {
			Timestamp Timestamp = new Timestamp(date.getTime());
			stmt.setTimestamp(index,Timestamp,DateUtil.getGMTCalendar());
		} else {
			stmt.setNull(index, Types.TIMESTAMP);
		}
	}
	
	@Override
	public void create${entityName}(Vo${entityName} vo${entityName}) throws AppException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		SQLRunner sqlRunner = SQLRunner.getInstance();
		try {
			conn = ApiDbConnection.getConnection();
			String sql = "";
			stmt = sqlRunner.prepareStatement(conn, sql);
			int index = 1;
			//stmt.setString(index++, vo${entityName}.get${entityName}());
			
			sqlRunner.executeUpdate(stmt);
		}catch(SQLException e){
			throw new AppException("global.error.sql-error",SQLUtil.getSQLExceptionParams(e));
		}finally {
			sqlRunner.close(rs);
			sqlRunner.close(stmt);
			sqlRunner.close(conn);
		}
	}

	@Override
	public ${entityName}SearchCriteria search${entityName}(${entityName}SearchCriteria searchCriteria)throws AppException {
		Connection conn = null;
		PagingStatement stmt = null;
		ResultSet rs = null;
		SQLRunner sqlRunner = SQLRunner.getInstance();
		try {
			conn = ApiDbConnection.getConnection();
			String sql = "";
			StringBuffer sb = new StringBuffer(sql);
			/*if(!isEmpty(searchCriteria.get${entityName}())){
				sb.append(" and API_KEY like ?");
			}*/
			stmt = sqlRunner.preparePagingStatement(conn, sb.toString(), searchCriteria);
			int index = 1;
			/*if(!isEmpty(searchCriteria.get${entityName}())){
				stmt.setString(index++, "%" +searchCriteria.get${entityName}()+ "%");
			}*/
			rs = sqlRunner.executeQuery(stmt);
			List<Vo${entityName}> ${entityName}s = obtain${entityName}FromResultSet(rs, sqlRunner);
			searchCriteria.set${entityName}s(${entityName}s);
			return searchCriteria;
		}catch(SQLException e){
			logger.error(e, e);
			throw new AppException("global.error.sql-error",SQLUtil.getSQLExceptionParams(e));
		}finally {
			sqlRunner.close(rs);
			sqlRunner.close(stmt);
			sqlRunner.close(conn);
		}
	}

	private List<Vo${entityName}> obtain${entityName}FromResultSet(ResultSet rs,SQLRunner sqlRunner) throws SQLException {
		List<Vo${entityName}> list = new ArrayList<Vo${entityName}>();
		while (rs.next()) {
			Vo${entityName} vo${entityName} = new Vo${entityName}();
			//vo${entityName}.set${entityName}(rs.getString("API_KEY"));

			Date updateTime = rs.getTimestamp("UPDATE_TIME", DateUtil.getGMTCalendar());
			vo${entityName}.setUpdateTime(updateTime);
			vo${entityName}.setUpdateBy(rs.getString("UPDATE_BY"));
			vo${entityName}.setVerifyTime(rs.getDate("VERIFY_TIME"));
			vo${entityName}.setVerifyBy(rs.getString("VERIFY_BY"));
			vo${entityName}.setDataActive(rs.getString("DATA_ACTIVE"));
			vo${entityName}.setDataStatus(rs.getString("DATA_STATUS"));
			vo${entityName}.setDataXml(rs.getString("data_xml"));
			list.add(vo${entityName});
		}
		return list;
	}
	@Override
	public int update${entityName}(Vo${entityName} vo${entityName}, Date oldTimestamp)throws AppException {
		Connection conn = null;
		PreparedStatement stmt = null;
		SQLRunner sqlRunner = SQLRunner.getInstance();
		try {
			conn = ApiDbConnection.getConnection();
			int index = 1;
			String sql = "update XXX ";
			stmt = sqlRunner.prepareStatement(conn, sql);
			//stmt.setString(index++, vo${entityName}.getApiSecret());

			int rows = sqlRunner.executeUpdate(stmt);
			return rows;
		} catch (SQLException e) {
			throw new AppException("global.error.sql-error",SQLUtil.getSQLExceptionParams(e));
		} finally {
			sqlRunner.close(stmt);
			sqlRunner.close(conn);
		}
	}

	@Override
	public Vo${entityName} get${entityName}ByPk(String ${entityName}) throws AppException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		SQLRunner sqlRunner = SQLRunner.getInstance();
		try {
			conn = ApiDbConnection.getConnection();
			String sql = "select XXX";
			stmt = sqlRunner.prepareStatement(conn,sql);
			stmt.setString(1,${entityName});
			rs = sqlRunner.executeQuery(stmt);
			List<Vo${entityName}> ${entityName}s = obtain${entityName}FromResultSet(rs, sqlRunner);
			if(${entityName}s.size()>0){
				return ${entityName}s.get(0);
			}
		}catch(SQLException e){
			logger.error(e, e);
			throw new AppException("global.error.sql-error",SQLUtil.getSQLExceptionParams(e));
		}finally {
			sqlRunner.close(rs);
			sqlRunner.close(stmt);
			sqlRunner.close(conn);
		}
		return null;
	}
	
	@Override
	public int updateVerify${entityName}(Vo${entityName} vo${entityName}, Date oldTimestamp)throws AppException {
		Connection conn = null;
		PreparedStatement stmt = null;
		SQLRunner sqlRunner = SQLRunner.getInstance();
		try {
			conn = ApiDbConnection.getConnection();
			int index = 1;
			String sql = "update XXX";
			stmt = sqlRunner.prepareStatement(conn, sql);
			//stmt.setString(index++, vo${entityName}.getApiSecret());

			int rows = sqlRunner.executeUpdate(stmt);
			return rows;
		} catch (SQLException e) {
			throw new AppException("global.error.sql-error",SQLUtil.getSQLExceptionParams(e));
		} finally {
			sqlRunner.close(stmt);
			sqlRunner.close(conn);
		}
	}
	@Override
	public int updateVerifyStatus(Vo${entityName} vo${entityName}, Date oldTimestamp)throws AppException {
		Connection conn = null;
		PreparedStatement stmt = null;
		SQLRunner sqlRunner = SQLRunner.getInstance();
		try {
			conn = ApiDbConnection.getConnection();
			String sql =
				"update XXX "
				+ " set UPDATE_TIME = ?, VERIFY_TIME = ?, VERIFY_BY = ?, DATA_STATUS = ?, DATA_ACTIVE = ? "
				+ " where XXX = ? and UPDATE_TIME = ?";
			stmt = sqlRunner.prepareStatement(conn, sql);
			int index = 1;
			stmt.setTimestamp(index++, new java.sql.Timestamp(DateUtil.getGMTTimestamp().getTime().getTime()), DateUtil
					.getGMTCalendar());
			stmt.setTimestamp(index++, new java.sql.Timestamp(DateUtil.getGMTTimestamp().getTime().getTime()), DateUtil
					.getGMTCalendar());
			stmt.setString(index++, vo${entityName}.getVerifyBy());
			stmt.setString(index++, vo${entityName}.getDataStatus());
			stmt.setString(index++, vo${entityName}.getDataActive());
			stmt.setString(index++, vo${entityName}.get${entityName}());
			stmt.setTimestamp(index++, new java.sql.Timestamp(oldTimestamp.getTime()), DateUtil.getGMTCalendar());
			int rows = sqlRunner.executeUpdate(stmt);
			return rows;
		} catch (SQLException e) {
			throw new AppException(SQL_ERROR, SQLUtil.getSQLExceptionParams(e));
		} finally {
			sqlRunner.close(stmt);
			sqlRunner.close(conn);
		}
	}
	@Override
	public int delete${entityName}(Vo${entityName} vo${entityName}, Date oldTimestamp)throws AppException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		SQLRunner sqlRunner = SQLRunner.getInstance();
		try {
			conn = ApiDbConnection.getConnection();
			String sql = "delete from XXX where XXX = ? and UPDATE_TIME = ?";
			stmt = sqlRunner.prepareStatement(conn, sql);
			int index = 1;
			stmt.setString(index++,vo${entityName}.get${entityName}());
			stmt.setTimestamp(index++, new java.sql.Timestamp(oldTimestamp.getTime()), DateUtil.getGMTCalendar());
			return sqlRunner.executeUpdate(stmt);
		}catch(SQLException e){
			logger.error(e, e);
			throw new AppException("global.error.sql-error",SQLUtil.getSQLExceptionParams(e));
		}finally {
			sqlRunner.close(rs);
			sqlRunner.close(stmt);
			sqlRunner.close(conn);
		}
	}
	@Override
	public int updateStatusAndXml(Vo${entityName} vo${entityName}, Date oldTimestamp)throws AppException {
		Connection conn = null;
		PreparedStatement stmt = null;
		SQLRunner sqlRunner = SQLRunner.getInstance();
		try {
			conn = ApiDbConnection.getConnection();
			String sql =
				"update XXX "
				+ " set UPDATE_TIME = ?, UPDATE_BY = ?, DATA_STATUS = ?, DATA_XML = ? "
				+ " where XXX = ? and UPDATE_TIME = ? ";
			stmt = sqlRunner.prepareStatement(conn, sql);
			int index = 1;
			stmt.setTimestamp(index++, new java.sql.Timestamp(DateUtil.getGMTTimestamp().getTime().getTime()), DateUtil.getGMTCalendar());
			stmt.setString(index++, vo${entityName}.getUpdateBy());
			stmt.setString(index++, vo${entityName}.getDataStatus());
			sqlRunner.setClob(stmt, index++, vo${entityName}.getDataXml());
			stmt.setString(index++,vo${entityName}.get${entityName}());
			stmt.setTimestamp(index++, new java.sql.Timestamp(oldTimestamp.getTime()), DateUtil.getGMTCalendar());
			int rows = sqlRunner.executeUpdate(stmt);
			return rows;
		} catch (SQLException e) {
			throw new AppException(SQL_ERROR, SQLUtil.getSQLExceptionParams(e));
		} finally {
			sqlRunner.close(stmt);
			sqlRunner.close(conn);
		}
	}
	@Override
	public int updateStatus(Vo${entityName} vo${entityName}, Date oldTimestamp) throws AppException{
		Connection conn = null;
		PreparedStatement stmt = null;
		SQLRunner sqlRunner = SQLRunner.getInstance();
		try {
			// Get connection from connection pool.
			conn = ApiDbConnection.getConnection();
			String sql ="update XXX "
					+ " set UPDATE_TIME = ?, UPDATE_BY = ?, DATA_STATUS = ? "
					+ " where XXX = ? and UPDATE_TIME = ? ";
			stmt = sqlRunner.prepareStatement(conn, sql);
			int index = 1;
			stmt.setTimestamp(index++, 
						new java.sql.Timestamp(DateUtil.getGMTTimestamp().getTime().getTime()), 
						DateUtil.getGMTCalendar());
			stmt.setString(index++, vo${entityName}.getUpdateBy());
			stmt.setString(index++, vo${entityName}.getDataStatus());
			stmt.setString(index++,vo${entityName}.get${entityName}());
			stmt.setTimestamp(index++, 
						new java.sql.Timestamp(oldTimestamp.getTime()), 
						DateUtil.getGMTCalendar());
			int rows = sqlRunner.executeUpdate(stmt);
			return rows;
		} catch (SQLException e) {
			throw new AppException(SQL_ERROR, SQLUtil.getSQLExceptionParams(e));
		} finally {
			sqlRunner.close(stmt);
			sqlRunner.close(conn);
		}
	}
	
}
