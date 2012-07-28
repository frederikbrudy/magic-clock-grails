import de.magicclock.MagicClockUser
import de.magicclock.GeographicCoordinate
import de.magicclock.Location
import de.magicclock.LocationTag
import de.magicclock.MagicClockColor

class BootStrap {

  def init = { servletContext ->
    setUpLocations()
    setUpMagicClockUsers()
  }

  private def setUpLocations() {
    // TODO: define your own locations
    def coordinates = [
            // Home John
            'home.john.tL'  : [lon: -16230476,  lat:-70728979],
            'home.john.tR'  : [lon: 144082024,  lat:-66791909],
            'home.john.bL'  : [lon: -2519538,  lat:-84770528],
            'home.john.bR'  : [lon: 153925774,  lat:-84507816],

            // Uni Amalienstraße
            'uni.amalien.tL'  : [lon: 11575566, lat: 48147282],
            'uni.amalien.tR'  : [lon: 11576655, lat: 48147176],
            'uni.amalien.bL'  : [lon: 11575639, lat: 48146682],
            'uni.amalien.bR'  : [lon: 11576687, lat: 48146702],


            // Sport Zentraler Hochschulsport
            'sport.hochschulsport.tL'  : [lon: 11539593, lat: 48185689],
            'sport.hochschulsport.tR'  : [lon: 11550665, lat: 48186318],
            'sport.hochschulsport.bL'  : [lon: 11539764, lat: 48176561],
            'sport.hochschulsport.bR'  : [lon: 11551867, lat: 48176561],

            // Gefängnis Stadlheim

            'prison.stadlheim.tL'  : [lon: 11588451, lat: 48102201],
            'prison.stadlheim.tR'  : [lon: 11596198, lat: 48102201],
            'prison.stadlheim.bL'  : [lon: 11588451, lat: 48097357],
            'prison.stadlheim.bR'  : [lon: 11596198, lat: 48097357],

            // Feiern Glockenbach
            'feiern.glockenbach.tL'  : [lon: 11566929, lat: 48135076],
            'feiern.glockenbach.tR'  : [lon: 11577658, lat: 48135076],
            'feiern.glockenbach.bL'  : [lon: 11566929, lat: 48129405],
            'feiern.glockenbach.bR'  : [lon: 11577658, lat: 48129405],

            // Essen Kistenpfennig
            'essen.kistenpfennig.tL'  : [lon:11576618,  lat:48147656],
            'essen.kistenpfennig.tR'  : [lon:11577181,  lat:48147670],
            'essen.kistenpfennig.bL'  : [lon:11576618,  lat:48147284],
            'essen.kistenpfennig.bR'  : [lon:11577187,  lat:48147262],

            // Chillen Eng Garten
            'chillen.enggarten.tL'  : [lon: 11585040,  lat:48152373],
            'chillen.enggarten.tR'  : [lon: 11594481,  lat:48152373],
            'chillen.enggarten.bL'  : [lon: 11584396,  lat:48146303],
            'chillen.enggarten.bR'  : [lon: 11593966,  lat:48146274],

            // Krankenhaus Schwabing
            'krankenhaus.schwabing.tL'  : [lon: 11574819,  lat:48173012],
            'krankenhaus.schwabing.tR'  : [lon: 11581943,  lat:48173470],
            'krankenhaus.schwabing.bL'  : [lon: 11574948,  lat:48170436],
            'krankenhaus.schwabing.bR'  : [lon: 11582673,  lat:48170808],

            // Lost (Antarktis)
            'lost.arktis.tL'  : [lon: -16230476,  lat:-70728979],
            'lost.arktis.tR'  : [lon: 144082024,  lat:-66791909],
            'lost.arktis.bL'  : [lon: -2519538,  lat:-84770528],
            'lost.arktis.bR'  : [lon: 153925774,  lat:-84507816],

            // Auf Arbeit (BMW)
            'work.bmw.tL'  : [lon:11572593 ,  lat:48188936],
            'work.bmw.tR'  : [lon:11575157 ,  lat:48188908],
            'work.bmw.bL'  : [lon:11572754 ,  lat:48187663],
            'work.bmw.bR'  : [lon:11575264 ,  lat:48187727],


            // Auf Reisen (out of town)
            'aufreisen.tL'  : [lon: 11271515,  lat:48328865],
            'aufreisen.tR'  : [lon: 11881256,  lat:48345297],
            'aufreisen.bL'  : [lon: 11079254,  lat:47770714],
            'aufreisen.bR'  : [lon: 12043304,  lat:47807621]

    ]

    coordinates.each { key, values ->
      def coordinate = GeographicCoordinate.findByKey(key)

      if(!coordinate) {
        coordinate = new GeographicCoordinate(key: key, lon: values.lon, lat: values.lat).save(flush: true, failOnError: true)
      } else {
        log.debug "GeographicCoordinate ${coordinate} already exists."
      }
    }

    def locations = [
            'home.john' : [
                    tag:            LocationTag.HOME,
                    topLeft:        GeographicCoordinate.findByKey('home.john.tL'),
                    topRight:       GeographicCoordinate.findByKey('home.john.tR'),
                    bottomLeft:     GeographicCoordinate.findByKey('home.john.bL'),
                    bottomRight:    GeographicCoordinate.findByKey('home.john.bR'),
            ],
            // Amalienstraße
            'uni.amalien' : [
                    tag:        LocationTag.UNI,
                    topLeft:    GeographicCoordinate.findByKey('uni.amalien.tL'),
                    topRight:   GeographicCoordinate.findByKey('uni.amalien.tR'),
                    bottomLeft: GeographicCoordinate.findByKey('uni.amalien.bL'),
                    bottomRight:GeographicCoordinate.findByKey('uni.amalien.bR'),
                    description: "Amalienstraße"
            ],
            // SPORT (zentraler hochschulsport im olympiapark)
            'sport.hochschulsport' : [
                    tag:        LocationTag.SPORT,
                    topLeft:    GeographicCoordinate.findByKey('sport.hochschulsport.tL'),
                    topRight:   GeographicCoordinate.findByKey('sport.hochschulsport.tR'),
                    bottomLeft: GeographicCoordinate.findByKey('sport.hochschulsport.bL'),
                    bottomRight:GeographicCoordinate.findByKey('sport.hochschulsport.bR'),
                    description: "Zentraler Hochschulsport im Olympiapark"
            ],
            'unterwegs' : [
                    tag:        LocationTag.UNTERWEGS,
                    topLeft:    null,
                    topRight:   null,
                    bottomLeft: null,
                    bottomRight:null
            ],

            // PRISON (Stadelheim)
            'prison.stadlheim' : [
                    tag:        LocationTag.GEFAENGNIS,
                    topLeft:    GeographicCoordinate.findByKey('prison.stadlheim.tL'),
                    topRight:   GeographicCoordinate.findByKey('prison.stadlheim.tR'),
                    bottomLeft: GeographicCoordinate.findByKey('prison.stadlheim.bL'),
                    bottomRight:GeographicCoordinate.findByKey('prison.stadlheim.bR'),
                    description: "Stadelheim"
            ],
            // AM_FEIERN (Glockenbach)
            'feiern.glockenbach' : [
                    tag:        LocationTag.AM_FEIERN,
                    topLeft:    GeographicCoordinate.findByKey('feiern.glockenbach.tL'),
                    topRight:   GeographicCoordinate.findByKey('feiern.glockenbach.tR'),
                    bottomLeft: GeographicCoordinate.findByKey('feiern.glockenbach.bL'),
                    bottomRight:GeographicCoordinate.findByKey('feiern.glockenbach.bR'),
                    description: "Glockenbach"
            ],
            // BEIM_ESSEN (Kistenpfennig)
            'essen.kistenpfennig' : [
                    tag:        LocationTag.BEIM_ESSEN,
                    topLeft:    GeographicCoordinate.findByKey('essen.kistenpfennig.tL'),
                    topRight:   GeographicCoordinate.findByKey('essen.kistenpfennig.tR'),
                    bottomLeft: GeographicCoordinate.findByKey('essen.kistenpfennig.bL'),
                    bottomRight:GeographicCoordinate.findByKey('essen.kistenpfennig.bR'),
                    description: "Kistenpfennig"
            ],
            // AM CHILLEN (Englischer Garten)
            'chillen.enggarten' : [
                    tag:        LocationTag.AM_CHILLEN,
                    topLeft:    GeographicCoordinate.findByKey('chillen.enggarten.tL'),
                    topRight:   GeographicCoordinate.findByKey('chillen.enggarten.tR'),
                    bottomLeft: GeographicCoordinate.findByKey('chillen.enggarten.bL'),
                    bottomRight:GeographicCoordinate.findByKey('chillen.enggarten.bR'),
                    description: "Englischer Garten"
            ],

            // Auf Reisen (außerhalb Münchens)
            'aufreisen' : [
                    tag:        LocationTag.AUF_REISEN,
                    topLeft:    GeographicCoordinate.findByKey('aufreisen.tL'),
                    topRight:   GeographicCoordinate.findByKey('aufreisen.tR'),
                    bottomLeft: GeographicCoordinate.findByKey('aufreisen.bL'),
                    bottomRight:GeographicCoordinate.findByKey('aufreisen.bR'),
                    description: "Außerhalb Münchens unterwegs"
            ],

            // AM CHILLEN (Englischer Garten)
            'work.bmw' : [
                    tag:        LocationTag.ARBEIT,
                    topLeft:    GeographicCoordinate.findByKey('work.bmw.tL'),
                    topRight:   GeographicCoordinate.findByKey('work.bmw.tR'),
                    bottomLeft: GeographicCoordinate.findByKey('work.bmw.bL'),
                    bottomRight:GeographicCoordinate.findByKey('work.bmw.bR'),
                    description: "Auf Arbeit bei BMW."
            ],

            // Lost Arktis
            'lost.arktis' : [
                    tag:        LocationTag.AUF_REISEN,
                    topLeft:    GeographicCoordinate.findByKey('lost.arktis.tL'),
                    topRight:   GeographicCoordinate.findByKey('lost.arktis.tR'),
                    bottomLeft: GeographicCoordinate.findByKey('lost.arktis.bL'),
                    bottomRight:GeographicCoordinate.findByKey('lost.arktis.bR'),
                    description: "Verloren in der Antarktis."
            ],

            //  Krankenhaus Schwabing
            'krankenhaus.schwabing' : [
                    tag:        LocationTag.KRANKENHAUS,
                    topLeft:    GeographicCoordinate.findByKey('krankenhaus.schwabing.tL'),
                    topRight:   GeographicCoordinate.findByKey('krankenhaus.schwabing.tR'),
                    bottomLeft: GeographicCoordinate.findByKey('krankenhaus.schwabing.bL'),
                    bottomRight:GeographicCoordinate.findByKey('krankenhaus.schwabing.bR'),
                    description: "Im Krankenhaus Schwabing"
            ]
    ]

    locations.each {key, values ->
      def location = Location.findByKey(key)

      if(!location) {
        location = new Location(
                key: key,
                tag: values.tag,
                topLeft: values.topLeft,
                topRight: values.topRight,
                bottomLeft: values.bottomLeft,
                bottomRight: values.bottomRight,
                description: (values.description)?: null
        ).save(flush: true, failOnError: true)
        log.debug "Created location: ${location}"
      } else {
        log.debug "Location ${location} already exists"
      }
    }
  }

  private def setUpMagicClockUsers() {
    // TODO: define your own Users to show on the clock
    def magicClockUsers = [
            'John':[favoriteColor: MagicClockColor.RED, home: Location.findByKey('home.john'), location: Location.findByTag(LocationTag.UNTERWEGS)],
    ]

    magicClockUsers.each {key, values ->
      def magicClockUser = MagicClockUser.findByKey(key)

      if(!magicClockUser) {
        magicClockUser = new MagicClockUser(
                key: key,
                favoriteColor: values.favoriteColor,
                home: values.home,
                location: values.location
        ).save(flush: true, failOnError: true)

        log.debug "Created MagicClockUser: ${magicClockUser}"
      } else {
        log.debug "MagicClockUser ${magicClockUser} already exists."
      }
    }
  }

  def destroy = {
  }
}
