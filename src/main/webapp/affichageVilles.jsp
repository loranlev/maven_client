<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>


<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
 
<script type="text/javascript" src=" https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src=" https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src=" https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap.min.js"></script>

</head>
<body id="page-top">

	<script type="text/javascript">
		$(document).ready( function () {
		    $('#myTable').DataTable();
		} );
	</script>

	<% System.out.println("Résultat: "+session.getAttribute("listeVilles")); %>
	
	
		<div id="container" style="padding:25px">
			<table id="myTable" class="table table-striped table-bordered" style="width:100%">
			   <thead>
					<tr>
						<th>Code Commune</th>
						<th>Nom Commune</th>
						<th>Code Postal</th>
						<th>Libelle</th>
						<th>Ligne</th>
						<th>Latitude</th>
						<th>Longitude</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ville" items="${listeVilles}" varStatus="loop">
						<tr>
							<td class="align-middle"><c:out value="${ville.getCodeCommune()}" /></td>
							<td class="align-middle"><c:out value="${ville.getNomCommune()}" /></td>
							<td class="align-middle"><c:out value="${ville.getCodePostal()}" /></td>
							<td class="align-middle"><c:out value="${ville.getLibelle()}" /></td>
							<td class="align-middle"><c:out value="${ville.getLigne()}" /></td>
							<td class="align-middle"><c:out value="${ville.getLatitude()}" /></td>
							<td class="align-middle"><c:out value="${ville.getLongitude()}" /></td>
							<td class="align-middle">
								<form method="post" action="SupprimerVille">
									<button type="submit" value="${ville.getCodeCommune()}" name="id">
										<span class="fa fa-trash" aria-hidden="true" style="color:red"></span>
									</button>
								</form>
							</td>
							<td class="align-middle">
								<form method="get" action="ModificationVille">
									<button type="submit" value="${ville.getCodeCommune()}" name="id">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
</body>
</html>