<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/modificationVille.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
	
	<form method="post" action="ModificationVille">
		<label for="codePostal"><strong>Code Postal :</strong></label>
		<input class="form-control form-perso" name="codePostal"
		id="codePostal" type="text" style="margin: auto;"
		value="<%=session.getAttribute("codePostal")%>" required><br>
		
		<label for="nomCommune"><strong>Nom Commune :</strong></label>
		<input class="form-control form-perso" name="nomCommune"
		id="nomCommune" type="text" style="margin: auto;"
		value="<%=session.getAttribute("nomCommune")%>" required><br>
		
		<label for="latitude"><strong>Latitude :</strong></label>
		<input class="form-control form-perso" name="latitude"
		id="latitude" type="text" style="margin: auto;"
		value="<%=session.getAttribute("latitude")%>" ><br>
		
		<label for="longitude"><strong>Longitude :</strong></label>
		<input class="form-control form-perso" name="longitude"
		id="longitude" type="text" style="margin: auto;"
		value="<%=session.getAttribute("longitude")%>" ><br>
		
		<label for="libelle"><strong>Libelle :</strong></label>
		<input class="form-control form-perso" name="libelle"
		id="libelle" type="text" style="margin: auto;"
		value="<%=session.getAttribute("libelle")%>" ><br>
		
		<label for="ligne"><strong>Ligne :</strong></label>
		<input class="form-control form-perso" name="ligne"
		id="ligne" type="text" style="margin: auto;"
		value="<%=session.getAttribute("ligne")%>" ><br>
		
		<button type="submit" class="btn btn-success">Sauvegarder</button>
		</form>
	
</body>
</html>