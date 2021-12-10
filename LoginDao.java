package bean;
import java.sql.*;
public class LoginDao {
public static boolean validate(LoginBean bean) {
	boolean s = false;
	try {
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("select * from t1 where uname=? and pass=?");
		ps.setString(1, bean.getUname());
		ps.setString(2, bean.getPass());
		ResultSet rs = ps.executeQuery();
		s = rs.next();
	}catch(Exception e) {}
	    return s;
}
}
