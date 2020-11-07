// =====================================================================
// LANDUSE/LANDCOVER
// - #landuse: urban areas
// - #landcover: park, wood
// - #park: nature_reserve, national_park
// - #poi: park labels
// - #buildings
// - #aeroways: runway, taxiway
// =====================================================================

// STYLING VARIABLES //

//urban areas
@urbanareas: #f3eadc;//darken(#f5f5f3, 4%);
@urbanareas_highzoom: darken(#f5f5f3, 3%);

//parks and green areas
@greenareas: #C5E1B2;

//buildings
@buildings: darken(@urbanareas,0%);//darken(#E6E1D3,2) ;//darken(@landmass_fill,5);
@buildings_outline_16: darken(#f1e8d8,10%);//transparent;//#ddd;
@buildings_outline: darken(#f1e8d8,3%);

//aeroways
@aeroways: #e8e8e8;

// BEGIN STYLING //

//urban areas
#landuse[class='residential'][zoom>=6]{
  [zoom>=5]{polygon-fill:fadeout(@urbanareas,50%);}
  [zoom>=9]{polygon-fill: fadeout(@urbanareas,60%);}
  [zoom>=11]{polygon-fill: fadeout(@urbanareas,65%);}
  [zoom>=13]{polygon-fill: fadeout(@urbanareas,70%);}
  [zoom>=15]{polygon-fill: fadeout(@urbanareas,75%);}
  [zoom>=16]{polygon-fill: fadeout(@urbanareas,85%);}
  //[zoom>=18]{polygon-fill: fadeout(@urbanareas,90%);}
}

//green areas and parks

#landcover[class='wood'][zoom>=5],
#park[class='nature_reserve'][zoom>=5],
#park[class='national_park'][zoom>=9],
#landcover[class='grass'][zoom>=11],
#landcover[subclass='recreation_ground'][zoom>=12],
#landuse[class='cemetery'],
#landuse[class='stadium']{
  //opacity: 0.8;
  [zoom<=8]{polygon-fill:fadeout(@greenareas,80%);}
  [zoom>=9]{polygon-fill:fadeout(@greenareas,75%);}
  [zoom>=11]{polygon-fill: fadeout(@greenareas,65%);}
  [zoom>=13]{polygon-fill: fadeout(@greenareas,60%);}
  [zoom>=15]{polygon-fill: rgb(224,236,211);}
  
  //[zoom>=16]{polygon-fill: fadeout(@greenareas,30);}


}


//buildings
#building [zoom>=13]{
    ::shadow[zoom>=15] {
      polygon-fill: mix(@buildings,#777,88%);//darken(@buildings,7);
      polygon-geometry-transform:translate(0,2);
//      [zoom>=15]{line-color:darken(@urbanareas,8%);}
//      [zoom<=16]{line-width:0.5;}
      [zoom=15]{ polygon-geometry-transform:translate(0,1);}
      [zoom=17]{ polygon-geometry-transform:translate(0,3);}
      [zoom=18]{ polygon-geometry-transform:translate(0,5);} 
//      a/polygon-fill: lighten(@buildings,2%);
    }

    ::fill {
       polygon-fill: lighten(@buildings,0%);
       //line-width: 0;
       //line-color: #000;
       //line-clip: false;
       [zoom<=14]{polygon-opacity: 0.8;}
       [zoom>=15]{polygon-opacity: 1;}
    }
  
}

//aeroway
#aeroway {
  line-cap: square;
  line-join:miter;
  line-color: @aeroways;
  line-width:0.5;

  [class='runway']{
    [zoom=12] {line-width: 1;}
    [zoom=13] {line-width: 2;}
    [zoom=14] {line-width: 4;}
    [zoom=15] {line-width: 6;}
    [zoom>=16] {line-width: 8;}
  }

  [class='taxiway'][zoom>=13]{
    [zoom=13] {line-width: 0.5;}
    [zoom=14] {line-width: 1;}
    [zoom=15] {line-width: 2;}
    [zoom>=16] {line-width: 4;}
  }
}
