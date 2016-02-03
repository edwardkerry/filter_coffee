function initAutocomplete() {
  var input = document.getElementById('pac-input');
  var searchBox = new google.maps.places.SearchBox(input);

  searchBox.addListener('places_changed', function() {
    var places = searchBox.getPlaces();
    if (places.length === 0)
      {return;}
    }
  );
}
