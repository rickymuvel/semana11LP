<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<!--  
	${x} lenguaje de expresiones (version 2.0) reemplaza a las expresiones (version 1.x)
	< %=x %> Expresiones --1.2JSP 
 -->

<c:forEach begin="1" end="7" var="x">
	<font color="red" size="${x}">
		Perdió la U
	</font>
</c:forEach>

<br><br>
<select>
<c:forTokens items="U,UTC,Cristal,...,AL" delims="," var="x">
	<option>${x}</option>
</c:forTokens>
</select>

</body>
</html>