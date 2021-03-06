<%@ page pageEncoding="utf-8"%>
<link rel="icon" type="image/ico" href="<%=request.getContextPath()%>/assets/images/favicon.ico" />
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
<script src="<%=request.getContextPath()%>/assets/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/vendor/bootstrap/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/vendor/mmenu/js/jquery.mmenu.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/vendor/sparkline/jquery.sparkline.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/vendor/nicescroll/jquery.nicescroll.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/vendor/animate-numbers/jquery.animateNumbers.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/vendor/videobackground/jquery.videobackground.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/vendor/blockui/jquery.blockUI.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/vendor/datatables/ColReorderWithResize.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/vendor/datatables/colvis/dataTables.colVis.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/vendor/datatables/tabletools/ZeroClipboard.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/vendor/datatables/tabletools/dataTables.tableTools.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/vendor/datatables/dataTables.bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/vendor/chosen/chosen.jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/vendor/parsley/parsley.min.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {

        var isIE = function(ver){
            var b = document.createElement('b')
            b.innerHTML = '<!—[if lte IE ' + ver + ']><i></i><![endif]—>'
            return b.getElementsByTagName('i').length === 1
        }



        if(isIE(8)){
            var parEle = document.createElement('p');
            parEle.innerHTML = "本系统不支持IE8，建议升级或使用谷歌、火狐等浏览器！";
            parEle.style.color = "white";
            parEle.style.fontSize = "12px";
            parEle.style.backgroundColor = "orange";
            parEle.style.textAlign = "center";
            parEle.style.paddingTop = "5px";
            parEle.style.paddingBottom = "5px";
            var first = document.body.firstChild;//得到页面的第一个元素
            document.body.insertBefore(parEle,first);//在得到的第一个元素之前插入
        }
    });

</script>
