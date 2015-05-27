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
				SELECT * FROM categoria
			</sql:query>
			
			<!-- 3 se consume el SQL -->
			
			<table border="1" class="table table-striped">
			<tr>
				<td colspan="5" style="text-align:center"><h3>CATEGORIA POR PRODUCTO</h3></td>
			</tr>
			<!-- 3 se consume el SQL -->
			<tr>
				<td>
				<form id="idForm" action="ejemploDelSql2.jsp">
					Categoria
					<select name="cboCat" onchange="f_enviar();">
						<option value="-1">[Seleccione]</option>
						<c:forEach items="${VAR_SQL.rows}" var="x">
							<option value="${x.idcategoria}">
								${x.descripcion}
							</option>
						</c:forEach>
						
					</select>
				</form>
				</td>
			</tr>
			<tr>
				<td>
					<sql:query var="VAR_SQL_2" dataSource="${VAR_CON}">
						SELECT * FROM producto WHERE idCategoria=?
						<sql:param value="${param.cboCat}"></sql:param>
					</sql:query>
				</td>
			</tr>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-5">
			<table class="table table-striped">
			<c:forEach items="${VAR_SQL_2.rows}" var="x">
			<tr>
				<td><c:out value="${x.idproducto}" /></td>
				<td><c:out value="${x.nombre}" /></td>
				<td><c:out value="${x.stock}" /></td>
			</tr>
			</c:forEach>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
	function f_enviar(){
		document.getElementById("idForm").submit();
	}
</script>
</body>
</html>