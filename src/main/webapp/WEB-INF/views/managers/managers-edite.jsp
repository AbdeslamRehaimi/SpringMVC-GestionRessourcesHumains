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
                <div>
                    <a style="float: left;" class="btn btn-danger" href="${pageContext.request.contextPath}/employee/managers" >Returne</a>
                </div>
                <div class="card" style="margin-top: 50px">
                    <div class="card-header" style="text-align: center"><h1 style="color: black;font-family: auto;">${manager.email}</h1></div>

                                <hr>
                                <br>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6 offset-3 ">
                                            <div >
                                                <a style="float: left;" class="btn btn-danger" href="${pageContext.request.contextPath}/departement/list" >Returne</a>
                                            </div>
                                            <br><br><br>

                                            <div class="card" style="margin-top: 25px;margin-bottom: 50px;">
                                                <div class="card-header">Ajouter un membre</div>
                                                <form:form method="post" action="${pageContext.request.contextPath}/departement/save" modelAttribute="departement">
                                                    <div class="card-body row">
                                                        <div class="form-group col-sm-12">
                                                            <form:input path="id" type="hidden" />
                                                            <label>Nom</label>
                                                            <form:input path="nom"  type="text" name="nom" class="form-control"></form:input>
                                                            <form:errors path="nom"  cssStyle="color: red" />
                                                        </div>

                                                        <div class="form-group col-md-12 ">
                                                            <label>Type</label>
                                                            <form:select path="manager"  class="form-control" id="select">
                                                                <option value="">Selectioner Un Employer  </option>
                                                                <c:forEach items="${employees}"   var="emp">
                                                                    <option value="${emp.id}"> ${emp.nom}  </option>
                                                                </c:forEach>
                                                            </form:select>
                                                            <form:errors path="manager" cssClass="alert-danger" />
                                                        </div>

                                                        <div class="form-group col-md-12">
                                                            <form:button class="btn btn-primary btn-block">Valider</form:button>
                                                        </div>
                                                    </div>
                                                </form:form>
                                            </div>
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