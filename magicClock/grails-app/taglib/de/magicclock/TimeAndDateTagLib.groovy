package de.magicclock

class TimeAndDateTagLib {

  def timeSince = {attrs, body ->
    def now = new Date()
    def date = attrs.date

    def timedOut = false

    int ms = now.time - date.time

    int s = ms / 1000
    int m = s / 60
    int h = m / 60
    int d = h / 24

    def buffer = new StringBuffer()
    if(h >= 2 || d > 2) timedOut = true

    if(d > 0) {
      if(d == 1)     buffer.append("$d day")
      else if(d > 1) buffer.append("$d days")

      int hours = h % 24
      if(hours > 0) {
        buffer.append(" and ")
        if(hours == 1) buffer.append("$hours hour")
        else if(hours > 1) buffer.append("$hours hours")
      }
    } else { // Case: less than one day ago
      if(h > 0) {
        if(h == 1)    buffer.append("$h hour")
        else if(h > 1)buffer.append("$h hours")

        int min = m % 60
        if(min > 0) {
          buffer.append(" and ")
          if(min == 1)     buffer.append("$min minute")
          else if(min > 1) buffer.append("$min minutes")
        }
      } else { // Case: less than one hour ago
        if(m > 0) {
          if(m == 1)        buffer.append("$m minute")
          else if(m > 1)    buffer.append("$m minutes")
        } else { // Case: less than one minute ago
//          buffer.append("less than one minute")
          if(s < 5) {
            buffer.append("few seconds")
          } else {
            buffer.append("$s seconds")
          }
        }
      }
    }
    out << "<span>${buffer.toString()} ago"
    if(timedOut) out << " (timed out)"
    out << "</span>"
  }

}
