<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br>

<!-- declare a variable -->
<c:set var="msg" value="Hello," scope="request"/><br>

<!-- check condition -->
<c:if test="${!empty param.uname }">

	<c:out value="${msg}"/>
	<c:out value="${param.uname}"/>

</c:if>