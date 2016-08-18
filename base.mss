/* ******* */
/* Palette */
/* ******* */
@water:             #bed9e0;
@land:              #fff;
@residential:       #f8f8f8;
@water:             #b5c1d4;
@admin:             #a09191;
@industrial:        #ece6e8;
@neutral:           #e2e2e6;
@wetland:           #e3e9e2;
@grass:             #e2e6e2;
@wooded:            #d4dad4;
@beach:             #eee5b2;
@agriculture:       #f4f1eb;

@road_fill:         #ffffff;
@road_case:         #9d9d9d;

@rail_fill:         #ddd;
@rail_case:         #aaa;

@city_text:         #222;
@city_halo:         @land;
@town_text:         #444;
@town_halo:         @land;
@village_text:      #444;
@village_halo:      @land;

@road_text:         #222;
@road_halo:         @land;

@regular:           'Fira Sans Regular';
@bold:              'Fira Sans Bold';
@medium:            'Fira Sans Medium';
@book:              'Fira Sans Book';
@xlight:            'Fira Sans ExtraLight';

@buffer:            512;

/* *********** */
/* backgrounds */
/* *********** */

Map {
  background-color: @water;
  buffer-size: @buffer;
}
#land {
  polygon-fill: @land;
}
#waterareas_gen[zoom<13],
#waterareas[zoom>=13] {
  polygon-fill: @water;
}

/* ************************* */
/* ADMINISTRATIVE BOUNDARIES */
/* ************************* */
#boundary[admin_level=4][zoom<=12],
#boundary[admin_level=6][zoom<=12] {
  eraser/line-color: white;
  eraser/line-width: 1;
  eraser/comp-op: darken;
  line-color: @admin;
  line-cap: butt;
  line-width: 1.5;
  line-dasharray: 8,4;
  line-smooth: 0.2;
  line-simplify: 10;
  [admin_level=6] {
      line-cap: butt;
      line-width: 1;
      line-color: lighten(@admin, 20%);
  }
}
/* ******** */
/* RAILWAYS */
/* ******** */
#railway[zoom>=14] {
  outline/line-width: 1;
  outline/line-color: @rail_case;
  outline/line-cap: round;
  line-color: @rail_fill;
  line-width: 1;
  line-dasharray: 5,5;
  [zoom>=15] {
    outline/line-width: 2;
  line-width: 2;
  }
  [zoom>=17] {
    outline/line-width: 3;
  }
}

/* ******** */
/*  ROADS   */
/* ******** */
#roads::casing[type='residential'][zoom>=15],
#roads::casing[type='unclassified'][zoom>=15],
#roads::casing[type='service'][zoom>=15],
#roads::casing[type='secondary'][zoom>=15],
#roads::casing[type='tertiary'][zoom>=15],
#roads::casing[type='primary'][zoom>=13],
#roads::casing[type='primary_link'][zoom>=13],
#roads::casing[type='trunk'][zoom>=13],
#roads::casing[type='motorway_link'][zoom>=13],
#roads::casing[type='motorway'][zoom>=13] {
  line-color: @road_case;
  line-width: 2;
  line-join: round;
  [zoom>=13] {
    line-width: 3;
    [type='motorway'] {
        line-width: 5;
    }
  }
  [zoom>=15] {
    line-width: 5;
    [type='service'],
    [type='residential'],
    [type='unclassified'] {
        line-width: 3;
    }
    [type='motorway'] {
        line-width: 8;
    }
  }
  [zoom<=10] {
    line-width: 0.5;
  }
}
#roads_gen[type='primary'][zoom>=11][zoom<13],
#roads_gen[type='trunk'][zoom>=11][zoom<13],
#roads_gen[type='motorway'][zoom>=11][zoom<13],
#roads[type='residential'][zoom>=15],
#roads[type='unclassified'][zoom>=15],
#roads[type='service'][zoom>=15],
#roads[type='secondary'][zoom>=15],
#roads[type='tertiary'][zoom>=15],
#roads[type='primary'][zoom>=13],
#roads[type='primary_link'][zoom>=13],
#roads[type='trunk'][zoom>=13],
#roads[type='motorway_link'][zoom>=13],
#roads[type='motorway'][zoom>=13] {
  line-color: @road_fill;
  line-join: round;
  line-cap: square;
  line-width: 1;
  [zoom<=10] {
      line-width: 0;
  }
  [zoom>=13] {
    line-width: 2;
    [type='motorway'] {
        line-width: 4;
    }
  }
  [zoom>=15] {
    line-width: 4;
    [type='service'],
    [type='residential'],
    [type='unclassified'] {
        line-width: 2;
    }
    [type='motorway'] {
      line-width: 7;
    }
  }
}
#roads_gen[type='primary'][zoom>=10][zoom<11],
#roads_gen[type='trunk'][zoom>=9][zoom<11],
#roads_gen[type='motorway'][zoom>=7][zoom<11],
#roads_gen[type='secondary'][zoom=11],
#roads[type='residential'][zoom=14],
#roads[type='unclassified'][zoom=14],
#roads[type='service'][zoom=14],
#roads[type='living_street'][zoom=14],
#roads[type='tertiary'][zoom>=12][zoom<15],
#roads[type='secondary'][zoom>=12][zoom<15] {
  line-color: @road_case;
  line-width: 1;
  [type='service'],
  [type='residential'],
  [type='unclassified'] {
    line-width: 0.5;
  }
  [type='motorway'][zoom>=10],
  [type='trunk'][zoom>=10] {
      line-width: 2;
  }
  [type='tertiary'][zoom<=12],
  [type='secondary'][zoom<=12],
  [zoom<=10] {
      line-color: lighten(@road_case, 20%);
  }
  [zoom<=8] {
      line-color: lighten(@road_case, 30%);
  }
  [zoom>=16] {line-width: 2;}
}


/* ****** */
/* BUILDINGS */
/* ****** */
#buildings[zoom>=16] {
  polygon-fill: darken(@residential, 5%);
}
