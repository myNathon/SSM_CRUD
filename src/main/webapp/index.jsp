<%--
  Created by IntelliJ IDEA.
  User: Nathon
  Date: 2017/9/12
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ --%>

    <%-- 设置，则说明下面使用的使用绝对路径 --%>
    <base href="<%=basePath%>">

    <title>员工列表</title>

    <!-- Bootstrap -->
    <link href="<%=basePath%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="/static/js/html5shiv.min.js"></script>
    <script src="/static/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <%--Title--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM_CRUD</h1>
        </div>
    </div>
    <%--button--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <a class="btn btn-primary">新增</a>
            <a class="btn btn-danger">删除</a>
        </div>
    </div>
    <%--table data--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--pagination--%>
    <div class="row">
        <%--page information--%>
        <div class="col-md-6">
            当前 0 页, 总 0 页, 共 0 条记录
        </div>
        <%--page bar--%>
        <div class="col-md-6">
            <%--<nav aria-label="Page navigation">--%>
                <%--<ul class="pagination">--%>
                    <%--<li><a href="<%=basePath%>/emps?pn=1">首页</a></li>--%>
                    <%--<c:if test="${pageInfo.hasPreviousPage}">--%>
                        <%--<li>--%>
                            <%--<a href="<%=basePath%>/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">--%>
                                <%--<span aria-hidden="true">&laquo;</span>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                    <%--</c:if>--%>
                    <%--<c:forEach items="${pageInfo.navigatepageNums}" var="pn">--%>
                        <%--<c:if test="${pn == pageInfo.pageNum}">--%>
                            <%--<li class="active"><a href="#">${pn}</a></li>--%>
                        <%--</c:if>--%>
                        <%--<c:if test="${pn != pageInfo.pageNum}">--%>
                            <%--<li><a href="<%=basePath%>/emps?pn=${pn}">${pn}</a></li>--%>
                        <%--</c:if>--%>
                    <%--</c:forEach>--%>
                    <%--<c:if test="${pageInfo.hasNextPage}">--%>
                        <%--<li>--%>
                            <%--<a href="<%=basePath%>/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">--%>
                                <%--<span aria-hidden="true">&raquo;</span>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                    <%--</c:if>--%>
                    <%--<li><a href="<%=basePath%>/emps?pn=${pageInfo.pages}">末页</a></li>--%>
                <%--</ul>--%>
            <%--</nav>--%>
        </div>
    </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=basePath%>/static/js/jquery-3.2.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=basePath%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<script>
    // 页面请求完，直接发送 ajax 请求
    $(function () {
       $.ajax({
           url: "<%=basePath%>/emps",
           data: "pn=1",
           type: "GET",
           success: function (result) {
               // 1、解释数据并显示数据
               build_emps_table(result);
               // 2、解释显示分页的信息
           }
       });
       
       function build_emps_table(result) {
           var emps = result.extend.pageInfo.list;
           $.each(emps, function (index, item) {
               var empIdTd = $("<td></td>").append(item.empId);
               var empNameTd = $("<td></td>").append(item.empName);
               var genderTd = $("<td></td>").append(item.gender === "M" ? "男" : "女");
               var emailTd = $("<td></td>").append(item.email);
               var deptNameTd = $("<td></td>").append(item.department.deptName);
               var editBtn = $("<a></a>").addClass("btn btn-primary btn-sm")
                   .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                   .append("编辑");
               var delBtn = $("<a></a>").addClass("btn btn-danger btn-sm")
                   .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                   .append("删除");
               var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);

               $("<tr></tr>").append(empIdTd)
                   .append(empNameTd)
                   .append(genderTd)
                   .append(emailTd)
                   .append(deptNameTd)
                   .append(btnTd)
                   .appendTo("#emps_table tbody");
           })
       }

       function build_page_nav(result) {

       }
    });
</script>
</body>
</html>