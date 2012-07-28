var Ajax;
if (Ajax && (Ajax != null)) {
    Ajax.Responders.register({
        onCreate: function() {
            if($('spinner') && Ajax.activeRequestCount>0)
                Effect.Appear('spinner',{duration:0.5,queue:'end'});
        },
        onComplete: function() {
            if($('spinner') && Ajax.activeRequestCount==0)
                Effect.Fade('spinner',{duration:0.5,queue:'end'});
        }
    });
}

$(function() {
    refreshFunctions();
});

/**
 * This function is needed, because the functions in the body would not work after an ajax-update otherwise.
 */
function refreshFunctions() {
    // MagicClock: uncheck receiveUpdates when location is set manually
    $('#selectLocationID').change(function(){
        $("#bioUserReceiveUpdates").prop("checked", false);
    });
}

function loadUpdateHistoryMaps() {
    $('#updateHistory_ids').children(".updateHistory_id").each(function() {
        var lat =  ($('#' + $(this).text() + '_lat').text())
        var lon = ($('#' + $(this).text() + '_lon').text())
        lat = parseFloat(lat / 1000000)
        lon = parseFloat(lon / 1000000)
        var latlng = new google.maps.LatLng(lat, lon);
        var key = $('#' + $(this).text() + '_key').text()
        var locationNew = $('#' + $(this).text() + '_locationNew').text()
        var zoom;
        if(locationNew.indexOf("HOME_") == 0) {
            zoom = 19;
        } else if(locationNew.indexOf("AUF_REISEN") == 0) {
            zoom = 4;
        } else {
            zoom = 15;
        }

        var myOptions = {
            zoom: zoom,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById($(this).text() + '_map'), myOptions);

        var marker = new google.maps.Marker({
            position: latlng,
            map: map,
            title: key + "@" + $('#' + $(this).text() + '_time').text()
        });

        var infowindow = new google.maps.InfoWindow({
            content: key + "@" + $('#' + $(this).text() + '_time').text()
        });

        infowindow.open(map,marker);
    });
}

function loadLocationMaps() {
    $('#location_ids').children(".location_id").each(function() {
        var key = $('#' + $(this).text() + '_key').text()
        if(key != "unterwegs") {
            var bounds = {
                "tL_lon": parseFloat($('#' + $(this).text() + '_tL_lon').text() /1000000),
                "tL_lat": parseFloat(($('#' + $(this).text() + '_tL_lat').text())/1000000),
                "tR_lon": parseFloat(($('#' + $(this).text() + '_tR_lon').text())/1000000),
                "tR_lat": parseFloat(($('#' + $(this).text() + '_tR_lat').text())/1000000),
                "bL_lon": parseFloat(($('#' + $(this).text() + '_bL_lon').text())/1000000),
                "bL_lat": parseFloat(($('#' + $(this).text() + '_bL_lat').text())/1000000),
                "bR_lon": parseFloat(($('#' + $(this).text() + '_bR_lon').text())/1000000),
                "bR_lat": parseFloat(($('#' + $(this).text() + '_bR_lat').text())/1000000)
            }

            // Determine center
            var lon = (bounds.bL_lon + bounds.tR_lon) / 2.0;
            var lat = (bounds.bL_lat + bounds.tR_lat) / 2.0;

            var latlng = new google.maps.LatLng(lat, lon);
            var zoom;
            if(key.indexOf("home.") == 0) {
                zoom = 19;
            } else if(key.indexOf("aufreisen") == 0 || key.indexOf("lost") == 0) {

                zoom = 2;
            } else {
                zoom = 15;
            }

            var myOptions = {
                zoom: zoom,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById($(this).text() + '_map'), myOptions);

            addMarker(key, lat, lon, map);

            addMarker("topLeft", bounds.tL_lat, bounds.tL_lon, map);
            addMarker("topRight", bounds.tR_lat, bounds.tR_lon, map);
            addMarker("bottomLeft", bounds.bL_lat, bounds.bL_lon, map);
            addMarker("bottomRight", bounds.bR_lat, bounds.bR_lon, map);
        }
    });
}

function addMarker(key, lat, lon, map) {
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(lat, lon),
        map: map,
        title: key
    });
}
