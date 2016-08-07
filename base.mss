/* ******* */
/* Palette */
/* ******* */
@water:             #bed9e0;
@land:              #f2f0f0;
@residential:       #e6e2e2;
@water:             #A5B4CB;
@admin:             #753e3e;
@industrial:        #ece6e8;
@neutral:           #e2e2e6;
@wetland:           #e3e9e2;
@grass:             #e2e6e2;
@wooded:            #d4dad4;
@beach:             #eee5b2;
@agriculture:       #f4f1eb;

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
#landuse_gen[zoom<14],
#landuse[type="residential"][zoom>=13],
#landuse[zoom>=14] {
  #landuse_gen {
      polygon-opacity: 0.8;
  }
  #landuse_gen[zoom>=12] {
      polygon-opacity: 0.9;
  }
  [type='grave_yard'],
  [type='college'],
  [type='school'],
  [type='education'],
  [type='sports_centre'],
  [type='stadium'],
  [type='university'],
  [type='cemetery'] {
      polygon-fill: @neutral;
  }
  [type='hospital'],
  [type='industrial'],
  [type='landfill'],
  [type='quarry'],
  [type='commercial'] {
      polygon-fill: @industrial;
  }
  [type='residential'],
  [type='retail'],
  [type='pedestrian'] {
      polygon-fill: @residential;
      [type='residential'][zoom>=14] {
          polygon-fill: @land;
      }
  }
  [type='golf_course'],
  [type='pitch'],
  [type='grass'],
  [type='grassland'],
  [type='park'],
  [type='garden'],
  [type='village_green'],
  [type='recreation_ground'],
  [type='picnic_site'],
  [type='camp_site'],
  [type='playground'],
  [type='common'] {
      polygon-fill: @grass;
  }
  [type='scrub'],
  [type='meadow'],
  [type='heath'] {
      polygon-fill: @grass;
  }
  [type='forest'],
  [type='wood'] {
      polygon-fill: @wooded;
  }
  [type='farmland'],
  [type='farm'],
  [type='orchard'],
  [type='allotments'] {
      polygon-fill: @agriculture;
  }
  [type='beach'],
  [type='desert'] {
      polygon-fill: @beach;
  }
  [type='basin'] {
      polygon-fill: @water;
  }
  [type='wetland'] {
      polygon-fill: @wetland;
  }
}

#waterway {
  polygon-fill: @water;
}

/* ************************* */
/* ADMINISTRATIVE BOUNDARIES */
/* ************************* */
#boundary[admin_level=4],
#boundary[admin_level=6],
#boundary[admin_level=8][zoom>=12],
#boundary[admin_level=9][zoom>=12] {
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
  [admin_level=8],
  [admin_level=9] {
    line-dasharray: 1,3;
    line-cap: round;
    [zoom>=13] {
        line-width: 1;
    }
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
#roads_gen[type='primary'][ref!=""][zoom>=11][zoom<13],
#roads_gen[type='trunk'][zoom>=11][zoom<13],
#roads_gen[type='motorway'][zoom>=11][zoom<13],
#roads[type='secondary'][zoom>=15],
#roads[type='primary'][zoom>=13],
#roads[type='trunk'][zoom>=13],
#roads[type='motorway_link'][zoom>=13],
#roads[type='motorway'][zoom>=13] {
  outline/line-color: #aaa;
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
  line-color: white;
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
#roads_gen[type='primary'][ref!=""][zoom>=9][zoom<11],
#roads_gen[type='trunk'][zoom>=9][zoom<11],
#roads_gen[type='motorway'][zoom>=9][zoom<11],
#roads[zoom>=15]::watermark,
#roads[type='tertiary'][zoom>=13],
#roads[type='secondary'][zoom>=13][zoom<15] {
  line-color: darken(@land, 10);
  line-width: 1;
  [zoom>=16] {line-width: 2;}
}
#footways[zoom>=16] {
  outline/line-color: darken(@land, 2);
  outline/line-width: 2;
  [zoom>=18] {
    outline/line-width: 3;
  }
  line-dasharray: 1,2;
  line-cap: round;
  line-width: 1;
  line-color: #aaa;
  [zoom>=18] {
    line-dasharray: 1,4;
    [type='steps'] {
      outline/line-width: 6;
      line-width: 5;
      line-cap: butt;
      line-dasharray: 2,2;
    }
  }
}

/* ****** */
/* BUILDINGS */
/* ****** */
#buildings[zoom>=14] {
  polygon-fill: #ddd;
  [zoom>=15] {line-color: #ccc;}
  [type="train_station"],
  [type="station"] {
    polygon-fill: #bbb;
    line-color: #aaa;
  }
}
