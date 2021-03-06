﻿<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- monitor_rack_manage.jsp -->
<html>
  <head>
    <title>资源监控——机架信息 </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
<%@include file="/views/common/common_menus.jsp" %>
<script type="text/javascript">
//查看服务器页面跳转
function serverquery(id){
	var obj = new Object();
	obj["areaid"] = "${params.areaid}";
	obj["roomid"] = "${params.roomid}";
	obj["menuflag"] = "room";
	obj["rackid"] = id;
	window.location.href = "<%=request.getContextPath()%>/monitor/serverquery?data="+JSON.stringify(obj);
}
function roomquery(){
	var obj = new Object();
	obj["areaid"] = "${params.areaid}";
	obj["roomid"] = "${params.roomid}";
	if(obj["areaid"]!=""){
		obj["menuflag"] = "room";
		window.location.href = "<%=request.getContextPath()%>/monitor/roomquery?data="+JSON.stringify(obj);
	}else{
		window.location.href = "<%=request.getContextPath()%>/monitor/roomquery";
	}
	
}
//根据状态查询数据
function statusquery(val){
	var data = new Object();
	data.status = val;
	data.areaid = "${params.areaid}";
	data.roomid = "${params.roomid}";
	data.rackid = "${params.rackid}";
	data.serverid = "${params.serverid}";
	data.type = "${params.type}";
	data.poolid = "${params.poolid}";
	data.menuflag = "${params.menuflag}";
	window.location.href = "<%=request.getContextPath() %>/monitor/rackquery?data="+JSON.stringify(data);
}
</script>
    <!-- Make page fluid -->
    <div class="row">
        <!-- Page content -->
        <div id="content" class="col-md-12">
          <!-- page header -->
          <div class="pageheader">
            <h2><i class="fa fa-signal"></i> 机架信息</h2>
          </div>
          <!-- /page header -->
          <!-- content main container -->
          <div class="main">
            <!-- row -->
            <div class="row">
              <!-- col 6 -->
          <div class="col-md-12">
				  <section class="tile color transparent-black">
 
                  <!-- tile header -->
                  <div class="tile-header"> 
                  <c:if test="${!empty params.roomid}">
                     <button type="button" class="btn btn-success delete" onclick="roomquery()">
                              <i class="fa fa-step-backward"></i>
                              <span> 返回机房</span>
                    </button>
                    </c:if>
                    <span class="label label-primary span2btn" onclick="statusquery('')">全部:${totalnum}</span>
                    <span class="label label-success span2btn" onclick="statusquery('normal')">正常:${statusdata.normal }</span>
                    <span class="label label-warning span2btn" onclick="statusquery('warning')">告警:${statusdata.warning }</span>
                    <span class="label label-danger span2btn" onclick="statusquery('error')">故障:${statusdata.error }</span>
<%--                     <span class="label label-default">屏蔽:${statusdata.stop }</span> --%>
                    <div class="controls">
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                    </div>
                   
                  </div>
                  <!-- /tile header -->

                        
                    
                       
                  <div class="tile-body no-vpadding"> 
                   
                    <div class="table-responsive">
                    
                      <table  class="table table-datatable table-custom" id="basicDataTable">
                        <thead>
                          <tr>
                          <c:if test="${empty params.menuflag }">
                          	<!-- <th class="no-sort">区域</th> -->
                          	<th class="no-sort">机房</th>
                          </c:if>
							<th class="no-sort">机架名</th>
							<th class="no-sort">CPU总核心数</th>
							<th class="no-sort">CPU利用率</th>
							<th class="no-sort">内存利用率</th>
							<th class="no-sort">磁盘利用率</th>
                            <th class="no-sort">服务器数量</th>
                            <th class="no-sort">当前状态</th>
                            <th class="no-sort">操作</th>
                          </tr>
                        </thead>
                        <tbody>
                        
					<c:forEach items="${rackList}" var="rack">
                    		<tr class="odd gradeX">
	                          <c:if test="${empty params.menuflag }">
	                          	<%-- <th class="no-sort">${rack.areaname }</th> --%>
	                          	<th class="no-sort">${rack.roomname }</th>
	                          </c:if>                    		
                            <td class="cut">${rack.name }</td>
                            <td class="cut">${rack.cpu_count }</td>
                            <td class="cut">${rack.cpu_usage }</td>
                            <td class="cut">${rack.memory_usage }</td>
                            <td class="cut">${rack.disk_usage }</td>
                            <td class="cut">${rack.servers }</td>
                            <td class="cut">
                            	<c:if test="${rack.status=='normal' }">
                            		<span class="label label-success">正&nbsp;&nbsp;常</span>
                            	</c:if>
                            	<c:if test="${rack.status=='warning' }">
                            		<span class="label label-warning">告&nbsp;&nbsp;警</span>
                            	</c:if>
                            	<c:if test="${rack.status=='error' }">
                            		<span class="label label-danger">故&nbsp;&nbsp;障</span>
                            	</c:if>                            	
                            </td>
							<td> 
                            <button type="button" class="btn btn-red btn-xs" onclick="serverquery('${rack.uuid}')">查看服务器信息</button>
                            </td>                                                        
                        </tr> 
                    	</c:forEach>                         
                        </tbody>
                      </table>
                      
                    </div>
                    
                  </div>
                  <!-- /tile body -->
                     <!-- 修改密码弹出框 -->    
                    
                <!-- 设置用户状态弹出框 -->    
				<!-- 批量设置用户状态弹出框 -->    
				<!-- 设置用户USB权限弹出框 -->    
				<!-- 批量设置用户USB权限弹出框 -->    
                    
                                                           
				<div class="tile-body">
                    <a href="#modalDialog" id="dia" role="button"  data-toggle="modal"> </a>
                    <a href="#modalConfirm" id="con" role="button"   data-toggle="modal"> </a>
                    <div class="modal fade" id="modalDialog" tabindex="-1" role="dialog" aria-labelledby="modalDialogLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content" style="width:60%;margin-left:20%;">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Close</button>
                            <h3 class="modal-title" id="modalDialogLabel"><strong>提示</strong></h3>
                          </div>
                          <div class="modal-body">
                            <p id="tipscontent"></p>
                          </div>
                        </div><!-- /.modal-content -->
                      </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->

                    <div class="modal fade" id="modalConfirm" tabindex="-1" role="dialog" aria-labelledby="modalConfirmLabel" aria-hidden="true"  >
                      <div class="modal-dialog">
                        <div class="modal-content" style="width:60%;margin-left:20%;">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Close</button>
                            <h3 class="modal-title" id="modalConfirmLabel"><strong>确认</strong> </h3>
                          </div>
                          <div class="modal-body">
                            <form role="form">   

                              <div class="form-group">
                                <label style="align:center;" id="confirmcontent">确定要删除所选数据？</label>
                               </div>

                            </form>
                          </div>
                          <div class="modal-footer">
                            <button class="btn btn-green"   onclick="deleterules()" data-dismiss="modal" aria-hidden="true">确定</button>
                            <button class="btn btn-red" data-dismiss="modal" aria-hidden="true">取消</button>
                            
                          </div>
                        </div><!-- /.modal-content -->
                      </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->    
                                        
                    </div>
                </section>
              </div>
           

            </div>
            <!-- /row -->

          </div>
          <!-- /content container -->






        </div>
        <!-- Page content end -->




      </div>
      <!-- Make page fluid-->




    </div>
    <!-- Wrap all page content end -->



    <section class="videocontent" id="video"></section>




    <script>
    $(function(){
       //check all checkboxes
       $('table thead input[type="checkbox"]').change(function () {
         $(this).parents('table').find('tbody input[type="checkbox"]').prop('checked', $(this).prop('checked'));
       });
      // Add custom class to pagination div
      $.fn.dataTableExt.oStdClasses.sPaging = 'dataTables_paginate pagination-sm paging_bootstrap paging_custom';
	  var oper = '';
      /*************************************************/
      /**************** BASIC DATATABLE ****************/
      /*************************************************/

      /* Define two custom functions (asc and desc) for string sorting */
      jQuery.fn.dataTableExt.oSort['string-case-asc']  = function(x,y) {
          return ((x < y) ? -1 : ((x > y) ?  1 : 0));
      };
       
      jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x,y) {
          return ((x < y) ?  1 : ((x > y) ? -1 : 0));
      };
 

      /* Build the DataTable with third column using our custom sort functions */
      var oTable01 = $('#basicDataTable').dataTable({
        "sDom":
          "R<'row'<'col-md-6'l><'col-md-6'f>r>"+
          "t"+
          "<'row'<'col-md-4 sm-center'i><'col-md-4'><'col-md-4 text-right sm-center'p>>",
        "oLanguage": {
          "sSearch": "搜索"
        },
        "aaSorting": [],
        "aoColumnDefs": [
                         { 'bSortable': false, 'aTargets': [ "no-sort" ] }
                       ], 
        "fnInitComplete": function(oSettings, json) { 
            $('.dataTables_filter').css("text-align","right");
            var temroomid = "${params.roomid}";
            if(temroomid!=""){
            	$('.dataTables_filter').css("margin-top","-40px");
            }else{
            	$('.dataTables_filter').css("margin-top","-40px");
            }
            $('.dataTables_filter').css("margin-bottom","0px");   
            $('.dataTables_filter input').attr("placeholder", "Search");
        }
      });

      /* Get the rows which are currently selected */
      function fnGetSelected(oTable01Local){
        return oTable01Local.$('tr.row_selected');
      };
	  $("div[class='col-md-4 text-right sm-center']").prepend(oper);
	    $("div[class='col-md-4 text-right sm-center']").attr("class","tile-footer text-right");
    })
   
    </script>
    
  </body>
</html>
      
