<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Productos por rango de precios</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<style>
	
</style>
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<!-- 1 CONEXION -->

			<sql:setDataSource driver="com.mysql.jdbc.Driver"
			                   url="jdbc:mysql://localhost:3306/mydb"
			                   user="root"
			                   password="mysql"
			                   var="VAR_CON"/>
			
			<!-- 2 se prepara el SQL -->
			
			<sql:query var="VAR_SQL" dataSource="${VAR_CON}">
				SELECT * FROM mydb.producto WHERE producto.precio BETWEEN ? AND ?;
				<sql:param value="${param.txtDesde}"></sql:param>
				<sql:param value="${param.txtHasta}"></sql:param>
			</sql:query>
			<form id="form" action="rangoDePrecios.jsp">
				<div>PRECIO: Desde <input type="number" name="txtDesde"> Hasta <input type="number" name="txtHasta"> <input type="submit" value="Filtrar" class="btn btn-danger"></div>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<table class="table table-striped">	
				<tr>
					<td>ID Prod</td>
					<td>Nombre</td>
					<td>Marca</td>
					<td>Precio</td>
					<td>Stock</td>
				</tr>
				<c:forEach items="${VAR_SQL.rows}" var="x">
				<tr>
					<td><c:out value="${x.idproducto}" /></td>
					<td><c:out value="${x.nombre}" /></td>
					<td><c:out value="${x.marca}" /></td>
					<td><c:out value="${x.precio}" /></td>
					<td><c:out value="${x.stock}" /></td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
</body>
</html>