package com.etech.util;

import java.util.Calendar;

public class TimeUtils {
	// 获取一个小时的毫秒数
	public static long getOneHourTimeMillis() {
		long oneHourTimeMillis = 1000 * 60 * 60;
		return oneHourTimeMillis;
	}

	// 获取一天的毫秒数
	public static long getOneDayTimeMillis() {
		long oneDayTimeMillis = 1000 * 60 * 60 * 24;
		return oneDayTimeMillis;
	}

	// 获取一个月的毫秒数
	public static long getOneMonthTimeMillis() {
		Calendar cal = Calendar.getInstance();
		// 获取该月有多少天
		int maxDate = cal.getActualMaximum(Calendar.DATE);
		long oneMonthTimeMillis = 1000 * 60 * 60*maxDate;
		return oneMonthTimeMillis;
	}
}
