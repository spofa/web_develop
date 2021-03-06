package com.zhicloud.op.service.impl;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.transaction.annotation.Transactional;

import com.zhicloud.op.app.authorization.PrivilegeConstant;
import com.zhicloud.op.app.helper.LoginHelper;
import com.zhicloud.op.app.helper.ServiceHelper;
import com.zhicloud.op.common.util.StringUtil;
import com.zhicloud.op.exception.AppException;
import com.zhicloud.op.login.LoginInfo;
import com.zhicloud.op.mybatis.mapper.AgentMapper;
import com.zhicloud.op.mybatis.mapper.OperLogMapper;
import com.zhicloud.op.mybatis.mapper.TerminalUserMapper;
import com.zhicloud.op.remote.BeanDirectCallableDefaultImpl;
import com.zhicloud.op.remote.Callable;
import com.zhicloud.op.service.OperLogService;
import com.zhicloud.op.service.constant.AppConstant;
import com.zhicloud.op.vo.AgentVO;
import com.zhicloud.op.vo.OperLogVO;
import com.zhicloud.op.vo.TerminalUserVO;
@Transactional(readOnly = true)
public class OperLogServiceImpl extends BeanDirectCallableDefaultImpl implements OperLogService {
	
	public static final Logger logger = Logger.getLogger(OperatorServiceImpl.class);

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession)
	{
		this.sqlSession = sqlSession;
	}

	@Callable
	public String managePage(HttpServletRequest request, HttpServletResponse response)
	{
		logger.debug("OperLogServiceImpl.managePage()"); 
		Integer userType = Integer.valueOf(request.getParameter("userType"));
		String strType = request.getParameter("type");
		Integer type = 0;
		
		if(strType != null){
		    type = Integer.valueOf(strType);
		}
		request.setAttribute("userType", userType); 
		if(userType==AppConstant.SYS_USER_TYPE_OPERATOR){
			String id = StringUtil.trim(request.getParameter("terminalUserId"));
			if(StringUtil.isBlank(id)){
				LoginInfo loginInfo = LoginHelper.getLoginInfo(request);
				if(loginInfo.hasPrivilege(PrivilegeConstant.view_all_user_oper_log) == false)
				{
					return "/public/have_not_access_dialog.jsp";
				}
				return "/security/operator/user_log.jsp";
			}
			else{
			    switch(type){
    			    case 3:
    			        AgentMapper agentMapper = this.sqlSession.getMapper(AgentMapper.class);
    	                AgentVO agent = agentMapper.getAgentById(id);
    	                if( agent == null )
    	                {
    	                    request.setAttribute("message", "找不到代理商的记录");
    	                    return "/public/warning_dialog.jsp";
    	                }
    	                request.setAttribute("agent", agent);
    			        break;
    			    case 4:
    			        TerminalUserMapper terminalUserMapper= this.sqlSession.getMapper(TerminalUserMapper.class);
    			        TerminalUserVO terminalUserVO =terminalUserMapper.getTerminalUserById(id);
    			        if( terminalUserVO == null )
    	                {
    	                    request.setAttribute("message", "找不到终端用户的记录");
    	                    return "/public/warning_dialog.jsp";
    	                }
    			        request.setAttribute("terminal", terminalUserVO);
    			        break;			    
			    }
			    
		        request.setAttribute("userId", id);
		        return "/security/operator/oper_log_manage.jsp";
			}
		}
		if(userType==AppConstant.SYS_USER_TYPE_TERMINAL_USER){			
			return "/security/user/oper_log_manage.jsp";
		}else if(userType==AppConstant.SYS_USER_TYPE_AGENT){
			TerminalUserMapper terminalUserMapper = this.sqlSession.getMapper(TerminalUserMapper.class);
			TerminalUserVO terminalUser = terminalUserMapper.getTerminalUserById(request.getParameter("terminalUserId"));
			if(terminalUser==null){				
				return "/security/agent/page_not_exists.jsp";
			}else{
				request.setAttribute("terminalUser", terminalUser);  
				return "/security/agent/oper_log_manage.jsp";			
				
			}
		}else{
			return "/public/page_not_exists.jsp";
		}
	}

	@Callable
	public void queryOperLog(HttpServletRequest request,HttpServletResponse response) {
		logger.debug("OperLogServiceImpl.queryOperator()");
		try
		{
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/json; charset=utf-8");

			// 获取参数
			Integer userType = Integer.valueOf(request.getParameter("userType"));
			String content = "";
			String userId = "";
			String status = "";
			String type = "";
			if(userType==AppConstant.SYS_USER_TYPE_TERMINAL_USER){		 
				LoginInfo loginInfo = LoginHelper.getLoginInfo(request);
				userId = loginInfo.getUserId();
			}else if(userType==AppConstant.SYS_USER_TYPE_AGENT){
				userId = request.getParameter("terminalUserId"); 	
				
			}else if(userType==AppConstant.SYS_USER_TYPE_OPERATOR){
				userId = request.getParameter("id");
				content = request.getParameter("content");
				status = request.getParameter("status");
				type = request.getParameter("type");
			}
			
			Integer page = StringUtil.parseInteger(request.getParameter("page"), 1) - 1; // 前台过来的是从1开始，需要的是从0开始
			Integer rows = StringUtil.parseInteger(request.getParameter("rows"), 10);
			String startTime = StringUtil.trim(request.getParameter("startTime"));
			String endTime = StringUtil.trim(request.getParameter("endTime"));

			// 查询数据库
			OperLogMapper operLogMapper = this.sqlSession.getMapper(OperLogMapper.class);
			Map<String, Object> condition = new LinkedHashMap<String, Object>();
			if(!StringUtil.isBlank(userId)) {
			    condition.put("userId", userId);			    
			}
			condition.put("start_row", page * rows);
			condition.put("row_count", rows);
			if(startTime.length() > 0){
			    condition.put("startTime", startTime);
			}
			if(endTime.length() > 0) {
			    condition.put("endTime", endTime);
			}
			if(!StringUtil.isBlank(content)){
				content = "%"+content+"%";
				condition.put("content", content);				
			}
			if(!StringUtil.isBlank(status)){ 
				condition.put("status", status);				
			}
			if(!StringUtil.isBlank(type)){
 				condition.put("type", type);				
			}
			int total = operLogMapper.queryPageCount(condition); // 总行数
			List<OperLogVO> operLogList = operLogMapper.queryPage(condition);// 分页结果

			// 输出json数据
			ServiceHelper.writeDatagridResultAsJsonTo(response.getOutputStream(), total, operLogList);
		}
		catch( Exception e )
		{
			logger.error(e);
			throw new AppException("查询失败");
		}

	}
	@Callable
	public String managePageForAgent(HttpServletRequest request, HttpServletResponse response)
	{
		logger.debug("OperLogServiceImpl.managePageForAgent()"); 
		Integer userType = Integer.valueOf(request.getParameter("userType"));
		LoginInfo loginInfo = LoginHelper.getLoginInfo(request);
		if(userType==AppConstant.SYS_USER_TYPE_AGENT){
			request.setAttribute("terminalUserId", loginInfo.getUserId());  
			return "/security/agent/oper_log_agent_manage.jsp";			
		}else{
			return "/public/page_not_exists.jsp";
		}
	}
	@Callable
	public void queryOperLogForAgent(HttpServletRequest request,HttpServletResponse response) {
		logger.debug("OperLogServiceImpl.queryOperaLogForAgent()");
		try
		{
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/json; charset=utf-8");

			// 获取参数
			String userId = request.getParameter("terminalUserId"); 	
			Integer page = StringUtil.parseInteger(request.getParameter("page"), 1) - 1; // 前台过来的是从1开始，需要的是从0开始
			Integer rows = StringUtil.parseInteger(request.getParameter("rows"), 10);
			String startTime = StringUtil.trim(request.getParameter("startTime"));
			String endTime = StringUtil.trim(request.getParameter("endTime")); 
			// 查询数据库
			OperLogMapper operLogMapper = this.sqlSession.getMapper(OperLogMapper.class);
			Map<String, Object> condition = new LinkedHashMap<String, Object>();
			condition.put("userId", userId);
			condition.put("start_row", page * rows);
			condition.put("row_count", rows);
			condition.put("startTime", startTime);
			condition.put("endTime", endTime);
			int total = operLogMapper.queryPageCount(condition); // 总行数
			List<OperLogVO> operLogList = operLogMapper.queryPage(condition);// 分页结果

			// 输出json数据
			ServiceHelper.writeDatagridResultAsJsonTo(response.getOutputStream(), total, operLogList);
		}
		catch( Exception e )
		{
			logger.error(e);
			throw new AppException("查询失败");
		}

	}

	/**
	 * 添加操作日志
	 * @see com.zhicloud.op.service.OperLogService#addNewOperLog(java.lang.String, java.lang.Integer, java.lang.String, java.lang.String, java.lang.String)
	 */
	@Transactional(readOnly = false)
	@Callable
	public void addNewOperLog(String userId, Integer status, String content,String resourceName, String operDuration) {
		
		OperLogMapper operLogMapper = this.sqlSession.getMapper(OperLogMapper.class);
		Map<String, Object> operLogData = new LinkedHashMap<String, Object>();
		operLogData.put("id", StringUtil.generateUUID());
		operLogData.put("userId", userId);
		operLogData.put("content", content);
		operLogData.put("operTime", StringUtil.dateToString(new Date(), "yyyyMMddHHmmssSSS"));
		operLogData.put("status", status);
		operLogData.put("resourceName", resourceName);
		operLogData.put("operDuration", operDuration);
		operLogMapper.addOperLog(operLogData);
		
	}
	
    @Callable
    public List<OperLogVO> queryOperLogForExport(HttpServletRequest request, HttpServletResponse response) {
        logger.debug("OperLogServiceImpl.queryOperLogForExport()");
        try {
            response.setCharacterEncoding("utf-8");
            response.setContentType("text/json; charset=utf-8");
            String content = request.getParameter("content");
            String status = request.getParameter("status");
            String type = request.getParameter("type");
            // 查询数据库
            OperLogMapper operLogMapper = this.sqlSession.getMapper(OperLogMapper.class);
            Map<String, Object> condition = new LinkedHashMap<String, Object>();
            int total = operLogMapper.queryPageCount(condition); // 总行数
            condition.put("start_row", 0);
            condition.put("row_count", total);
            if (!StringUtil.isBlank(content)) {
                content = "%" + content + "%";
                condition.put("content", content);
            }
            if (!StringUtil.isBlank(status)) {
                condition.put("status", status);
            }
            if (!StringUtil.isBlank(type)) {
                condition.put("type", type);
            }
            List<OperLogVO> operLogList = operLogMapper.queryPage(condition);// 分页结果
            return operLogList;
        } catch (Exception e) {
            logger.error(e);
            throw new AppException("查询失败");
        }

    }
}
