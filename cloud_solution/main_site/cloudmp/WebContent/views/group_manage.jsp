<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!-- group_manage.jsp -->
<html>
  <head>
    <title>控制台-${productName}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8" />

    <link rel="icon" type="image/ico" href="<%=request.getContextPath()%>/assets/images/favicon.ico" />
    <!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/assets/css/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/vendor/animate/animate.min.css">
    <link type="text/css" rel="stylesheet" media="all" href="<%=request.getContextPath()%>/assets/js/vendor/mmenu/css/jquery.mmenu.all.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/videobackground/css/jquery.videobackground.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/vendor/bootstrap-checkbox.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/rickshaw/css/rickshaw.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/morris/css/morris.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/tabdrop/css/tabdrop.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/summernote/css/summernote.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/summernote/css/summernote-bs3.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/chosen/css/chosen.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/js/vendor/chosen/css/chosen-bootstrap.css">

    <link href="<%=request.getContextPath()%>/assets/css/zhicloud.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="<%=request.getContextPath()%>/assets/js/html5shiv.js"></script>
      <script src="<%=request.getContextPath()%>/assets/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="bg-1">

 

    <!-- Preloader -->
    <div class="mask"><div id="loader"></div></div>
    <!--/Preloader -->

    <!-- Wrap all page content here -->
    <div id="wrap">

      


      <!-- Make page fluid -->
      <div class="row">
        




	<%@include file="/views/common/common_menus.jsp" %>
        
        <!-- Page content -->
        <div id="content" class="col-md-12">
          


          <!-- page header -->
          <div class="pageheader">
            

            <h2><i class="fa fa-users"></i> 群组管理</h2>
            

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
					<button type="button" class="btn btn-red delete" id="showCreateGroup">
                              <i class="fa fa-plus"></i>
                              <span> 新增分组 </span>
                    </button>
                    <button type="button" class="btn btn-green file-excel-o" onclick="exportData('/export/groupdata')">
                              <i class="fa fa-file-excel-o"></i>
                              <span>导出数据</span>
                    </button>                    
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
						    <th class="no-sort">
                            <div class="checkbox check-transparent">
                              <input type="checkbox" value="1" id="allchck">
                              <label for="allchck"></label>
                            </div>
                          </th>
                            <th class="sort-alpha">分组名</th>
                            <th class="sort-numeric">成员数</th>                            
                            <th class="sort-alpha">所属组名</th>
                            <th class="sort-numeric">分配云主机数</th>
                            <th class="sort-alpha">描述</th>
                            <th class="no-sort">操作</th>
                          </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sys_group_list}" var="sys_groups">
                        
                          <tr class="odd gradeX">
						          <td>
									<div class="checkbox check-transparent">
									  <input type="checkbox" value="${sys_groups.id }" id="${sys_groups.id }" amount="${sys_groups.amount}">
									  <label for="${sys_groups.id }"></label>
									</div>
                                 </td>
                                 <td class="cut">${sys_groups.groupName}</td>
                            	 <td class="cut">${sys_groups.amount}</td>
                            	 <td class="cut">${sys_groups.parentName}</td>
                            	 <td class="cut">${sys_groups.cloudHostAmount}</td>
                            	 <td class="cut">${sys_groups.description}</td>
                            	 <td>
                              <div class="btn-group">
                                  <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                    操作 <span class="caret"></span>
                                  </button>
                                  <ul class="dropdown-menu" role="menu"> 
			                        <li><a href="javascript:void(0);" onclick="itemGroupBtn('${sys_groups.id }');">成员管理</a></li>
			                        <li class="divider"></li> 
			                        <li><a href="javascript:void(0);" onclick="updateGroupBtn('${sys_groups.id }');">修改</a></li> 
			                        <li><a href="javascript:void(0);" onclick="deleteGroupBtn('${sys_groups.id }', ${sys_groups.amount});">删除</a></li>
                                  </ul>
                              </div>
                            </td>
                          </tr>
                        </c:forEach>
                        </tbody>
                      </table>
                      
                    </div>
                    
                    
                    
                  </div>
                  <!-- /tile body -->
					<div class="col-sm-2" style="margin-top: -40px;">
                        <div class="input-group table-options">
                          <select id="oper_select" class="chosen-select form-control">
                            <option value="">批量操作</option> 
                            <option value="del">删除</option>
                          </select>
                          <span class="input-group-btn">
                            <button class="btn btn-default" type="button" id="save_oper">提交</button>
                          </span>
                        </div>
                      </div>
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
                                <label style="align:center;" id="confirmcontent">确定要删除该主机配置吗？</label>
                               </div>

                            </form>
                          </div>
                          <div class="modal-footer">
                            <button class="btn btn-green"  id="confirm_btn" onclick="" data-dismiss="modal" aria-hidden="true">确定</button>
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



	<script type="text/javascript" src="<%=request.getContextPath()%>/js/custom/group.forms.js"></script>

    <script>
    var path = "<%=request.getContextPath()%>";
    var curId = "";
    var amount = 0;
    var ids = [];
    var amounts = [];
    var flag = false;
    $(function(){
      // Add custom class to pagination div
      $.fn.dataTableExt.oStdClasses.sPaging = 'dataTables_paginate pagination-sm paging_bootstrap paging_custom';
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
          $('.dataTables_filter').css("margin-top","-40px");
          $('.dataTables_filter').css("margin-bottom","0px");   
          $('.dataTables_filter input').attr("placeholder", "Search");
        }
      });
 
 

      /* Get the rows which are currently selected */
      function fnGetSelected(oTable01Local){
        return oTable01Local.$('tr.row_selected');
      };
	  $("div[class='col-md-4 text-right sm-center']").attr("class","tile-footer text-right");
	    
	  //==========
	  $("#showCreateGroup").click(function(){
 		  window.location.href = "${pageContext.request.contextPath}/group/add";
 	  });
	  
	  jQuery("#save_oper").click(function(){
		  	var option = jQuery("#oper_select").val();
		  	if(option=="del"){
				 var myids = [];
				 var datatable = $("#basicDataTable").find("tbody tr input[type=checkbox]:checked");
				 $(datatable).each(function(){
					 myids.push(jQuery(this).val());
                     amounts.push(jQuery(this).attr("amount"));
				 });
		        if(myids.length < 1){
		        	$("#tipscontent").html("请选择要删除的分组");
					$("#dia").click();
		       	 	return;
		        }

                $.each(amounts, function(n, value) {
                    console.info("value: " + value);
                   if (value != 0) {
                       flag = true;
                   }
                });

                amounts = [];
		        ids = myids;
                // 判断是否有成员
                if (flag) {
                    $("#confirmcontent").html("所选分组有包含用户成员的分组,确定要删除所选分组吗？");
                } else {
                    $("#confirmcontent").html("确定要删除所选分组吗？");
                }
                flag = false;
		    	$("#confirm_btn").attr("onclick","deleteMultGroup();");
		    	$("#con").click();
		  	}	
	     });
    })
    //群组详情
    function itemGroupBtn(id){
    	 window.location.href = "${pageContext.request.contextPath}/group/"+id+"/relation";
    }
    //更新群组
    function updateGroupBtn(id){
    	window.location.href = "${pageContext.request.contextPath}/group/"+id+"/updatepage";
    }
    //删除群组
    function deleteGroupBtn(id, amount){
    	curId = id;
        // 判断是否有成员
        if (amount > 0) {
            $("#confirmcontent").html("所选分组包含用户成员,确定要删除该分组吗？");
        } else {
            $("#confirmcontent").html("确定要删除该分组吗？");
        }

        $("#confirm_btn").attr("onclick","deleteGroup();");
        $("#con").click();
    }
    
      function deleteGroup(){
    	jQuery.get("${pageContext.request.contextPath}/group/"+curId+"/delete",
			function(data){
    			if(data.status=="success"){
					location.href = "${pageContext.request.contextPath}/group/all";
    			}else{
    				jQuery("#tipscontent").html(data.message);
	   		        jQuery("#dia").click();
    			}
		});	           			
		
    }
    
    function deleteMultGroup(){
   		jQuery.ajax({
   	        url: '<%=request.getContextPath()%>/group/deleteIds',
   	        type: 'post', 
   	        dataType: 'json',
   	        data:{ids:ids},
   	     	async: false,
   	        timeout: 10000,
   	        error: function()
   	        { 
   	        },
   	        success: function(result)	        
   	        {  
   	        	if(result.status=="success"){
	   	    		location.href = path + "/group/all";
   	        	}else{
   	        		$("#tipscontent").html(result.message);
	   				$("#dia").click();
   	        	}
   	        }
   	        
   	     });
    }
    $(function(){

        //check all checkboxes
        $('table thead input[type="checkbox"]').change(function () {
          $(this).parents('table').find('tbody input[type="checkbox"]').prop('checked', $(this).prop('checked'));
        });

        // sortable table
        $('.table.table-sortable th.sortable').click(function() {
          var o = $(this).hasClass('sort-asc') ? 'sort-desc' : 'sort-asc';
          $(this).parents('table').find('th.sortable').removeClass('sort-asc').removeClass('sort-desc');
          $(this).addClass(o);
        });

        //chosen select input
        $(".chosen-select").chosen({disable_search_threshold: 10});

        //check toggling
        $('.check-toggler').on('click', function(){
          $(this).toggleClass('checked');
        })
        
      });
    </script>
    
  </body>
</html>
      

