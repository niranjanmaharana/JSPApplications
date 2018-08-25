<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br>

<!-- declare a variable -->
<c:set var="msg" value="Hello" scope="request"/><br>

<!-- display the variable -->
<c:out value="${msg}" default="Hii"/><br>

<!-- remove the variable -->
<c:remove var="msg"/><br>

<!-- display the variable -->
<c:out value="${msg}"/>