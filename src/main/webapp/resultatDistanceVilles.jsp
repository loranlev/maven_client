<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/resultatDistance.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


</head>
<body>
	
	<div class="splash">
      	<h4 >Le résultat de distance entre <%= session.getAttribute("ville1") %> et <%= session.getAttribute("ville2") %> est de: <%=session.getAttribute("distanceVilles") %> km</h4>
	 <button type="submit" class="btn btn-primary" onclick="location.href = 'http://localhost:8181/TP_ESEO_Maven_Client/';">Retour à l'accueil</button>
	</div>
	
	 
	
</body>
</html>