/* ******* */
/* Palette */
/* ******* */
@water:             #bed9e0;
@land:              #f2f0f0;
@residential:       #e6e2e2;
@water:             #A5B4CB;
@admin:             #6f6060;
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

#waterway {
  polygon-fill: @water;
}

/* ************************* */
/* ADMINISTRATIVE BOUNDARIES */
/* ************************* */
#boundary[admin_level=4],
#boundary[admin_level=6] {
  eraser/line-color: white;
  eraser/line-width: 0.5;
  eraser/comp-op: darken;
  line-color: @admin;
  line-width: 0.8;
  [zoom<12] {
    line-smooth: 0.2;
    line-simplify: 10;
    line-color: lighten(@admin, 15%);
  }
  [admin_level=4] {
      line-cap: butt;
      line-width: 1.5;
      line-dasharray: 10,4,2,4;
  }
  [admin_level=6] {
      line-cap: butt;
      line-width: 1;
      line-dasharray: 8,4;
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
#roads_gen[type='primary'][zoom>=11][zoom<13],
#roads_gen[type='trunk'][zoom>=11][zoom<13],
#roads_gen[type='motorway'][zoom>=11][zoom<13],
#roads[type='secondary'][zoom>=15],
#roads[type='primary'][zoom>=13],
#roads[type='trunk'][zoom>=13],
#roads[type='motorway_link'][zoom>=13],
#roads[type='motorway'][zoom>=13] {
  outline/line-color: @road_case;
  outline/line-width: 2;
  outline/line-join: round;
  [zoom>=13] {
    outline/line-width: 3;
    [type='motorway'] {
        outline/line-width: 5;
    }
  }
  [zoom>=15] {
    outline/line-width: 5;
    [type='motorway'] {
        outline/line-width: 7;
    }
  }
  [zoom<=10] {
    outline/line-width: 0.5;
  }
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
    [type='motorway'] {
      line-width: 6;
    }
  }
}
#roads_gen[type='primary'][zoom>=9][zoom<11],
#roads_gen[type='trunk'][zoom>=9][zoom<11],
#roads_gen[type='motorway'][zoom>=9][zoom<11],
#roads_gen[type='secondary'][zoom=12],
#roads[zoom>=15]::watermark,
#roads[type='tertiary'][zoom>=13],
#roads[type='secondary'][zoom>=13][zoom<15] {
  line-color: @road_case;
  line-width: 1;
  [zoom>=16] {line-width: 2;}
}


/* ****** */
/* BUILDINGS */
/* ****** */
#buildings[zoom>=17] {
  polygon-fill: #ccc;
}
