package de.magicclock

class UpdateHistoryEntry {

  Date time
  String key
  int longitude
  int latitude
  String locationOld
  String locationNew

  static mapping = {
    key column:'`key`'
  }

  static constraints = {
  }
}
