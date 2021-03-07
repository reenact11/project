package org.SOC.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {

		try (Connection con = DriverManager.getConnection("jdbc:oracle:thin:@118.128.215.181:1521:XE", "SOCCERM",
				"SOCCERM")) {

			log.info("*** con="+con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

}
