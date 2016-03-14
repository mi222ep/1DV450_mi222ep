var map = setUpMap();
function setUpMap(){
    var map = L.map('map').setView([59.3294, 18.0686], 5);
    L.tileLayer('https://api.tiles.mapbox.com/v4/jalma.oe4kdjb8/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoiamFsbWEiLCJhIjoiY2lpNjN1d3RyMDA2bHZ3bTNmMTVhZ2RscyJ9.N-JYQ1IMDNJ3b4xIymdonA', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery � <a href="http://mapbox.com">Mapbox</a>',
        maxZoom: 18,
        id: 'jalma.oe4kdjb8',
        accessToken: 'pk.eyJ1IjoiamFsbWEiLCJhIjoiY2lpNjN1d3RyMDA2bHZ3bTNmMTVhZ2RscyJ9.N-JYQ1IMDNJ3b4xIymdonA'
    }).addTo(map);
    return map;
}