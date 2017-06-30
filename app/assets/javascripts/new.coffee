$(document).on 'forms#new:loaded', ->
  console.log 'loaded'
  map = undefined
  infoWindow = undefined
  initMap()

  $('input, textarea', 'body').on 'blur', (e) ->
    if e.target.value != ''
      $(e.target).addClass('has-content')
    else
      $(e.target).removeClass('has-content')
  $('form').on 'submit', (e) ->
    swal("Gracias", "Reporte Enviado", "success")
  $('#geolocate').on 'click', geolocate

initMap = ->
  window.map = new (google.maps.Map)(document.getElementById('map'),
    center:
      lat: -34.397
      lng: 150.644
    zoom: 6)
  geolocate()
  return

geolocate = ->
  $('#geolocate').toggle 'disabled'
  infoWindow = new (google.maps.InfoWindow)
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition ((position) ->
      pos = 
        lat: position.coords.latitude
        lng: position.coords.longitude
      infoWindow.setPosition pos
      infoWindow.setContent 'Location found.'
      infoWindow.open map
      window.map.setCenter pos
      $('#maps-link').val("http://www.google.com/maps/place/#{map.getCenter().toUrlValue()}")
                     .addClass('has-content')
      $('#coordinates').val(map.getCenter().toUrlValue())
                       .addClass('has-content')
      $('#geolocate').toggle 'disabled'
      return
    ), ->
      $('#geolocate').toggle 'disabled'
      handleLocationError true, infoWindow, map.getCenter()
      return
  else
    # Browser doesn't support Geolocation
    handleLocationError false, infoWindow, map.getCenter()

handleLocationError = (browserHasGeolocation, infoWindow, pos) ->
  swal('Error', 'No se pudo encontrar ubicación', 'error')
  infoWindow.setPosition pos
  infoWindow.setContent if browserHasGeolocation then 'Error: The Geolocation service failed.' else 'Error: Your browser doesn\'t support geolocation.'
  infoWindow.open map
  return



# ---
# generated by js2coffee 2.2.0