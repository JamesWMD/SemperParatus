<%-- 
    Document   : mensaje
    Created on : 3 feb. 2025, 22:13:51
    Author     : JAMES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.error != null}">
    <h4 style="text-align: center; color: red">${sessionScope.error}</h4>
</c:if>
<c:remove var="error" scope="session" />

<c:if test="${sessionScope.success != null}">
    <h4 style="text-align: center; color: green">${sessionScope.success}</h4>
</c:if>
<c:remove var="success" scope="session" />