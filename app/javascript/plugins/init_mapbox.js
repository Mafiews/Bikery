import mapboxgl from 'mapbox-gl';


const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const buildMap = () => {
      const lat = mapElement.dataset.lat
      const lng = mapElement.dataset.lng
      mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
      return new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [lat, lng],
      zoom: 13
      });
    };

    const addMarkersToMap = (map, markers) => {
      markers.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
        const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundSize = 'contain';
        element.style.width = '25px';
        element.style.height = '25px';
        new mapboxgl.Marker(element)
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(map);
      });
    };

    const fitMapToMarkers = (map, markers) => {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 13});
    };

    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};
export { initMapbox };
