package com.SMS.TestCases;
import static org.junit.Assert.*;

import org.junit.Test;

import com.SMS.biz.Customer;
import com.SMS.biz.User;
import com.SMS.biz.UserTypes;
import com.SMS.biz.UsersFactory;

public class UsersTestCases {

	@Test
	public void LoginWithValidUserNameAndPassword() {
		UsersFactory usersFactory = new UsersFactory();
		User user = usersFactory.GetUser(UserTypes.Customer);
		Customer customer = user.Login("ai.khan@mum.edu", "123");

		boolean result = false;

		if (customer != null) {
			result = true;
		}

		assertEquals(result, true);
	}

	@Test
	public void LoginWithInValidUserNameAndPassword() {
		UsersFactory usersFactory = new UsersFactory();
		User user = usersFactory.GetUser(UserTypes.Customer);
		Customer customer = user.Login("ai.khan@mum.edu", "1234");

		boolean result = false;

		if (customer != null) {
			result = true;
		}

		assertEquals(result, false);
	}
	
	@Test
	public void LoginWithCharacters() {
		UsersFactory usersFactory = new UsersFactory();
		User user = usersFactory.GetUser(UserTypes.Customer);
		Customer customer = user.Login("ai.khan@mum.edu", "' and 1=1");

		boolean result = false;

		if (customer != null) {
			result = true;
		}

		assertEquals(result, false);
	}


}
