package de.magicclock

import groovy.xml.MarkupBuilder

class MagicClockRestController {
  def magicClockService
  def updateLocationAction = {
    log.debug "updateLocation called with params: $params"

    def attrs = [:]
    attrs.msg = ""
    def missingRequired = false;
    def missingAttr = []

    def location = (params.location) ?: null;
    if(location) {
      if(location.equals("unterwegs")) {
        params.lat = "48.110376"
        params.lon = "11.510859"
      } else if(location.equals("aufreisen")) {
        // Island of Java
        params.lat = "-7.449624"
        params.lon =  "111.174316"
      } else {
        def loc = Location.findByKey(location)
        if(loc) {
          params.lon = (int)((loc.bottomLeft.lon + loc.topRight.lon) / 2)
          params.lat = (int)((loc.bottomLeft.lat + loc.topRight.lat) / 2)
          log.debug("Location param set (${location}). Using values: lat=${params.lat}, lon=${params.lon}");
        } else {
          attrs.msg += "Parameter location set but corresponding location could not be found: [${location}]. "
        }
      }
    } else {
      attrs.msg += "Parameter location set but has no value."
    }

    def lon = null

    if(params.lon) {
      if(String.valueOf(params.lon).contains(".")) {
        lon = (int) GeographicCoordinate.decimalToMicroDegrees(params.lon.toBigDecimal())
      } else  {
        lon = params.lon as Integer
      }
    }

    def lat = null

    if(params.lat) {
      if(params.lat instanceof BigDecimal || params.lat instanceof Double || String.valueOf(params.lat).contains(".")) {
        lat = (int) GeographicCoordinate.decimalToMicroDegrees(params.lat.toBigDecimal())
      } else if(params.lat instanceof Integer || params.lat instanceof String) {
        lat = params.lat as Integer
      }
    }

    log.debug "Cleaned lon and lat. Using: lat=${lat}, lon=${lon}"

    def key = (params.key) ? String.valueOf(params.key) : null;
    def ans = (params.ans) ? String.valueOf(params.ans) : "txt";

    // Check if all required attrs are set
    if(lon==null||lat==null||key==null) missingRequired = true
    if(lon == null) missingAttr.add("lon")
    if(lat == null) missingAttr.add("lat")
    if(key == null) missingAttr.add("key")

    if(missingRequired) {
      attrs.msg += "Missing required attributes: ${missingAttr}"
      log.debug attrs.msg
      respond(magicClockService.STATUS_MISSING_REQUIRED_ATTR, attrs, ans)
      return
    }

    def (status, updateAttrs) = magicClockService.updateLocation(key, lon, lat)
    attrs += updateAttrs
    respond(status, attrs, ans)
  }

  private def respond(status, attrs, ans) {
    attrs.status = status
    response.status = 200

    log.debug "Responding with status: ${status},  attrs: ${attrs}"
    if(ans.equals('xml')) {
      def writer = new StringWriter()
      def xml = new MarkupBuilder(writer)
      render(contentType: "text/xml", encoding: "UTF-8") {
        'updateLocation'(attrs)
      }
    } else {
      render(template: 'plainAnswer', model: [text: status], contentType: 'text/plain')
    }
  }

  def getData = {
    log.debug "getData called with params: ${params}"
    magicClockService.checkTimeoutAllUsers()
    String text = magicClockService.getData()

    response.status = 200
    render(template: 'plainAnswer', model: [text: text], contentType: 'text/plain')
  }
}
