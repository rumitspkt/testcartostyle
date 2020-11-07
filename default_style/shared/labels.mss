
// =====================================================================
// LABELS
// - #water_name (ocean and sea)
// - #place (continent, country, state, city, etc.)
// - #water_name (lakes)
// - #waterway (rivers)
// - #transportation_name (roads)
// - #poi (park, cemetery, stadium)
// =====================================================================

//STYLING VARIABLES//
@name: '[name[nuti::lang]]';

//place label colors
@dark_text: #4b5357;
@med_text: #405c78;
@light_text: #959eaa;

//city shield
@city_shield: url(images/city-square.png);

//ocean/sea label colors
@marine_labels: #fff;
@marine_labels_halo: darken(@water,5%);

//Lake and River Labels
@water_label:darken(@water, 30%);
@water_halo: lighten(@water, 20%);

//Road labels
@road_text: #496989;
@road_label_halo: white;


//BEGIN STYLING//

//ocean labels
#water_name[class='ocean'][zoom>=2][zoom<=8],
#water_name[class='sea'][zoom>=5]{
    text-name: @name;
    text-face-name: @mont_it;
    text-wrap-width: 50;
    text-wrap-before: true;
    text-size: 14;
    text-fill: @marine_labels;
    text-halo-fill: @marine_labels_halo;
    text-halo-radius: 1;
    text-line-spacing: -2;
    text-character-spacing: 1.1;

    [zoom>=3] {text-size: 16;}
    [zoom>=4] {text-size: 18;}
    [zoom>=5] {text-size: 20;}
    
    [class='sea']{
      text-size: 12;
    }
}

//Continent Labels zooms 0-2
#place[class='continent'][zoom>=1][zoom<=2]{
  text-size: 12;
  text-name: @name;
  text-fill: @med_text;
  text-face-name: @mont;
  text-transform: uppercase;
  text-halo-fill: @landmass_fill;
  text-halo-radius: 1;
  [zoom=2] {text-size: 14;}
}

#place[class='country'] {
[rank=1][zoom>=3][zoom<=6], 
[rank=2][zoom>=3][zoom<=7],
[rank=3][zoom>=4][zoom<=8], 
[rank=4][zoom>=5][zoom<=9], 
[rank=5][zoom>=6][zoom<=10], 
[rank>=6][zoom>=7][zoom<=10]{
  text-name: @name;
  text-face-name: @mont;
  text-placement: point;
  text-size: 0;
  text-fill: @med_text;
  text-halo-fill: @landmass_fill;
  text-halo-radius: 0;
  text-halo-rasterizer: fast;
  text-wrap-width: 30;
  text-wrap-before: true;
  text-line-spacing: -2;
  text-min-distance: 2;
  text-transform: uppercase;
  text-character-spacing: 0.5;
  [zoom>=4]{text-fill:@med_text;}
  [zoom>=6]{text-fill:@light_text;}
  
  [rank=1]{
    [zoom=2]  { text-size: 10; text-wrap-width: 60; }
    [zoom=3]  { text-size: 11; text-wrap-width: 60; }
    [zoom=4]  { text-size: 12; text-wrap-width: 90; }
    [zoom=5]  { text-size: 13; text-wrap-width: 120; }
    [zoom>=6] { text-size: 14; text-wrap-width: 120; }
  }
  [rank=2]{
    [zoom=3]  { text-size: 10; }
    [zoom=4]  { text-size: 11; }
    [zoom=5]  { text-size: 12; }
    [zoom>=6] { text-size: 13; }
  }
  [rank=3]{
    [zoom=4]  { text-size: 10; }
    [zoom=5]  { text-size: 11; }
    [zoom=6]  { text-size: 12; }
    [zoom=7]  { text-size: 13; text-wrap-width: 60; }
    [zoom>=8] { text-size: 14; text-wrap-width: 120; }
  }
  [rank=4]{
    [zoom=5] { text-size: 10; }
    [zoom=6] { text-size: 11; text-wrap-width: 60  }
    [zoom=7] { text-size: 12; text-wrap-width: 90; }
    [zoom=8] { text-size: 13; text-wrap-width: 120; }
    [zoom>=9] { text-size: 14; text-wrap-width: 120; }
  }
  [rank=5]{
    [zoom=5] { text-size: 10; }
    [zoom=6] { text-size: 11; }
    [zoom=7] { text-size: 12; text-wrap-width: 60; }
    [zoom=8] { text-size: 13; text-wrap-width: 90; }
    [zoom>=9] { text-size: 14; text-wrap-width: 120; }
  }
  [rank>=6]{
    [zoom=6] { text-size: 10; }
    [zoom=7] { text-size: 11; }
    [zoom=8] { text-size: 12; }
    [zoom>=9] { text-size: 13; }
  }
 }
}

//State and province labels
#place[class='state'][zoom>=6][zoom<=10]{
  [zoom>=5][rank<=2],
  [zoom>=6][rank<=4],
  [zoom>=7][rank<=99]{
  text-name: @name;
  text-face-name: @mont;

  text-fill: @light_text;
  text-halo-fill: @landmass_fill;
  text-halo-radius: 0;
  text-halo-rasterizer: fast;
  text-size: 11;
  text-transform: uppercase;
  text-allow-overlap: false;
  text-wrap-width: 30;
  text-wrap-before: true;
  text-min-distance:5;
  text-placement-type: simple;
  text-placements: "W,E,NW,SE,11";
    text-dx:2;

  [zoom>=6]{text-size: 12;}
  [zoom>=7]{text-size:14; text-fill:@light_text;}
  }
}
#place::citydots[class='city'][zoom>=4][zoom<=7] {
  [zoom>=4][rank<=2],
  [zoom>=5][rank<=4],
  [zoom>=6][rank<=6],
  [zoom>=7][rank<=7]{
    shield-file: @city_shield;
    shield-unlock-image: true;
    shield-name: @name;
    shield-size: 11;
    shield-face-name: @mont;
     shield-fill: @med_text;//@dark_text;
    shield-halo-fill: lighten(@med_text,70%);
    shield-halo-radius: 1;
    shield-halo-rasterizer: fast;
    shield-placement-type: simple;
    shield-placements: "W,E,NW,NE,SE,10";
    shield-line-spacing: -1;
    shield-text-dx: -3;
    shield-text-dy: 0;
    shield-min-distance: 3;
    shield-wrap-width: 40;
    shield-line-spacing: -4;
    shield-size: 11;
    
   
    
    [zoom>=4] {
      [rank>=0][rank<=2] { shield-size: 10; }
      [rank>=3][rank<=5] { shield-size: 9; }
    }
    [zoom>=5] {
      [rank>=0][rank<=2] { 
        shield-size: 11; 
        shield-text-transform:uppercase;
      }
      [rank>=3][rank<=5] { shield-size: 10; }
    }
    [zoom>=6] {
      shield-fill: @med_text;
      [rank>=0][rank<=2] { shield-size: 12; }
      [rank>=3][rank<=5] { shield-size: 11; }
    }
    [zoom=7] {
      [rank>=0][rank<=2] { shield-size: 13; }
      [rank>=3][rank<=5] { 
        shield-size: 12;
        shield-text-transform:uppercase; 
      }
      [rank>=6] { shield-size: 11; }
    }
  }
}

#place[class='city'][zoom>=8][zoom<=13]{
  text-name: @name;
  text-face-name: @mont;
  text-placement: point;
  text-fill: @med_text;
  text-halo-fill: lighten(@med_text,70%);
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-wrap-width: 40;
  text-line-spacing: -4;
  text-transform: uppercase;
  [zoom=8] {
    text-size: 10;
    text-wrap-width: 60;
    [rank>=0][rank<=3] { text-size: 16; }
    [rank>=4][rank<=5] { text-size: 14; }
    [rank>=6][rank<=7] { text-size: 12; }
    [rank>=8][rank<=9] { text-size: 11; }
  }
  [zoom=9] {
    text-size: 11;
    text-wrap-width: 60;
    [rank>=0][rank<=3] { text-size: 17; }
    [rank>=4][rank<=5] { text-size: 15; }
    [rank>=6][rank<=7] { text-size: 13; }
    [rank>=8][rank<=9] { text-size: 12; }
  }
  [zoom=10] {
    text-size: 12;
    text-wrap-width: 70;
    [rank>=0][rank<=3] { text-size: 18; }
    [rank>=4][rank<=5] { text-size: 16; }
    [rank>=6][rank<=7] { text-size: 14; }
    [rank>=8][rank<=9] { text-size: 13; }
  }
  [zoom=11] {
    text-size: 13;
    text-wrap-width: 80;
    [rank>=0][rank<=3] { text-size: 19; }
    [rank>=4][rank<=5] { text-size: 17; }
    [rank>=6][rank<=7] { text-size: 15; }
    [rank>=8][rank<=9] { text-size: 14; }
  }
  [zoom=12] {
    text-size: 14;
    text-wrap-width: 100;
    [rank>=0][rank<=3] { text-size: 20; }
    [rank>=4][rank<=5] { text-size: 18; }
    [rank>=6][rank<=7] { text-size: 16; }
    [rank>=8][zoom<=9] { text-size: 15; }
  }
  [zoom=13] {
    text-size: 15;
    text-wrap-width: 200;
    [rank>=0][rank<=3] { text-size: 21; }
    [rank>=4][rank<=5] { text-size: 19; }
    [rank>=6][rank<=7] { text-size: 17; }
    [rank>=8][rank<=9] { text-size: 16; }
  }
  
  [zoom=14] {
    //text-fill: fadeout(@med_text,25);
    //text-halo-radius: 0;
    text-size: 16;
    text-wrap-width: 300;
    [rank>=0][rank<=3] { text-size: 24; }
    [rank>=4][rank<=5] { text-size: 22; }
    [rank>=6][rank<=7] { text-size: 20; }
    [rank>=8][rank<=9] { text-size: 17; }
  }
}

//Towns

#place[class='town'][zoom>=8][zoom<=14][rank<=11],
#place[class='town'][zoom>=15][zoom<=16]{
  text-name: @name;
  text-face-name: @mont;
  text-placement: point;
  text-fill: @med_text;
  text-halo-fill: lighten(@med_text,70%);
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-wrap-width: 75;
  text-wrap-before: true;
  text-line-spacing: -2;
  text-size: 11;
  text-transform: uppercase;
  [zoom>=8] { text-size: 9; }
  [zoom>=9] { text-size: 10; }
  [zoom>=10] { text-size: 11; }
  //[zoom>=11] { text-size: 12; text-wrap-width: 80; }
  //[zoom>=12] { text-size: 13; text-wrap-width: 120; }
  [zoom>=13] { text-size: 14; text-wrap-width: 160; }
  [zoom>=14] { text-size: 15; text-wrap-width: 200;text-face-name:@mont_md; }
  //[zoom>=15] { text-size: 16; text-wrap-width: 240; }
  [zoom>=15] {text-name:""; }
}

//Villages

#place[class='village'][zoom>=10][zoom<=14][rank<=11],
#place[class='village'][zoom>=15][zoom<=16] {
  text-name: @name;
  text-face-name: @mont;
  text-placement: point;
  text-fill: @med_text;
  text-halo-fill: lighten(@med_text,70%);
  text-size: 10;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-wrap-width: 60;
  text-wrap-before: true;
  text-line-spacing: -4;
  text-transform: uppercase;
  [zoom>=12] { text-size: 10; }
  [zoom>=13] { text-size: 11;text-wrap-width: 80; }
  [zoom>=14] { text-size: 12; text-wrap-width: 100; text-face-name:@mont_md;}
  //[zoom>=15] { text-size: 14; text-wrap-width: 120; }
  [zoom>=16] { text-size: 13; text-wrap-width: 160; }
  [zoom=17] { text-size: 14; text-wrap-width: 200; }
}

//Suburbs

#place[class='suburb'][zoom>=12][zoom<=14][rank<=11],
#place[class='suburb'][zoom>=15][zoom<=16] {
  text-name: @name;
  text-face-name: @mont;
  text-placement: point;
  text-size: 9;
  text-fill: @med_text;
  text-halo-fill:lighten(@med_text,70%);
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-wrap-width: 60;
  text-wrap-before: true;
  text-line-spacing: -2;
  text-transform: uppercase;
  [zoom>=13] { text-size: 10; text-min-distance: 20; }
  [zoom>=14] { text-size: 11; text-wrap-width: 80; text-face-name:@mont_md;}
  [zoom>=15] { text-size: 12; text-wrap-width: 120; }
  //[zoom>=16] { text-size: 13; text-wrap-width: 160; }
  [zoom>=17] { text-size: 13; text-wrap-width: 200; }
}

//Neighbourhoods & Hamlets

#place[zoom>=13][zoom<=14][rank<=11],
#place[zoom>=15][zoom<=16] {
  [class='hamlet'],
  [class='neighbourhood'] {
    text-name: @name;
    text-face-name: @mont;
    text-placement: point;
    text-fill: @med_text;
    text-halo-fill: lighten(@med_text,70%);
    
    text-size: 8;
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-wrap-width: 60;
    text-wrap-before: true;
    text-line-spacing: -2;
    text-transform: uppercase;
    [zoom>=14] { 
      text-size: 10; 
      text-wrap-width: 80;
      text-face-name: @mont_md;
    }
    [zoom>=15] { text-size: 10.5; text-wrap-width: 100; text-character-spacing:0.5;}
    [zoom>=16] { text-size: 11; text-wrap-width: 120; }
    [zoom>=18] { text-size: 12;  }
  }
}


//lake labels
#water_name [class='lake'][zoom>=9] {
    text-name: @name;
    text-face-name: @mont_it;
    text-fill: @water_label;
    text-size: 9;
    text-halo-fill: @water_halo;
    text-halo-radius: 1;
    text-wrap-width: 50;
    text-wrap-before: true;
    text-min-distance:30;
    [zoom>=17]{text-size:10;text-wrap-width:100; text-min-distance:80;}
    [zoom>=18]{text-min-distance: 10; text-size:12;}
}

//river labels
#waterway[class='river'][zoom>=14]{
      text-name: @name;
      text-face-name: @mont_it;
      text-fill: @water_label;
      text-size: 9;
      text-halo-fill: @water_halo;
      text-halo-radius: 1.2;
      text-avoid-edges: true;
      text-placement: line;
      text-repeat-distance:10;
      text-character-spacing: 1;
      [zoom>=16]{text-size:10;}
      [zoom>=17]{text-size:11;}
}

#transportation_name['mapnik::geometry_type'=2] {
  [class='motorway'][zoom>=13],
  [class='trunk'][zoom>=13],
  [class='primary'][zoom>=14],
  [class='secondary'][zoom>=15],
  [class='tertiary'][zoom>=16],
  [class='minor'][zoom>=16] {
    text-avoid-edges: true;
    text-name: @name;
    text-placement: line;
    text-face-name: @mont;
    text-fill: @light_text;
    text-size: 8;
    text-halo-fill: @landmass_fill;
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-min-distance: 200;
    [zoom>=14] { text-size: 8; }
    [zoom>=16] { text-size: 9; }
    [zoom>=17] { text-size: 10; text-character-spacing: 0.5;}
    [zoom>=18] { text-size: 11;text-fill:@road_text; }
    
    [class='motorway'],
    [class='trunk'],
    [class='primary'] {
      text-fill: @light_text;
      text-face-name: @mont;
      text-halo-fill: lighten(@main,4%);
      [class='motorway']{text-halo-fill: lighten(@motorway,10%);}
      [zoom>=13] { text-size: 9;}
      [zoom>=14] { text-size: 10;text-character-spacing: 0.5;}
      [zoom>=15] { text-size: 11; }
      [zoom>=16] { text-size: 12; text-fill:@road_text; }
      [zoom>=18] { text-size: 13; }
    }
    
    [class='secondary'],[class='tertiary']{
      text-halo-fill: lighten(@secondary,5%);
      [zoom>=15] { text-size: 9;  }
      [zoom>=16] { text-size: 11; }
      [zoom>=18] { text-size: 12;text-fill: @road_text;}
    }
  }
}


#poi[class='park'][subclass='park'][rank<=3],
#poi[class='stadium'][rank<=3],
#poi[class='cemetery'][rank<=3],
#poi[class='attraction'][rank<=3]{
  [zoom>=15][rank<=1],
  [zoom>=16][rank<=2],
  [zoom>=17][rank<=3],
  [zoom>=18]{
    text-name: @name;
    text-face-name: @mont_md;
    text-fill: #666;
    text-halo-fill: fadeout(#fff,85%);
    text-halo-radius: 2;
    text-halo-rasterizer: fast;
    text-line-spacing: -1;
    text-wrap-width: 80;
    text-wrap-before: true;
    text-avoid-edges: true;
    text-transform: uppercase;
    [zoom>=15]{text-size:8;}
    [zoom>=16]{text-size:8.5;text-fill: #555;}
    [zoom>=17]{text-size:9; text-wrap-width: 100;}
    [zoom>=18]{text-size:10; }
 
  }
}
