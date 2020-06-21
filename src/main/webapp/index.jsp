<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/index.css">
        <title>trouvetaville.fr</title>
    </head>
    <body>
        
       	<div class="splash">
       		<h1 class="fade-in">Bienvenue sur le site: trouvetaville.fr !</h1>
       	</div>
         
        <div class="wrapper">
	        <form method="POST" action="VilleInfo">
	        	<div class="btn1">
	        		<button class="button1" type="submit" name="distance">Calculer Distance</button>
	       		</div>
	        </form>
	        
	        <form method="GET" action="VilleInfo">
	        	<div class="btn2">
	        		<button class="button2" type="submit" name="villes">Afficher Villes</button>
	        	</div>
	        </form>
        </div>
        
        
        
        <script src="javascript/index.js"></script>
    </body>
</html>
