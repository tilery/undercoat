/* ************************* */
/*          PLACE            */
/* ************************* */
#place[type='city'],
#place[type='town'],
#place[type='village'][zoom>=9] {
  text-name:'[name].replace("Saint-", "St-").replace("Sainte-", "Ste-")';
  text-face-name: @xlight;
  text-placement:point;
  text-fill: @village_text;
  text-size: 11;
  text-halo-fill: @village_halo;
  text-halo-radius: 2;
  text-wrap-width: 30;
  text-label-position-tolerance: 20;
  text-character-spacing: 0.1;
  text-wrap-width: 30;
  text-wrap-character: '-';
  text-repeat-wrap-character: true;  // mapnik 3.x only
  text-line-spacing: -2;
  text-min-padding: 1;
  [zoom=12] {
    text-size: 12;
  }
  [type='town'] {
    text-fill: @town_text;
    text-halo-fill: @town_halo;
    text-face-name: @medium;
  }
  [type='city'] {
    text-fill: @city_text;
    text-halo-fill: @city_halo;
    text-face-name: @medium;
    text-transform: uppercase;
  }
  [zoom<12] {
    text-min-distance: 30;
  }
  [zoom>=13] {
    text-size: 12;
  }
  [zoom>=14] {
    text-size: 13;
  }
}


/* ************************* */
/*          ROADS            */
/* ************************* */
#road_label[zoom>14] {
  text-name: '[name].replace("^Chemin", "Ch.").replace("^Avenue", "Av.").replace("^Rue", "R.").replace("^Route", "Rte").replace("^Boulevard", "Bd")';
  text-face-name: @xlight;
  text-placement: line;
  text-size: 10;
  text-fill: @road_text;
  text-halo-fill: @road_halo;
  text-halo-radius: 1;
  text-min-distance: 60;
  text-size: 11;
  text-avoid-edges: true;
  text-character-spacing: 0;
}
