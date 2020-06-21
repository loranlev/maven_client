package com.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.Ville;

import kong.unirest.GenericType;
import kong.unirest.HttpResponse;
import kong.unirest.Unirest;

/**
 * Servlet implementation class UpdateVille
 */@WebServlet("/ModificationVille")
public class ModifierVilleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierVilleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		int idCodeCommune = Integer.parseInt(request.getParameter("id").toString());
		Ville ville = Unirest.get("http://localhost:8080/villeCC?codeCommune="+idCodeCommune).asObject(Ville.class).getBody();
		String codeCommune = ville.getCodeCommune();
		String codePostal = ville.getCodePostal();
		String nomCommune = ville.getNomCommune();
		String latitude = ville.getLatitude();
		String longitude = ville.getLongitude();
		String libelle = ville.getLibelle();
		String ligne = ville.getLigne();
		
		session.setAttribute("codeCommune", codeCommune);
		session.setAttribute("codePostal", codePostal);
		session.setAttribute("nomCommune", nomCommune);
		session.setAttribute("latitude", latitude);
		session.setAttribute("longitude", longitude);
		session.setAttribute("libelle", libelle);
		session.setAttribute("ligne", ligne);
		
		this.getServletContext().getRequestDispatcher("/modificationVille.jsp").forward(request, response);

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		Ville ville = new Ville();
		ville.setCodeCommune(session.getAttribute("codeCommune").toString());
		ville.setCodePostal(request.getParameter("codePostal"));
		ville.setLatitude(request.getParameter("latitude"));
		ville.setLibelle(request.getParameter("libelle"));
		ville.setLigne(request.getParameter("ligne"));
		ville.setLongitude(request.getParameter("longitude"));
		ville.setNomCommune(request.getParameter("nomCommune"));

		int idCodeCommune = Integer.parseInt(session.getAttribute("codeCommune").toString());
		HttpResponse<Ville> res = Unirest.put("http://localhost:8080/villePUT?codeCommune="+idCodeCommune).header("Content-Type", "application/json")
		.body(ville).asObject(Ville.class);
		 int status = res.getStatus();
		    System.out.println("Status code: " + status);
		    
		 	
		
		List<Ville> listeVilles = Unirest.get("http://localhost:8080/ville").asObject(new GenericType<ArrayList<Ville>>(){}).getBody();

		session.setAttribute("listeVilles", listeVilles);
		
		this.getServletContext().getRequestDispatcher("/affichageVilles.jsp").forward(request, response);
	}

}
