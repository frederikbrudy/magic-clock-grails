class UrlMappings {

  static mappings = {
    "/rest/updateLocation" (controller: 'magicClockRest', action: 'updateLocationAction')
    "/rest/getData" (controller: 'magicClockRest', action: 'getData')

    "/$controller/$action?/$id?"{
      constraints {
        // apply constraints here
      }
    }

    "/"(controller: 'magicClockUser')
    "500"(view:'/error')
  }
}
