package com.xmg.pss.test;

import org.junit.Test;

import com.alibaba.druid.filter.config.ConfigTools;

public class DruidConfigTools {

	@Test
	public void testDruid() throws Exception {
		
		String password =ConfigTools.encrypt("admin");
		System.out.println(password);
	}
}
