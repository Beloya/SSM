package com.MyBlog.utils;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;

public class DateFormatutils extends Calendar  implements Serializable, Cloneable, Comparable<Calendar>{

	 public final static int YEAR = 1;
	 public final static int MONTH = 2;
	   public final static int WEEK_OF_YEAR = 3;
	   public final static int WEEK_OF_MONTH = 4;
	   public final static int DATE = 5;
	   public final static int DAY_OF_MONTH = 5;
	   public final static int DAY_OF_YEAR = 6;
	   public final static int DAY_OF_WEEK = 7;
	   public final static int DAY_OF_WEEK_IN_MONTH = 8;
	   public final static int AM_PM = 9;
	    public final static int HOUR = 10;

	    /**
	     * Field number for <code>get</code> and <code>set</code> indicating the
	     * hour of the day. <code>HOUR_OF_DAY</code> is used for the 24-hour clock.
	     * E.g., at 10:04:15.250 PM the <code>HOUR_OF_DAY</code> is 22.
	     *
	     * @see #HOUR
	     */
	    public final static int HOUR_OF_DAY = 11;

	    /**
	     * Field number for <code>get</code> and <code>set</code> indicating the
	     * minute within the hour.
	     * E.g., at 10:04:15.250 PM the <code>MINUTE</code> is 4.
	     */
	    public final static int MINUTE = 12;

	    /**
	     * Field number for <code>get</code> and <code>set</code> indicating the
	     * second within the minute.
	     * E.g., at 10:04:15.250 PM the <code>SECOND</code> is 15.
	     */
	    public final static int SECOND = 13;

	    /**
	     * Field number for <code>get</code> and <code>set</code> indicating the
	     * millisecond within the second.
	     * E.g., at 10:04:15.250 PM the <code>MILLISECOND</code> is 250.
	     */
	    public final static int MILLISECOND = 14;

	    /**
	     * Field number for <code>get</code> and <code>set</code>
	     * indicating the raw offset from GMT in milliseconds.
	     * <p>
	     * This field reflects the correct GMT offset value of the time
	     * zone of this <code>Calendar</code> if the
	     * <code>TimeZone</code> implementation subclass supports
	     * historical GMT offset changes.
	     */
	    public final static int ZONE_OFFSET = 15;

	    /**
	     * Field number for <code>get</code> and <code>set</code> indicating the
	     * daylight saving offset in milliseconds.
	     * <p>
	     * This field reflects the correct daylight saving offset value of
	     * the time zone of this <code>Calendar</code> if the
	     * <code>TimeZone</code> implementation subclass supports
	     * historical Daylight Saving Time schedule changes.
	     */
	    public final static int DST_OFFSET = 16;

	    /**
	     * The number of distinct fields recognized by <code>get</code> and <code>set</code>.
	     * Field numbers range from <code>0..FIELD_COUNT-1</code>.
	     */
	    public final static int FIELD_COUNT = 17;

	    /**
	     * Value of the {@link #DAY_OF_WEEK} field indicating
	     * Sunday.
	     */
	    public final static int SUNDAY = 1;

	    /**
	     * Value of the {@link #DAY_OF_WEEK} field indicating
	     * Monday.
	     */
	    public final static int MONDAY = 2;

	    /**
	     * Value of the {@link #DAY_OF_WEEK} field indicating
	     * Tuesday.
	     */
	    public final static int TUESDAY = 3;

	    /**
	     * Value of the {@link #DAY_OF_WEEK} field indicating
	     * Wednesday.
	     */
	    public final static int WEDNESDAY = 4;

	    /**
	     * Value of the {@link #DAY_OF_WEEK} field indicating
	     * Thursday.
	     */
	    public final static int THURSDAY = 5;

	    /**
	     * Value of the {@link #DAY_OF_WEEK} field indicating
	     * Friday.
	     */
	    public final static int FRIDAY = 6;

	    /**
	     * Value of the {@link #DAY_OF_WEEK} field indicating
	     * Saturday.
	     */
	    public final static int SATURDAY = 7;

	    /**
	     * Value of the {@link #MONTH} field indicating the
	     * first month of the year in the Gregorian and Julian calendars.
	     */
	    public final static int JANUARY = 0;

	    /**
	     * Value of the {@link #MONTH} field indicating the
	     * second month of the year in the Gregorian and Julian calendars.
	     */
	    public final static int FEBRUARY = 1;

	    /**
	     * Value of the {@link #MONTH} field indicating the
	     * third month of the year in the Gregorian and Julian calendars.
	     */
	    public final static int MARCH = 2;

	    /**
	     * Value of the {@link #MONTH} field indicating the
	     * fourth month of the year in the Gregorian and Julian calendars.
	     */
	    public final static int APRIL = 3;

	    /**
	     * Value of the {@link #MONTH} field indicating the
	     * fifth month of the year in the Gregorian and Julian calendars.
	     */
	    public final static int MAY = 4;

	    /**
	     * Value of the {@link #MONTH} field indicating the
	     * sixth month of the year in the Gregorian and Julian calendars.
	     */
	    public final static int JUNE = 5;

	    /**
	     * Value of the {@link #MONTH} field indicating the
	     * seventh month of the year in the Gregorian and Julian calendars.
	     */
	    public final static int JULY = 6;

	    /**
	     * Value of the {@link #MONTH} field indicating the
	     * eighth month of the year in the Gregorian and Julian calendars.
	     */
	    public final static int AUGUST = 7;

	    /**
	     * Value of the {@link #MONTH} field indicating the
	     * ninth month of the year in the Gregorian and Julian calendars.
	     */
	    public final static int SEPTEMBER = 8;

	    /**
	     * Value of the {@link #MONTH} field indicating the
	     * tenth month of the year in the Gregorian and Julian calendars.
	     */
	    public final static int OCTOBER = 9;

	    /**
	     * Value of the {@link #MONTH} field indicating the
	     * eleventh month of the year in the Gregorian and Julian calendars.
	     */
	    public final static int NOVEMBER = 10;

	    /**
	     * Value of the {@link #MONTH} field indicating the
	     * twelfth month of the year in the Gregorian and Julian calendars.
	     */
	    public final static int DECEMBER = 11;

	    /**
	     * Value of the {@link #MONTH} field indicating the
	     * thirteenth month of the year. Although <code>GregorianCalendar</code>
	     * does not use this value, lunar calendars do.
	     */
	    public final static int UNDECIMBER = 12;

	    /**
	     * Value of the {@link #AM_PM} field indicating the
	     * period of the day from midnight to just before noon.
	     */
	    public final static int AM = 0;

	    /**
	     * Value of the {@link #AM_PM} field indicating the
	     * period of the day from noon to just before midnight.
	     */
	    public final static int PM = 1;

	    /**
	     * A style specifier for {@link #getDisplayNames(int, int, Locale)
	     * getDisplayNames} indicating names in all styles, such as
	     * "January" and "Jan".
	     *
	     * @see #SHORT_FORMAT
	     * @see #LONG_FORMAT
	     * @see #SHORT_STANDALONE
	     * @see #LONG_STANDALONE
	     * @see #SHORT
	     * @see #LONG
	     * @since 1.6
	     */
	    public static final int ALL_STYLES = 0;

	    static final int STANDALONE_MASK = 0x8000;

	    /**
	     * A style specifier for {@link #getDisplayName(int, int, Locale)
	     * getDisplayName} and {@link #getDisplayNames(int, int, Locale)
	     * getDisplayNames} equivalent to {@link #SHORT_FORMAT}.
	     *
	     * @see #SHORT_STANDALONE
	     * @see #LONG
	     * @since 1.6
	     */
	    public static final int SHORT = 1;

	    /**
	     * A style specifier for {@link #getDisplayName(int, int, Locale)
	     * getDisplayName} and {@link #getDisplayNames(int, int, Locale)
	     * getDisplayNames} equivalent to {@link #LONG_FORMAT}.
	     *
	     * @see #LONG_STANDALONE
	     * @see #SHORT
	     * @since 1.6
	     */
	    public static final int LONG = 2;

	    /**
	     * A style specifier for {@link #getDisplayName(int, int, Locale)
	     * getDisplayName} and {@link #getDisplayNames(int, int, Locale)
	     * getDisplayNames} indicating a narrow name used for format. Narrow names
	     * are typically single character strings, such as "M" for Monday.
	     *
	     * @see #NARROW_STANDALONE
	     * @see #SHORT_FORMAT
	     * @see #LONG_FORMAT
	     * @since 1.8
	     */
	    public static final int NARROW_FORMAT = 4;

	    /**
	     * A style specifier for {@link #getDisplayName(int, int, Locale)
	     * getDisplayName} and {@link #getDisplayNames(int, int, Locale)
	     * getDisplayNames} indicating a narrow name independently. Narrow names
	     * are typically single character strings, such as "M" for Monday.
	     *
	     * @see #NARROW_FORMAT
	     * @see #SHORT_STANDALONE
	     * @see #LONG_STANDALONE
	     * @since 1.8
	     */
	    public static final int NARROW_STANDALONE = NARROW_FORMAT | STANDALONE_MASK;

	    /**
	     * A style specifier for {@link #getDisplayName(int, int, Locale)
	     * getDisplayName} and {@link #getDisplayNames(int, int, Locale)
	     * getDisplayNames} indicating a short name used for format.
	     *
	     * @see #SHORT_STANDALONE
	     * @see #LONG_FORMAT
	     * @see #LONG_STANDALONE
	     * @since 1.8
	     */
	    public static final int SHORT_FORMAT = 1;

	    /**
	     * A style specifier for {@link #getDisplayName(int, int, Locale)
	     * getDisplayName} and {@link #getDisplayNames(int, int, Locale)
	     * getDisplayNames} indicating a long name used for format.
	     *
	     * @see #LONG_STANDALONE
	     * @see #SHORT_FORMAT
	     * @see #SHORT_STANDALONE
	     * @since 1.8
	     */
	    public static final int LONG_FORMAT = 2;


	public int compareTo(Calendar o) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	protected void computeTime() {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void computeFields() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void add(int field, int amount) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void roll(int field, boolean up) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getMinimum(int field) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getMaximum(int field) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getGreatestMinimum(int field) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

	@Override
	public int getLeastMaximum(int field) {
		// TODO Auto-generated method stub
		return 0;
	}

	public static int getYear() {
		return YEAR;
	}

	public static int getMonth() {
		return MONTH;
	}

	public static int getWeekOfYear() {
		return WEEK_OF_YEAR;
	}

	public static int getWeekOfMonth() {
		return WEEK_OF_MONTH;
	}

	public static int getDate() {
		return DATE;
	}

	public static int getDayOfMonth() {
		return DAY_OF_MONTH;
	}

	public static int getDayOfYear() {
		return DAY_OF_YEAR;
	}

	public static int getDayOfWeek() {
		return DAY_OF_WEEK;
	}

	public static int getDayOfWeekInMonth() {
		return DAY_OF_WEEK_IN_MONTH;
	}

	public static int getAmPm() {
		return AM_PM;
	}

	public static int getHour() {
		return HOUR;
	}

	public static int getHourOfDay() {
		return HOUR_OF_DAY;
	}

	public static int getMinute() {
		return MINUTE;
	}

	public static int getSecond() {
		return SECOND;
	}

	public static int getMillisecond() {
		return MILLISECOND;
	}

	public static int getZoneOffset() {
		return ZONE_OFFSET;
	}

	public static int getDstOffset() {
		return DST_OFFSET;
	}

	public static int getFieldCount() {
		return FIELD_COUNT;
	}

	public static int getSunday() {
		return SUNDAY;
	}

	public static int getMonday() {
		return MONDAY;
	}

	public static int getTuesday() {
		return TUESDAY;
	}

	public static int getWednesday() {
		return WEDNESDAY;
	}

	public static int getThursday() {
		return THURSDAY;
	}

	public static int getFriday() {
		return FRIDAY;
	}

	public static int getSaturday() {
		return SATURDAY;
	}

	public static int getJanuary() {
		return JANUARY;
	}

	public static int getFebruary() {
		return FEBRUARY;
	}

	public static int getMarch() {
		return MARCH;
	}

	public static int getApril() {
		return APRIL;
	}

	public static int getMay() {
		return MAY;
	}

	public static int getJune() {
		return JUNE;
	}

	public static int getJuly() {
		return JULY;
	}

	public static int getAugust() {
		return AUGUST;
	}

	public static int getSeptember() {
		return SEPTEMBER;
	}

	public static int getOctober() {
		return OCTOBER;
	}

	public static int getNovember() {
		return NOVEMBER;
	}

	public static int getDecember() {
		return DECEMBER;
	}

	public static int getUndecimber() {
		return UNDECIMBER;
	}

	public static int getAm() {
		return AM;
	}

	public static int getPm() {
		return PM;
	}

	public static int getAllStyles() {
		return ALL_STYLES;
	}

	public static int getStandaloneMask() {
		return STANDALONE_MASK;
	}

	public static int getShort() {
		return SHORT;
	}

	public static int getLong() {
		return LONG;
	}

	public static int getNarrowFormat() {
		return NARROW_FORMAT;
	}

	public static int getNarrowStandalone() {
		return NARROW_STANDALONE;
	}

	public static int getShortFormat() {
		return SHORT_FORMAT;
	}

	public static int getLongFormat() {
		return LONG_FORMAT;
	}
	
}
