package de.magicclock

/**
 * Created by IntelliJ IDEA.
 * User: cb
 * Date: 05.06.2012
 * Time: 10:05:50
 * To change this template use File | Settings | File Templates.
 *
 *
 */
public enum LocationTag {   // TODO: set up your own locations
  HOME("01"),
  UNI("02"),
  AM_FEIERN("03"),
  GEFAENGNIS("04"),
  ARBEIT("05"),
  SPORT("06"),
  UNTERWEGS("07"),
  AUF_REISEN("08"),
  AM_CHILLEN("09"),
  KRANKENHAUS("10"),
  BEIM_ESSEN("11"),

  private String value
  public LocationTag(value) {this.value = value}
}