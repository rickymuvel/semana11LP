<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ejemplo de SQL</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-5">
			<!-- 1 CONEXION -->

			<sql:setDataSource driver="com.mysql.jdbc.Driver"
			                   url="jdbc:mysql://localhost:3306/mydb"
			                   user="root"
			                   password="mysql"
			                   var="VAR_CON"/>
			
			<!-- 2 se prepara el SQL -->
			
			<sql:query var="VAR_SQL" dataSource="${VAR_CON}">
				SELECT * FROM producto
			</sql:query>
			
			<!-- 3 se consume el SQL -->
			
			<table border="1" class="table table-striped">
			<tr>
				<td colspan="5" style="text-align:center"><h3>LISTA DE PRODUCTOS</h3></td>
			</tr>
			<c:forEach items="${VAR_SQL.rows}" var="y">
				<tr>
					<td><c:out value="${y.idproducto}" /></td>
					<td><c:out value="${y.nombre}" /></td>
					<td><c:out value="${y.marca}" /></td>
					<td><c:out value="${y.precio}" /></td>
					<td><c:out value="${y.stock}" /></td>
					
				</tr>
			</c:forEach>
			</table>
		</div>
		<div class="col-md-7">
			<sql:query var="VAR_SQL" dataSource="${VAR_CON}">
				SELECT * FROM cliente
			</sql:query>
			<table class="table table-striped">
				<tr>
					<td colspan="5" style="text-align:center"><h3>LISTA DE CLIENTES</h3></td>
				</tr>
				<tr>
					<td>Id Cliente</td>
					<td>Nombre</td>
					<td>Apellido</td>
					<td>Edad</td>
					<td>Fecha de Nacimiento</td>
				</tr>
				<c:forEach items="${VAR_SQL.rows}" var="x">
				<tr>
					<td><c:out value="${x.idcliente }" /></td>
					<td><c:out value="${x.nombre}" /></td>
					<td><c:out value="${x.apellido}" /></td>
					<td><c:out value="${x.edad}" /></td>
					<td><c:out value="${x.fechaNacimiento}" /></td>
				</tr>
			</c:forEach>
				
			</table>
			<input type="text" placeholder="Ingresa el criterio de tu busqueda" class="form-control">
			<br><br>
			<button class="btn btn-danger">Buscar</button>
		</div>
	</div>
</div>
</body>
</html>