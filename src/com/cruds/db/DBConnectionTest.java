package com.cruds.db;

import java.sql.Connection;


public class DBConnectionTest
{
	public static void main(String[] args) 
	{
        Connection conn = DBConnectionManager.getConnection();
		if(conn != null)
		{
			System.out.println("Conn sucess");
		}

	}

}
