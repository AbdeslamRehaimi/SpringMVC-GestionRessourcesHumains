<%--
  Created by IntelliJ IDEA.
  User: TOSHIBA
  Date: 26/04/2020
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>

<head>
    <title>Edite|User</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <style>
        .aColor {
            color: #000000;
        }

        .space_Section {
            margin-top: 20px;
        }

        .bg-black {
            background-color: #000000 !important;
        }

        .bg-cool-blue {
            background-color: #a0e5e8 !important;
        }

        .icon-drop-user {
            margin-right: 10px;
        }

        .icon-menu-space {
            margin-right: 50px;
        }
    </style>
</head>

<body>
<div class="fluid">
    <c:choose>
        <c:when test="${role == 'Admin'}">
            <jsp:include page="../includes/main-navbar.jsp"/>
        </c:when>
        <c:when test="${role == 'Writer'}">
            <jsp:include page="../includes/main-navbar.jsp"/>
        </c:when>
        <c:otherwise>
            <jsp:include page="../includes/visitor-navbar.jsp"/>
        </c:otherwise>
    </c:choose>

    <div class="jumbotron jumbotron-fluid bg-cool-blue">
        <div class="container">
            <h1 class="display-4 aColor">
                Employee Edite
            </h1>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-2 ">
                <br><br><br>
                <div>
                    <a style="float: left;" class="btn btn-danger" href="${pageContext.request.contextPath}/employee/home/">Returne</a>
                </div>
                <div class="card" style="margin-top: 50px">
                    <div class="card-header">Register</div>
                    <form:form action="${pageContext.request.contextPath}/employee/save" cssClass="form-horizontal"
                               method="post" modelAttribute="employee">
                        <div class="card-body row">
                            <form:input path="id" type="hidden"/>

                            <div class="form-group col-md-6  ">
                                <label>Nom</label>
                                <form:input path="nom" type="text" name="nom" value="" class="form-control"></form:input>
                                <form:errors path="nom" cssStyle="color: red"/>
                            </div>

                            <div class="form-group col-md-6  ">
                                <label>Prenom</label>
                                <form:input path="prenom" type="text" name="prenom" value="" class="form-control "></form:input>
                                <form:errors path="prenom" cssStyle="color: red"/>
                            </div>

                            <div class="form-group col-md-12  ">
                                <label>Tel</label>
                                <form:input path="tel" type="text" name="tel" value="" class="form-control "></form:input>
                                <form:errors path="tel" cssStyle="color: red"/>
                            </div>

                            <div class="form-group col-md-12  ">
                                <label>CIN</label>
                                <form:input path="cin" type="text" name="cin" value="" class="form-control "></form:input>
                                <form:errors path="cin" cssStyle="color: red"/>
                            </div>

                            <div class="form-group col-sm-12   ">
                                <label>Email</label>
                                <form:input path="email" type="text" name="email" value="" class="form-control"></form:input>
                                <form:errors path="email" cssStyle="color: red"/>
                            </div>


                            <div class="form-group col-md-6   ">
                                <label>Mot de pass</label>
                                <form:input path="password" type="password" name="motdepasse" autocomplete="off" class="form-control "></form:input>
                                <form:errors path="password" cssStyle="color: red"/>
                            </div>


                            <div class="form-group col-md-6   ">
                                <label>Retaper Password</label>
                                <form:input path="confirmedPassword" type="password" name="confirmedPassword" autocomplete="off" class="form-control "></form:input>
                                <form:errors path="confirmedPassword" cssStyle="color: red"/>
                                <span style="color: red; font-size: small;" >${pass}</span>
                            </div>

                            <div class="form-group col-md-6   ">
                                <label>Grade</label>
                                <form:select path="grade" name="grade" class="form-control ">
                                    <form:option value="A">A</form:option>
                                    <form:option value="B">B</form:option>
                                    <form:option value="C">C</form:option>
                                </form:select>
                                <form:errors path="grade" cssStyle="color: red"/>
                            </div>

                            <div class="form-group col-md-6   ">
                                <label>Salaire</label>
                                <form:input path="salaire" type="text" name="salaire" autocomplete="off" class="form-control "></form:input>
                                <form:errors path="salaire" cssStyle="color: red"/>
                            </div>


                            <div class="form-group col-md-6">
                                <label>Extra Performance</label>
                                <form:select path="extraPerformance" name="extraPerformance" class="form-control ">
                                    <form:option value="Aucune">Aucune</form:option>
                                    <form:option value="Vendeur">Vendeur</form:option>
                                </form:select>
                                <form:errors path="extraPerformance" cssStyle="color: red"/>
                            </div>

                            <div class="form-group col-md-6">
                                <label>Hire Date</label>
                                <form:input path="hireDate" type="date" name="hireDate" autocomplete="off" class="form-control "></form:input>
                                <form:errors path="hireDate" cssStyle="color: red"/>
                            </div>


                            <div class="form-group col-md-12   ">
                                <label>Role</label>
                                <form:select path="role" name="role" class="form-control ">
                                    <form:option value="">-</form:option>
                                    <form:option value="Normal">Normal</form:option>
                                    <form:option value="Admin">Admin</form:option>
                                </form:select>
                                <form:errors path="role" class="invalid-feedback" cssStyle="color: red"/>
                            </div>

                            <div class="form-group col-sm-12">
                                <label>Choisis Departement</label>
                                <form:select path="departement.id" class="form-control">
                                    <form:options items="${departements}" id="id" itemValue="id" itemLabel="nom"/>
                                </form:select>
                                <form:errors path="departement" class="invalid-feedback" cssStyle="color: red"/>
                            </div>

                            <div class="form-group col-sm-12">
                                <label>Choisis Remuneration</label>
                                <form:select path="remuneration.id" class="form-control">
                                    <form:options items="${remunerations}" id="id" itemValue="id" itemLabel="type"/>
                                </form:select>
                                <form:errors path="remuneration" class="invalid-feedback" cssStyle="color: red"/>
                            </div>


                            <div class="form-group col-sm-12  ">
                                <label>Image</label>
                                <form:select path="image" name="image" class="form-control ">
                                    <form:option value="">Choisirs</form:option>
                                    <form:option value="01.jpg">User 1</form:option>
                                    <form:option value="03.jpg">User 2</form:option>
                                    <form:option value="04.jpg">User 3</form:option>
                                    <form:option value="05.jpg">User 4</form:option>
                                    <form:option value="06.jpg">User 5</form:option>
                                    <form:option value="No Image Provided !">Aucun</form:option>
                                </form:select>
                                <form:errors path="image" cssStyle="color: red"/>
                            </div>

                            <div class="form-group col-md-12">
                                <c:choose>
                                    <c:when test="${role == 'Admin'}">
                                        <form:button class="btn btn-success btn-block">Valider</form:button>
                                    </c:when>
                                    <c:when test="${role == 'Writer'}">
                                        <form:button disabled="true" class="btn btn-success btn-block">Valider</form:button>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../includes/footer.jsp"/>
</div>
</body>

</html>