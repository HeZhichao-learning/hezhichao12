<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/12/18
  Time: 8:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
  <head>
    <title>list</title>
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css">
  </head>
  <body>
  <div class="container mt-5">
    <h2>商品信息列表</h2>
    <form action="Goods?flag=get" method="post">
      <input type="text" name="name" placeholder="输入查询名称">
      <input type="submit" value="查询" class="btn btn-primary">
    </form>
    <table class="table table-striped">
      <thead>
      <tr>
        <th scope="col">ID</th>
        <th scope="col">name</th>
        <th scope="col">price</th>
        <th scope="col">intro</th>
        <th scope="col">type_id</th>
        <th scope="col">typename</th>
        <th scope="col">删除</th>
        <th scope="col">修改</th>
      </tr>
      </thead>
      <tbody id="studentTableBody">
      <c:forEach var="s" items="${list}">
        <tr>
          <td>${s.id}</td>
          <td>${s.name}</td>
          <td>${s.price}</td>
          <td>${s.intro}</td>
          <td>${s.type_id}</td>
          <td>${s.typename}</td>
          <td><a href="${ctx}/Goods?flag=delete&id=${s.id}&pno=${pno}" class="btn btn-danger">删除</a></td>
          <td><a href="${ctx}/Goods?flag=edit&id=${s.id}&pno=${pno}" class="btn btn-success">修改</a></td>
        </tr>
      </c:forEach>

      </tbody>
    </table>




    <ul class="pagination">
      <li><a href="${ctx}/Goods?pno=${pno-1>0?pno-1:1}"><<</a></li>
      <c:forEach var="i" begin="1" end="${pcount}">
        <li><a href="${ctx}/Goods?pno=${i}">${i}</a></li>
      </c:forEach>
      <li><a href="${ctx}/Goods?pno=${pno<pcount?pno+1:pcount}">>></a></li>
    </ul>

    
  </div>

  </body>
</html>
