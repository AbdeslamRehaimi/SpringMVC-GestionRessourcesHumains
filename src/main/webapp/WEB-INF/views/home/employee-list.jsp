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










        .block-update-card {
            height: 100%;
            border: 1px #FFFFFF solid;
            width: 380px;
            float: left;
            margin-left: 10px;
            margin-top: 0;
            padding: 0;
            box-shadow: 1px 1px 8px #d8d8d8;
            background-color: #FFFFFF;
        }
        .block-update-card .h-status {
            width: 100%;
            height: 7px;
            background: repeating-linear-gradient(45deg, #606dbc, #606dbc 10px, #465298 10px, #465298 20px);
        }
        .block-update-card .v-status {
            width: 5px;
            height: 80px;
            float: left;
            margin-right: 5px;
            background: repeating-linear-gradient(45deg, #606dbc, #606dbc 10px, #465298 10px, #465298 20px);
        }
        .block-update-card .update-card-MDimentions {
            width: 80px;
            height: 80px;
        }
        .block-update-card .update-card-body {
            margin-top: 10px;
            margin-left: 5px;
        }
        .block-update-card .update-card-body h4 {
            color: #737373;
            font-weight: bold;
            font-size: 13px;
        }
        .block-update-card .update-card-body p {
            color: #737373;
            font-size: 12px;
        }
        .block-update-card .card-action-pellet {
            padding: 5px;
        }
        .block-update-card .card-action-pellet div {
            margin-right: 10px;
            font-size: 15px;
            cursor: pointer;
            color: #dddddd;
        }
        .block-update-card .card-action-pellet div:hover {
            color: #999999;
        }
        .block-update-card .card-bottom-status {
            color: #a9a9aa;
            font-weight: bold;
            font-size: 14px;
            border-top: #e0e0e0 1px solid;
            padding-top: 5px;
            margin: 0px;
        }
        .block-update-card .card-bottom-status:hover {
            background-color: #dd4b39;
            color: #FFFFFF;
            cursor: pointer;
        }

        /*
        Creating a block for social media buttons
        */
        .card-body-social {
            font-size: 30px;
            margin-top: 10px;
        }
        .card-body-social .git {
            color: black;
            cursor: pointer;
            margin-left: 10px;
        }
        .card-body-social .twitter {
            color: #19C4FF;
            cursor: pointer;
            margin-left: 10px;
        }
        .card-body-social .google-plus {
            color: #DD4B39;
            cursor: pointer;
            margin-left: 10px;
        }
        .card-body-social .facebook {
            color: #49649F;
            cursor: pointer;
            margin-left: 10px;
        }
        .card-body-social .linkedin {
            color: #007BB6;
            cursor: pointer;
            margin-left: 10px;
        }

        .music-card {
            background-color: green;
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
                Employees
            </h1>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">

                        <input type="button" style="float: left; border-radius: 50px;" value="Nouveau Employee"
                               onclick="window.location.href='${pageContext.request.contextPath}/employee/add'; return false;"
                               class="btn btn-primary" />
                        <input type="button" style="text-align: center; border-radius: 50px;" value="Consultation Departements"
                               onclick="window.location.href='${pageContext.request.contextPath}/departement/list'; return false;"
                               class="btn btn-primary" />


                        <input type="button" style="float: right;border-radius: 50px;" value="Consultation Managers"
                               onclick="window.location.href='${pageContext.request.contextPath}/employee/managers'; return false;"
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

                                        <div class="col-md-4">
                                            <!--Wanna Call Someone :P -->
                                            <div class="media block-update-card">
                                                <a class="pull-left" href="#">
                                                    <img class="media-object update-card-MDimentions" src="http://3.bp.blogspot.com/-IbEOTNtCMyU/TfCAdHaAxEI/AAAAAAAAA8U/EATib38SSAM/s320/joe-mcelderry.jpg" alt="...">
                                                </a>
                                                <div class="media-body update-card-body">
                                                    <h4 class="media-heading">Manning Hilton</h4>
                                                    <div class="btn-toolbar card-body-social" role="toolbar">
                                                        <div class="btn-group fa fa-github-alt git"></div>
                                                        <div class="btn-group linkedin fa fa-linkedin-square"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <!--Simple Card with Status Highlight-->
                                            <div class="block-update-card status">
                                                <div class="h-status">
                                                </div>
                                                <div class="update-card-body">
                                                    <h4>Vinothbabu K</h4>
                                                    <p>This is me. I am a Good Boy.This is the body content of this media.This can be
                                                        used as an update panel.</p>
                                                </div>
                                            </div>
                                        </div>



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
                                                        <a href="${pageContext.request.contextPath}/employee/delete/${pageable.number}/${item.id}" class="btn btn-danger"
                                                           onclick="if (!(confirm('Voulez vous vraiment supprimer ce Artiste?'))) return false">Delete</a>
                                                        <a href="${pageContext.request.contextPath}/employee/add/${item.id}" class="btn btn-success">Modifier</a>
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
