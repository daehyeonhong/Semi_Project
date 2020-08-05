package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.ProductDTO;
import mvc.model.SearchDAO;

@WebServlet("*.search")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Hello, Search!");
		String requestURI = request.getRequestURI(),
				contextPath = request.getContextPath(),
				command = requestURI.substring(contextPath.length());
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><body>" + request.getRequestURL() + requestURI + contextPath + command + "</body></html>");
		RequestDispatcher requestDispatcher = null;
		
		switch (command) {
		case "/SearchListAction.search":
			requestSearchList(request);
			requestDispatcher = request.getRequestDispatcher("./search/list.jsp");
			break;
		}
		requestDispatcher.forward(request, response);
	}
	private void requestSearchList(HttpServletRequest request) {
		SearchDAO dao = SearchDAO.getInstance();
		String items = request.getParameter("items"),
				text = request.getParameter("text");
		List<ProductDTO> productList = new ArrayList<ProductDTO>();

		productList = dao.getProductList(items,text);
		request.setAttribute("items", items);
		request.setAttribute("text", text);
		request.setAttribute("productList", productList);
	}

}