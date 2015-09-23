$(function() {

  $("#new_location").hide();
  var lat = document.getElementById("location_latitude");
  var lon = document.getElementById("location_longitude");


  function getLocation() {
      if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(showPosition);
      } else {
          x.innerHTML = "Geolocation is not supported by this browser.";
      }
  }

  function showPosition(position) {
      lat.value = position.coords.latitude;
      lon.value = position.coords.longitude;
      $("#new_location").submit();
  }

  getLocation();
});
