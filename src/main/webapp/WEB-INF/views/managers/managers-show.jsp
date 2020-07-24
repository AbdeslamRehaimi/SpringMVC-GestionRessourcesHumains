<%--
  Created by IntelliJ IDEA.
  User: TOSHIBA
  Date: 26/04/2020
  Time: 15:31
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
        }

        .user-header {
            margin-top: -50px;
        }
        .user-profile {
            padding-top: 55px;
        }
    </style>
</head>
<body>
<div class="fluid">
            <jsp:include page="../includes/main-navbar.jsp" />


    <div class="jumbotron jumbotron-fluid bg-cool-blue">
        <div class="container">
            <h1 class="display-4 aColor">
                Manager : ${manager.nom} ${manager.prenom}
            </h1>
        </div>
    </div>

    <div class="user-header">
        <div class="user-profile">
            <img src="<c:url value="/resources/images/users/${manager.image}"/>" class="user">
            <h1>${manager.nom} ${manager.prenom}</h1>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12  ">
                <br><br><br>
                <div >
                    <a style="float: left;" class="btn btn-danger" href="${pageContext.request.contextPath}/employee/managers" >Returne</a>
                    <a style="float: right;" class="btn btn-primary" href="${pageContext.request.contextPath}/employee/managerAdd/${manager.id}" >Ajouter un membre</a>
                </div>
                <div class="card" style="margin-top: 50px">
                    <div class="card-header" style="text-align: center"><h1 style="color: black;font-family: auto;">${manager.email}</h1></div>
                    <div class="card-body row">
                        <div class="form-group col-sm-12 required">
                            <div class="article">

                                <hr>
                                <div class="nav-item" style="background-color: #6b3c05;height: 50px;text-align: center;">
                                    <a class="nav-link" id="product-details-area3-tab" style="color: white;" data-toggle="tab" href="#product-details-area3" role="tab" aria-controls="product-details-area3" aria-selected="false">Information detaller de ce manager</a>
                                </div>
                                <div class="container">
                                    <div class="row" style="margin: 5px; color: black">
                                        <div class="col-md-6">
                                            <span>Nom Complet : </span> <br>
                                            <span>CIN :</span>  <br>
                                            <span>Tel : </span>  <br>
                                            <span>Email : </span>  <br>
                                            <span>Remun Type :</span>  <br>

                                            <span>Grade : </span>  <br>
                                            <span>Grade Valeur : </span>  <br>
                                            <span>extraPerformance :</span> <br>
                                            <span>departement : </span>  <br>
                                            <span>Remun Montant : </span>  <br>
                                            <span>Salaire Fixe : </span>  <br>
                                            <span>Salaire Final : </span>

                                        </div>
                                        <div class="col-md-6" style="color: darkblue">
                                            <span>${manager.nom} ${manager.prenom}</span> <br>
                                            <span>${manager.cin}</span>  <br>
                                            <span>${manager.tel}</span>  <br>
                                            <span>${manager.email}</span>  <br>
                                            <span>${manager.remuneration.type}</span>  <br>
                                            <span>${manager.grade}</span>  <br>

                                            <span>
                                            <c:choose>
                                                        <c:when test="${manager.grade == 'A'}">
                                                            +100.00 DH
                                                        </c:when>
                                                        <c:when test="${manager.grade == 'B'}">
                                                            +50.00 DH
                                                        </c:when>
                                                        <c:when test="${manager.grade =='C'}">
                                                            +25.00 DH
                                                        </c:when>
                                                        <c:otherwise>
                                                            +0 DH
                                                        </c:otherwise>

                                                    </c:choose>

                                            </span>  <br>

                                            <span>${manager.extraPerformance}</span> <br>
                                            <span>${manager.departement.type} -> ${manager.departement.nom}</span>  <br>
                                            <span>${manager.remuneration.montant} DH</span>  <br>
                                            <span>${manager.salaire} DH</span>  <br>
                                            <span>
                                            <c:choose>
                                                        <c:when test="${manager.grade == 'A'}">
                                                            ${(manager.salaire) + (manager.remuneration.montant) + (100.00)} DH
                                                        </c:when>
                                                        <c:when test="${manager.grade == 'B'}">
                                                            ${(manager.salaire) + (manager.remuneration.montant) + (50.00) } DH
                                                        </c:when>
                                                        <c:when test="${manager.grade =='C'}">
                                                            ${(manager.salaire) + (manager.remuneration.montant) + (25.00)} DH
                                                        </c:when>
                                                        <c:otherwise>
                                                            <b>${(manager.salaire)} DH<b>
                                                        </c:otherwise>

                                                    </c:choose>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="nav-item" style="background-color: #6b3c05;height: 50px;text-align: center;">
                                    <a class="nav-link" id="product-details-area3-tab" style="color: white;" data-toggle="tab" href="#product-details-area3" role="tab" aria-controls="product-details-area3" aria-selected="false">Membre d'equipe de ce manager</a>
                                </div>
                                <table class="table table-bordered table-hover col-md-12 col-xl-12 col-sm-12">
                                    <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">Image</th>
                                        <th scope="col">NomComplet</th>
                                        <th scope="col">email</th>
                                        <th scope="col">tel</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="var" items="${sousjacent}">
                                        <tr>
                                            <th scope="row">${var.id}</th>
                                            <td>

                                                <c:choose>
                                                    <c:when test="${var.image.length()<8}">
                                                        <div style="text-align: center;">
                                                            <img width="50px" height="50px" style="border-radius: 50%;" src="<c:url value="/resources/images/users/${var.image}"/>" alt="image">
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${var.image}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td><a href="${pageContext.request.contextPath}/employee/employeeShow/${item.id}" style="color: green"><b>${var.nom} ${var.prenom}</b></a></td>
                                            <td>${var.email}</td>
                                            <td>${var.tel}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="text-center" style="text-align: center!important;">
                        <p style="color: #20560a; font-family: initial;">Manager : ${manager.nom} ${manager.prenom} Rejoindre le: ${manager.created} </p>
                    </div>
                </div>
            </div>
        </div>
    </div>






    <jsp:include page="../includes/footer.jsp" />
</div>
</body>
</html>