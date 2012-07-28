package de.magicclock

class MagicClockService {

  public static final int STATUS_OK = 0;
  public static final int STATUS_MISSING_REQUIRED_ATTR = 1;
  public static final int STATUS_COULD_NOT_UPDATE_LOCATION = 2;
  public static final int STATUS_SERVER_ERROR = 3;

  static transactional = true

  def updateLocation(key, lon, lat) {
    log.debug "updateLocation called with key: $key, lon: $lon, lat: $lat"
    def attrs = [:]
    attrs.msg = ""
    def user = MagicClockUser.findByKey(key);

    // Check if there is a user for the given key
    if(!user) {
      attrs.msg += "Could not find user for key: [$key]."
      return [STATUS_SERVER_ERROR, attrs]
    }

    attrs.locationOld = "${user.location}"

    // Check if the user can receive updates
    if(!user.receiveUpdates) {
      attrs.msg += "Location update rejected, because location has been set manually."
      attrs.locationNew = attrs.locationOld
      return [STATUS_COULD_NOT_UPDATE_LOCATION, attrs]
    }

    // Check if the given coordinates match a location
    def coords = new GeographicCoordinate(lon: lon, lat:lat);
    Location location = Location.list().find { it.contains(coords)}

    if(location) {
      log.debug "Location found: $location"
    } else {
      log.debug "Location not found. Using UNTERWEGS"
      location = Location.findByTag(LocationTag.UNTERWEGS);
    }

    def now = new Date()
    user.lastLocationUpdate = now

    // Create a new update history entry
    def uh = new UpdateHistoryEntry(time: now, key: user.key, locationOld: user.location.key, locationNew: location.key, longitude: lon, latitude:lat)
    
    // assign the new location
    user.location = location

    if (!user.hasErrors() && user.save(flush: true)) {
      attrs.locationNew = "${user.location}"
      attrs.msg += "Location updated successfully."
      // Save the update history entry
      if(!uh.save()) {
        log.debug "Save of updateHistoryEntry failed: ${uh}. Errors: ${uh.errors.allErrors}"
      }
    } else {
      attrs.locationNew = attrs.locationOld
      attrs.msg += "User save failed. Errors: ${user.errors.allErrors}."
      return [STATUS_SERVER_ERROR, attrs]
    }

    // assign a clock hand
    if(user.assignedClockHand == null) {
      ClockHand freeCH = getFreeClockHand()
      if(!freeCH) {
        attrs.msg += " But: could not find free clock hand. Assigning clock hand failed."
        log.debug "freeCH: $freeCH"
        return [STATUS_SERVER_ERROR, attrs]
      } else {
        user.assignedClockHand = freeCH
      }
    }

    // assign a color
    if(user.color == null) {
      MagicClockColor freeColor = getFreeColor(user.favoriteColor)
      log.debug "Color to be assigned: ${freeColor}"
      if(!freeColor) {
        attrs.msg += " But: could not find free color. Assigning color failed."
        log.debug "freeColor: $freeColor"
        return [STATUS_SERVER_ERROR, attrs]
      } else {
        user.color = freeColor
      }
    }
    // save the user
    if (!user.hasErrors() && user.save(flush: true)) {
      return [STATUS_OK, attrs]
      attrs.msg += " Assigning clockHand and color."
    } else {
      attrs.msg += " Assigning clockHand and color failed. Reason: Could not save to database. Errors: ${user.errors.allErrors}."
      return [STATUS_SERVER_ERROR, attrs]
    }
  }

  private ClockHand getFreeClockHand() {
    def usedClockHands = [] as Set
    def allClockHands = ClockHand.values() as Set

    MagicClockUser.list().each { user->
      if(user.assignedClockHand != null) {
        usedClockHands.add(user.assignedClockHand)
      }
    }

    if(usedClockHands.equals(allClockHands)) {
      return null
    } else {
      HashSet freeClockHands = (allClockHands-usedClockHands)
      return freeClockHands.toArray()[0]
    }
  }

  private MagicClockColor getFreeColor(favoriteColor) {
    def usedColors = [] as Set
    def allColors = MagicClockColor.values() as Set
    MagicClockUser.list().each { user ->
      if(user.color != null) {
        usedColors.add(user.color)
      }

    }
    log.debug "Colors used: ${usedColors}"
    log.debug "All colors: ${allColors}"
    if(usedColors.equals(allColors)) {
      return null;
    } else {
      if(!(favoriteColor in usedColors)) {
        return favoriteColor
      } else {
        HashSet freeColors = (allColors - usedColors)
        return freeColors.toArray()[0]
      }
    }
  }

  public String getData() {
    def buffer = new StringBuffer("{")
    def data = []
    ClockHand.values().each {
      def user = MagicClockUser.findByAssignedClockHand(it)
      if(user && user.color && user.location) {
        data.add(user.color.value + ":" + user.location.tag.value)
      } else {
        data.add("00:07")
      }
    }

    buffer.append(data.join("|"))
    buffer.append("}")
    return buffer.toString()
  }

  public void checkTimeout(MagicClockUser user) {
    def now = new Date()
    def twoH = (2*60*60*1000)
    if(user && user.lastLocationUpdate) {
      if(now.time - user.lastLocationUpdate.time > twoH) { // time since last update > 2 hours
//        log.debug "user timed out."
        user.color = null;
        user.assignedClockHand = null;
        user.location = Location.findByTag(LocationTag.UNTERWEGS);
        if(!user.save(flush: true)) log.error "MagicClockUser save failed. ${user}"
      } else {
//        log.debug "user not timed out"
      }
    } else {
//      log.debug "User not found or lastLocationUpdate == null"
    }
  }

  public void checkTimeoutAllUsers() {
    MagicClockUser.list().each {checkTimeout(it)}
  }
}

