package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mvc.database.DBConnection;

public class SearchDAO {
	private static SearchDAO instance;
	
	private SearchDAO(){}
	
	public static SearchDAO getInstance() {
		return (instance == null) ? new SearchDAO() : instance;
	}

	public List<ProductDTO> getProductList(String items, String text) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String sql = (items == null || text.trim().length() == 0)
				? "SELECT*FROM TTPRODUCT ORDER BY P_ID DESC"
				: ("SELECT*FROM TTPRODUCT WHERE " + items + " LIKE upper('%" + text.toUpperCase() + "%')ORDER BY P_ID DESC");

		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				ProductDTO product = new ProductDTO();
				
				product.setProductId(resultSet.getString("p_id"));
				product.setName(resultSet.getString("p_name"));
				product.setCategory(resultSet.getString("p_category"));
				product.setCondition(resultSet.getString("p_condition"));
				product.setManufacturer(resultSet.getString("p_manufacturer"));
				product.setFileName(resultSet.getString("p_fileName"));
				product.setDescription(resultSet.getString("p_description"));
				product.setUnitsInStock(resultSet.getLong("p_unitsInStock"));
				product.setUnitPrice(resultSet.getLong("p_unitPrice"));
				
				list.add(product);
			}
		} catch (Exception e) {
			System.out.println("getProductList()Error: " + e);
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return list;
	}
}