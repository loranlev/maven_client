<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/distance.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<title>trouvetaville.fr</title>
</head>
<body>

	
	<form method="post" action="CalculD">
	
			<div class="form-group" style="position: absolute; top: 40%;left: 38%;">
				<div class="select1" style="display:flex; flex-direction: row; margin-bottom: 25px;">
		      		<label for="ville1" style="margin-right: 15px;">Ville n°1</label>
		      		<select class="form-control" id="ville1" name="ville1" required>
		      		
		      		<c:forEach items="${listeVilles}" var="v">
						 <option value="<c:out value="${v.getCodeCommune()}"></c:out>"><c:out
							value="${v.getNomCommune()}"></c:out></option>
					</c:forEach>
		      		</select>
	      		</div>
	      		
	      	
	       		<div class="select2" style="display:flex; flex-direction: row;">
	       		<label for="ville2" style="margin-right: 15px;">Ville n°2</label>
	       		<select class="form-control" id="ville2" name="ville2" required>
	       		
	       		<c:forEach items="${listeVilles}" var="v">
						   <option value="<c:out value="${v.getCodeCommune()}"></c:out>"><c:out
						value="${v.getNomCommune()}"></c:out></option>
					</c:forEach>
	       		</select>
	       		</div>
	       		<button type="submit" class="btn btn-primary" style="margin-top: 25px;">Calculer la distance</button>
	       		
	       	</div>
       	
       	</form>
       	
       	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       	
</body>
</html>