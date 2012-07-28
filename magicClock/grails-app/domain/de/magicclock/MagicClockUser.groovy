package de.magicclock

class MagicClockUser {
  String key
  MagicClockColor favoriteColor
  MagicClockColor color = null

  Location home
  Location location
  Date lastLocationUpdate = null
  ClockHand assignedClockHand = null

  Boolean receiveUpdates = true


  static constraints = {
    key (unique: true, blank: false)
    color (nullable: true, unique: true)
    lastLocationUpdate (nullable: true)
    assignedClockHand (nullable: true)
  }

  static mapping = {
    key column:'`key`'
  }

  public String toString ( ) {
    return "MagicClockUser{" +
            "key='" + key + '\'' +
            ", color=" + color +
            '}' ;
  }
}
