package de.magicclock

class GeographicCoordinate {
  String key

  int lon
  int lat

  static constraints = {
    key (nullable: false, unique: true)
  }

  static mapping = {
    key column:'`key`'
  }



  public String toString ( ) {  key }

  public static int decimalToMicroDegrees(BigDecimal deg) {
    return ((int) deg * 1000000)   
  }

}
