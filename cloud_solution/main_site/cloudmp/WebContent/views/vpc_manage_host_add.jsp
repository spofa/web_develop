<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!-- vpc_manage_host_add.jsp -->
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
            

            <h2><i class="fa fa-desktop"></i> 添加主机</h2>
            

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
                    <h3>输入主机信息</h3>
                    <div class="controls">
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->

                  <!-- tile body -->
                  <div class="tile-body">
                    
                    <form class="form-horizontal form2" role="form" parsley-validate id="host_options">
                      <div class="form-group">
                        <label for="input01" class="col-sm-2 control-label">CPU核心数 *</label>
                        <div class="col-sm-8">
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="cpuCore" id="optionsRadios1" value="1" checked>
                            <label for="optionsRadios1">1核</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="cpuCore" id="optionsRadios2" value="2">
                            <label for="optionsRadios2">2核</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="cpuCore" id="optionsRadios3" value="4">
                            <label for="optionsRadios3">4核</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="cpuCore" id="optionsRadios4" value="8">
                            <label for="optionsRadios4">8核</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="cpuCore" id="optionsRadios5" value="16">
                            <label for="optionsRadios5">16核</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="cpuCore" id="optionsRadios6" value="32">
                            <label for="optionsRadios6">32核</label>
                          </div> 
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label for="input01" class="col-sm-2 control-label">内存 *</label>
                        <div class="col-sm-8"> 
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="memory" id="optionsRadios12" value="1" checked>
                            <label for="optionsRadios12">1GB</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="memory" id="optionsRadios13" value="2">
                            <label for="optionsRadios13">2GB</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="memory" id="optionsRadios14" value="4">
                            <label for="optionsRadios14">4GB</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="memory" id="optionsRadios15" value="8">
                            <label for="optionsRadios15">8GB</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="memory" id="optionsRadios16" value="16">
                            <label for="optionsRadios16">16GB</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="memory" id="optionsRadios17" value="32">
                            <label for="optionsRadios17">32GB</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="memory" id="optionsRadios18" value="64">
                            <label for="optionsRadios18">64GB</label>
                          </div>

                           
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label for="input01" class="col-sm-2 control-label">数据磁盘 *</label>
                        <div class="col-sm-8"> 
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="dataDisk" id="optionsRadios31" value="10" checked onclick="$('#diskdiy').attr('disabled','disabled');$('#diskdiy').val('')">
                            <label for="optionsRadios31">10G</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="dataDisk" id="optionsRadios32" value="20" onclick="$('#diskdiy').attr('disabled','disabled');$('#diskdiy').val('')">
                            <label for="optionsRadios32">20G</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="dataDisk" id="optionsRadios33" value="50" onclick="$('#diskdiy').attr('disabled','disabled');$('#diskdiy').val('')">
                            <label for="optionsRadios33">50G</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="dataDisk" id="optionsRadios34" value="100" onclick="$('#diskdiy').attr('disabled','disabled');$('#diskdiy').val('')">
                            <label for="optionsRadios34">100G</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="dataDisk" id="optionsRadios35" value="200" onclick="$('#diskdiy').attr('disabled','disabled');$('#diskdiy').val('')">
                            <label for="optionsRadios35">200G</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="dataDisk" id="optionsRadios36" value="500" onclick="$('#diskdiy').attr('disabled','disabled');$('#diskdiy').val('')">
                            <label for="optionsRadios36">500G</label>
                          </div>
                          <div class="radio radio-transparent col-md-2"  >
                            <input type="radio" name="dataDisk" id="optionsRadios37" value="" onclick="$('#diskdiy').removeAttr('disabled')">
                            <label for="optionsRadios37" style="float:left;min-width:64px;">自定义</label>
                          
                        
                          </div>
                       <div class="col-sm-3">
                          <input type="text" class="form-control" id="diskdiy" name="diskdiy" disabled="disabled" parsley-trigger="change" parsley-required="true"  parsley-type="integer" parsley-max="1000" parsley-validation-minlength="1">
                        </div>		                   
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label for="input01" class="col-sm-2 control-label">带宽 *</label>
                        <div class="col-sm-8"> 
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="bandwidth" id="optionsRadios43" value="1" checked onclick="$('#bandwidthdiy').attr('disabled','disabled');$('#bandwidthdiy').val('')">
                            <label for="optionsRadios43">1M</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="bandwidth" id="optionsRadios38" value="2" onclick="$('#bandwidthdiy').attr('disabled','disabled');$('#bandwidthdiy').val('')">
                            <label for="optionsRadios38">2M</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="bandwidth" id="optionsRadios39" value="4" onclick="$('#bandwidthdiy').attr('disabled','disabled');$('#bandwidthdiy').val('')">
                            <label for="optionsRadios39">4M</label>
                          </div>
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="bandwidth" id="optionsRadios40" value="6" onclick="$('#bandwidthdiy').attr('disabled','disabled');$('#bandwidthdiy').val('')">
                            <label for="optionsRadios40">6M</label>
                          </div>
                          <div class="radio radio-transparent col-md-4">
                            <input type="radio" name="bandwidth" id="optionsRadios41" value="10" onclick="$('#bandwidthdiy').attr('disabled','disabled');$('#bandwidthdiy').val('')">
                            <label for="optionsRadios41">10M</label>
                          </div> 
                          <div class="radio radio-transparent col-md-2">
                            <input type="radio" name="bandwidth" id="optionsRadios42" value="" onclick="$('#bandwidthdiy').removeAttr('disabled')">
                            <label for="optionsRadios42" style="float:left;min-width:64px;">自定义</label>                         
                          </div>
                          <div class="col-sm-3">
                          <input type="text" class="form-control" id="bandwidthdiy" name=bandwidthdiy disabled="disabled" parsley-trigger="change" parsley-required="true"  parsley-type="integer" parsley-max="1000" parsley-validation-minlength="1">
                        </div>
                        </div>
                      </div>
                         
                    <div class="form-group">
                        <label for="input07" class="col-sm-2 control-label">镜像 *</label>
                        <div class="col-sm-4" id="selectbox">
                          <select class="chosen-select chosen-transparent form-control" name="sysImageId" id="input07" parsley-trigger="change" parsley-required="true" parsley-error-container="#selectbox">
                            <option value="">请选择镜像</option> 
                            <c:forEach items="${imageList }" var="sdi">
                                 	<c:if test="${sdi.realImageId!=null }">
                                 		<option value="${sdi.id }">${sdi.displayName }</option>
                                 	</c:if>
                             </c:forEach>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                            <label for="hostAmount" class="col-sm-2 control-label">创建数量 *</label>
                            <div class="col-sm-3">
                              <input type="text" class="form-control" id="hostAmount" name="hostAmount" parsley-trigger="change" parsley-required="true" parsley-minlength="1" parsley-type="integer" parsley-max="15" parsley-validation-minlength="1" value="1">
                            </div>
                       </div>  
                       <div class="form-group form-footer footer-white">
                        <div class="col-sm-offset-4 col-sm-8">
                          <button id="create_btn" type="button" class="btn btn-greensea" onclick="addHost();"><i class="fa fa-plus"></i>
                              <span> 添 加 </span></button>
                          <button id="reset_btn" type="reset" class="btn btn-red"><i class="fa fa-refresh"></i>
                              <span> 重 置 </span></button>
                        </div>
                      </div>
                    </form>

                  </div>
                  <!-- /tile body -->
                  
                


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






	<script type="text/javascript" src="<%=request.getContextPath()%>/js/custom/hostwarehouseform.js"></script>
	
    <script type="text/javascript">
    var isCommited = false;
    var path = "<%=request.getContextPath()%>";
    var vpcId = "${vpcId}";
    $(function(){
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
      });
	  
      $("#create_new_host_type").click(function(){
    	  location.href = path+"/chcm/addpage";
      });
    })
    //-------------------------------
      function addHost(){
		var form = jQuery("#host_options");
		form.parsley('validate');
		if(form.parsley('isValid')){
			var cpu_core = $("input[name='cpuCore']:checked").val();
			var memory = $("input[name='memory']:checked").val();
			var data_disk = $("input[name='dataDisk']:checked").val();
			var data_disk_diy = $("#diskdiy").val();
			var bandwidth = $("input[name='bandwidth']:checked").val();
			var bandwidth_diy = $("#bandwidthdiy").val();
			var host_amount = $("#hostAmount").val();
			var image = $("#input07").val();
			if(data_disk==""){
				data_disk = data_disk_diy;
			}
			if(bandwidth==""){
				bandwidth = bandwidth_diy;
			}
    		if(isCommited){
         		return false;
    		} 
    		isCommited = true;
			jQuery.ajax({
				url: path+'/vpc/addHostToVpc',
				type: 'post', 
				data:{hostAmount:host_amount,vpcId:vpcId,cpuCore:cpu_core,memory:memory,dataDisk:data_disk,bandwidth:bandwidth,sysImageId:image},
				dataType: 'json',
				timeout: 10000,
				async: false,
				success:function(data){
					if(data.status == "success"){
						window.history.go(-1);
					}else if(data.status == "fail"){
						isCommited = false;
						$("#tipscontent").html("创建失败");
	         		    $("#dia").click();
						return false;
					}
				}
			});
		}
		        	
    }
    </script>
    
  </body>
</html>
      

