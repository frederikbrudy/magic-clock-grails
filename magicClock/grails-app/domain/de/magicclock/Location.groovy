package de.magicclock

class Location {

  String key
  LocationTag tag

  String description

  GeographicCoordinate topLeft
  GeographicCoordinate topRight

  GeographicCoordinate bottomLeft
  GeographicCoordinate bottomRight

  static constraints = {
    key (blank: false, unique: true)
    tag (blank: false)
    description ( nullable: true)
    topLeft (nullable: true)
    topRight (nullable: true)
    bottomLeft (nullable: true)
    bottomRight (nullable: true)
//    topLeft (nullable: true, validator: { val, obj ->
//      if(val.lon > obj.topRight.lon || val.lat < obj.bottomLeft.lat)
//        return false
//      else
//        return true
//    })
//
//    topRight (nullable: true, validator: { val, obj ->
//      if(val.lon < obj.topLeft.lon || val.lat < obj.bottomRight.lat)
//        return false
//      else
//        return true
//    })
//
//    bottomLeft (nullable: true, validator: { val, obj ->
//      if(val.lon > obj.bottomRight.lon || val.lat > obj.topLeft.lat)
//        return false
//      else
//        return true
//    })
//
//    bottomRight (nullable: true, validator: { val, obj ->
//      if(val.lon < obj.bottomLeft.lon || val.lat > obj.topRight.lat)
//        return false
//      else
//        return true
//    })
  }
  
  static mapping = {
    key column:'`key`'
  }

  public String toString ( ) {key}

  public boolean contains(GeographicCoordinate c) {
    if(tag != LocationTag.UNTERWEGS) {
      def minLon = Math.min(topLeft.lon, bottomLeft.lon)
      def maxLon = Math.max(topRight.lon, bottomRight.lon)

      def minLat = Math.min(bottomLeft.lat, bottomRight.lat)
      def maxLat = Math.max(topLeft.lat, topRight.lat)

//      log.debug "${c.lon} (c.lon) >= ${minLon} (minLon) == " + (c.lon >= minLon)
//      log.debug "&& ${c.lon} (c.lon) <= ${maxLon} (maxLon) == " +(c.lon <= maxLon)
//      log.debug "&& ${c.lat} (c.lat) >= ${minLat} (minLat) == " +(c.lat >= minLat)
//      log.debug "&& ${c.lat} (c.lat) <= ${maxLat} (maxLat) == " +(c.lat <= maxLat)
      if(c.lon >= minLon && c.lon <= maxLon && c.lat >= minLat && c.lat <= maxLat) {
        return (key.equals("aufreisen")) ? false : true;
      } else {
        return (key.equals("aufreisen")) ? true : false;
      }
    }
  }
}
