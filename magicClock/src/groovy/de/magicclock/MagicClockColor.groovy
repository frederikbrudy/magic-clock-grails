package de.magicclock

/**
 * Created by IntelliJ IDEA.
 * User: cb
 * Date: 05.06.2012
 * Time: 10:57:13
 * To change this template use File | Settings | File Templates.
 *
 *
 */
public enum MagicClockColor { // TODO: set up your own colors
  RED("01"),
  GREEN("02"),
  BLUE("03"),
  YELLOW("04"),
  WHITE("05"),
  VIOLET("06")

  private String value
  public MagicClockColor(value) {this.value = value}
}

