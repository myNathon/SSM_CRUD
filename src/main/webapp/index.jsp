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
        <div class="col-md-6" id="page_info_area"></div>
        <%--page bar--%>
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=basePath%>/static/js/jquery-3.2.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=basePath%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<script>
    // 页面请求完，直接发送 ajax 请求
    $(function () {
        // 首页
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url: "<%=basePath%>/emps",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                // 1、解释数据并显示数据
                build_emps_table(result);
                // 2、解释显示分页的信息
                build_page_info(result);
                // 3、解释显示分页条
                build_page_nav(result);
            }
        });
    }

    function build_emps_table(result) {
        // clean table body
        $("#emps_table tbody").empty();

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

    function build_page_info(result) {
        // clean page info area
        $("#page_info_area").empty();

        // 当前 0 页, 总 0 页, 共 0 条记录
        var pInfo = "当前 " + result.extend.pageInfo.pageNum + " 页, 总 " +
            result.extend.pageInfo.pages + " 页, 共 " +
            result.extend.pageInfo.total + " 条记录";
        $('#page_info_area').append(pInfo);
    }

    function build_page_nav(result) {
        // clean page nav area
        $("#page_nav_area").empty();

        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append('首页'));
        var prePageLi = $("<li></li>").append($("<a></a>").append($('<span></span>').append('&laquo;')));
        if(false === result.extend.pageInfo.hasPreviousPage) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            // click event
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append($('<span></span>').append('&raquo;')));
        var lastPageLi = $("<li></li>").append($("<a></a>").append('末页'));
        if(false === result.extend.pageInfo.hasNextPage) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            // click event
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(item === result.extend.pageInfo.pageNum) {
                numLi.addClass("active");
            } else {
                // click event
                numLi.click(function () {
                    to_page(item);
                });
            }

            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
</script>
</body>
</html>