<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/6/8
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<html>
<head>
    <title>秒杀详情页</title>
    <%@include file="common/head.jsp"%> <%--静态包含--%>
</head>
<body>
    <%--页面显示部分--%>
    <div class="container">
        <div class="panel panel-default text-center">
            <div class="pannel-heading">
                <h1>${seckill.name}</h1>
            </div>
            <div class="panel-body">
                <h2 class="text-danger">
                    <%--显示time图标--%>
                    <span class="glyphicon glyphicon-time"></span>
                    <%--展示倒计时--%>
                    <span class="glyphicon" id="seckill-box"></span>
                </h2>

            </div>
        </div>
    </div>

    <%--模态弹出框--%>
    <div id="killPhoneModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-body text-center">
                        <span class="glyphicon glyphicon-phone"></span>秒杀电话：
                    </h3>
                </div>
                <div class="modal-body">
                  <div class="row">
                      <div class="col-xs-8 col-xs-offset-2">
                          <input type="text" name="killPhone" id="killPhoneKey" placeholder="填手机号" class="form-control">
                      </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <%--验证信息--%>
                    <span id="killPhoneMessage" class="glyphicon"></span>
                    <button type="button" id="killPhoneBtn" class="btn btn-success">
                        <span class="glyphicon glyphicon-phone"></span>
                        Submit
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<%--cdn地址 jq cookie需要--%>
<script src="//cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
 <%--cdn地址 jq 倒计时--%>
<script src="//cdn.bootcss.com/jquery.countdown/2.1.0/jquery.countdown.min.js"></script>

<%--开始编写交互逻辑--%>
<script src="/resource/script/seckill.js" type="text/javascript"></script>

<script type="text/javascript">
    $(function () {
        //使用EL表达式传入参数
        seckill.detail.init({
            seckillId : ${seckill.seckillId},
            startTime : ${seckill.startTime.time},//毫秒
            endTime : ${seckill.endTime.time}
        })
    })
    
</script>

</body>
</html>
