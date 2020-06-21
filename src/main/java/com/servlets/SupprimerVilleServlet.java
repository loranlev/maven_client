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
 * Servlet implementation class DeleteVille
 */
@WebServlet("/SupprimerVille")
public class SupprimerVilleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupprimerVilleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		int idCodeCommune = Integer.parseInt(request.getParameter("id").toString());
		Unirest.delete("http://localhost:8080/villeDELETE?codeCommune="+idCodeCommune).asEmpty();
		List<Ville> listeVilles = Unirest.get("http://localhost:8080/ville").asObject(new GenericType<ArrayList<Ville>>(){}).getBody();

		session.setAttribute("listeVilles", listeVilles);
		
		this.getServletContext().getRequestDispatcher("/affichageVilles.jsp").forward(request, response);
	}

}
