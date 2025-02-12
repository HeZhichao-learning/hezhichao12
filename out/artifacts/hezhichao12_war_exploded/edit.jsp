<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/12/18
  Time: 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>edit</title>
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css">

    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>

    <script>


        function checkname(name){
            $.post(
                "Goods?flag=checkname",
                {name1:name},
                function (data){
                    if(data==1){
                        $(".namemsg").html("用户名重复");

                    }
                    else{
                        $(".namemsg").html("不重复，可以使用")

                    }
                }
            );
        }

        </script>
</head>
<body>

<div class="container mt-5">
    <h2>商品信息修改</h2>
    <form action="${ctx}/Goods?flag=update&id=${g.id}" method="post">
        <div class="form-group">
            <label for="name">name</label>
            <input type="text" class="form-control" id="name" name="name" value="${g.name}">
            <span class="namemsg" style="color: red"></span>
        </div>
        <div class="form-group">
            <label for="price">price</label>
            <input type="number" class="form-control" id="price" name="price" value="${g.price}">
        </div>
        <div class="form-group">
            <label for="intro">intro</label>
            <input type="text" class="form-control" id="intro" name="intro" value="${g.intro}">
        </div>
        <div class="form-group">
            <label for="type_id">type ID</label>
            <input type="text" class="form-control" id="type_id" name="type_id" value="${g.type_id}">
        </div>
        <button type="submit" class="btn btn-primary">提交</button>
    </form>
</div>
</body>
</html>
