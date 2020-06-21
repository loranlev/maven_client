package com.servlets;

import java.awt.Window.Type;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.Ville;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import kong.unirest.GenericType;
import kong.unirest.HttpResponse;
import kong.unirest.Unirest;

/**
 * Servlet implementation class VilleServlet
 */
@WebServlet("/VilleInfo")
public class VilleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		List<Ville> listeVilles = Unirest.get("http://localhost:8080/ville").asObject(new GenericType<ArrayList<Ville>>(){}).getBody();

		session.setAttribute("listeVilles", listeVilles);
		this.getServletContext().getRequestDispatcher("/affichageVilles.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		List<Ville> listeVilles = Unirest.get("http://localhost:8080/ville").asObject(new GenericType<ArrayList<Ville>>(){}).getBody();


		session.setAttribute("listeVilles", listeVilles);
		this.getServletContext().getRequestDispatcher("/calculDistanceVilles.jsp").forward(request, response);
		
	}

}
