package com.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.Ville;

import kong.unirest.GenericType;
import kong.unirest.Unirest;

/**
 * Servlet implementation class CalculDistance
 */
@WebServlet("/CalculD")
public class CalculerDistanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public final static double AVERAGE_RADIUS_OF_EARTH_KM = 6371;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculerDistanceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		int codeVille1 = Integer.parseInt(request.getParameter("ville1").toString());
		int codeVille2 = Integer.parseInt(request.getParameter("ville2").toString());
		Ville ville1 = Unirest.get("http://localhost:8080/villeCC?codeCommune="+codeVille1).asObject(Ville.class).getBody();
		Ville ville2 = Unirest.get("http://localhost:8080/villeCC?codeCommune="+codeVille2).asObject(Ville.class).getBody();
		
	
		int distanceVilles = calculateDistanceInKilometer(Double.parseDouble(ville1.getLatitude()), Double.parseDouble(ville1.getLongitude()), Double.parseDouble(ville2.getLatitude()), Double.parseDouble(ville2.getLongitude()));
		session.setAttribute("distanceVilles",distanceVilles);
		session.setAttribute("ville1",ville1.getNomCommune());
		session.setAttribute("ville2",ville2.getNomCommune());
		this.getServletContext().getRequestDispatcher("/resultatDistanceVilles.jsp").forward(request, response);
	}
	public int calculateDistanceInKilometer(double ville1Lat, double ville1Long,
	  double ville2Lat, double ville2long) {

	    double latDistance = Math.toRadians(ville1Lat - ville2Lat);
	    double lngDistance = Math.toRadians(ville1Long - ville2long);

	    double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
	      + Math.cos(Math.toRadians(ville1Lat)) * Math.cos(Math.toRadians(ville2Lat))
	      * Math.sin(lngDistance / 2) * Math.sin(lngDistance / 2);

	    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

	    return (int) (Math.round(AVERAGE_RADIUS_OF_EARTH_KM * c));
	}

}
