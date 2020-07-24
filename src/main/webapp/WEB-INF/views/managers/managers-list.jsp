<%--
  Created by IntelliJ IDEA.
  User: TOSHIBA
  Date: 23/07/2020
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Title</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome.min.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <style>
        .aColor {
            color: #000000;
        }

        .space_Section {
            margin-top: 20px;
        }

        .bg-black {
            background-color: #000000!important;
        }

        .bg-cool-blue {
            background-color: #a0e5e8!important;
        }

        .icon-drop-user {
            margin-right: 10px;
        }
        .icon-menu-space{
            margin-right: 50px;
        }

        .article{
            text-align: justify;
            font-style: italic;
            font-family: cursive;
            background-color: #ececec;
        }
        .tag-item {
            position: relative;
            border-right-width: 0px;
            border-radius: 15px;
            background-color: #000000;
            color: white;
            border-color: #9327ff;
        }




    </style>
</head>
<body>
<div class="fluid">
    <c:choose>
        <c:when test="${role == 'Admin'}">
            <jsp:include page="../includes/main-navbar.jsp" />
        </c:when>
        <c:when test="${role == 'Normal'}">
            <jsp:include page="../includes/main-navbar.jsp" />
        </c:when>
    </c:choose>
    <div class="jumbotron jumbotron-fluid bg-cool-blue">
        <div class="container">
            <h1 class="display-4 aColor">
                Managers
            </h1>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <input type="button" style="float: left; border-radius: 50px;" value="Nouveau Manager"
                       onclick="window.location.href='${pageContext.request.contextPath}/employee/add'; return false;"
                       class="btn btn-primary" />

                <input type="button" style="float: right;border-radius: 50px;" value="Consultation Employees"
                       onclick="window.location.href='${pageContext.request.contextPath}/employee/home'; return false;"
                       class="btn btn-primary" />

            </div>
        </div>
        <div class="user-contents">
            <div class="user-contents">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">

                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <div style="color: black" class="panel-title">Liste Employees</div>
                                </div>
                                <div class="panel-body">

                                    <table class="table table-bordered table-hover  ">
                                        <tr>
                                            <th>Image</th>
                                            <th>Nom Complet</th>
                                            <th>CIN</th>
                                            <th>Tel</th>
                                            <th>Email</th>
                                            <th>Date Embauche</th>
                                            <th>Action</th>
                                        </tr>
                                        <c:forEach items="${pageable.content}" var="item">
                                            <tr>
                                                <td>

                                                    <c:choose>
                                                        <c:when test="${item.image.length()<8}">
                                                            <div style="text-align: center;">
                                                                <img width="50px" height="50px" style="border-radius: 50%;" src="<c:url value="/resources/images/users/${item.image}"/>" alt="image">
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${item.image}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${item.nom} ${item.prenom}</td>
                                                <td>${item.cin}</td>
                                                <td>${item.tel} </td>
                                                <td>${item.email} </td>
                                                <td>${item.hireDate}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/employee/manager/${item.id}" class="btn btn-success">Consulter <span  class="fa fa-connectdevelop"></span></a>
                                                </td>
                                            </tr>

                                        </c:forEach>
                                    </table>

                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <c:choose>
                                                <c:when test="${pageable.number !=0 }">
                                                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employee/page/${pageable.number-1 }">Previous</a></li>
                                                </c:when>
                                            </c:choose>
                                            <c:forEach begin="0"   end="${pageable.totalPages -1}" var="i">
                                                <c:choose>
                                                    <c:when test="${pageable.number ==i }">
                                                        <li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/employee/page/${i}">${i}</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employee/page/${i}">${i}</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${pageable.number <pageable.totalPages-1 }">
                                                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employee/page/${pageable.number+1 }">Next</a></li>
                                                </c:when>
                                            </c:choose>
                                        </ul>
                                    </nav>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
