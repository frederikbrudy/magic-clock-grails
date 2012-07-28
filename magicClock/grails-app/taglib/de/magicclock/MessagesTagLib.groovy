package de.magicclock

class MessagesTagLib {

  def noticeMsg = {attrs, body ->
    out << "<div>"
    out << "<span class='notice'>${attrs.msg}</span>"
    out << "<div class='spaceLittle'>&nbsp;</div>"
    out << "</div>"
  }

  def errorMsg = {attrs, body ->
    out << "<div>"
    out << "<span class='error'>${attrs.msg}</span>"
    out << "<div class='spaceLittle'>&nbsp;</div>"
    out << "</div>"
  }

  def successMsg = {attrs, body ->
    out << "<div>"
    out << "<span class='success'>${attrs.msg}</span>"
    out << "<div class='spaceLittle'>&nbsp;</div>"
    out << "</div>"
  }
}
