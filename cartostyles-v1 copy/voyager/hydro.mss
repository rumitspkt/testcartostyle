// =====================================================================
// HYDRO
// - #water: Water Polygons
// - #waterway: rivers
// =====================================================================

// STYLING VARIABLES //

//Fills
@water:desaturate(#A0DBE6,20%);//#CDD2D4;
@rivers_stroke: rgb(204,231,234);	//rgb(212,238,247);//@water;//lighten(#346fa1,30%);//#D1DFE9;

// BEGIN STYLE //

//water polygons
/*#water[class='ocean'],
#water[class='lake'],
#water[class='river']{
  polygon-fill: @water;
  line-color: darken(@water,8%);
  line-width: 0.5;
}*/



#water[class='ocean']{
  ::fill {
    polygon-fill: @water;
//    line-width: 0.5;
//    line-color: darken(@water,2%);
  }
  ::shadow {
    polygon-fill:lighten(@water,15%);
    polygon-opacity: 0.6;

//    comp-op: overlay;
    polygon-geometry-transform: translate(0,1);
//    polygon-clip: false;
//    image-filters: agg-stack-blur(1,1);
    
    [zoom>=14] {
//      image-filters: agg-stack-blur(1,1);
      polygon-geometry-transform: translate(0,2);
    }
  }
}
  
#water[class='lake'],
#water[class='river'][zoom>=10]{
  ::fill{
    polygon-fill: @water;
//    line-width: 0;
//    line-color: darken(@water,2%);
    /*[zoom<=9]{
      polygon-fill:#D2EAED;
      line-width: 0;
    }*/
  }
  ::shadow {
    polygon-fill:lighten(@water,15%);
    polygon-opacity: 0.6;
    
//    comp-op: overlay;
    polygon-geometry-transform: translate(0,1);
//    polygon-clip: false;
//    image-filters: agg-stack-blur(1,1);
    
    [zoom>=14] {
//      image-filters: agg-stack-blur(1,1);
      polygon-geometry-transform: translate(0,2);
    }
  }
}

//river styling
#waterway {
  [class='river'],
  [class='canal'][zoom>=12],
  [class='stream'][zoom>=14]{
    line-color:rgb(204,231,234);
    line-width: 1;
    [zoom<=8]{
      line-color: @rivers_stroke;
      line-width: 0.5;
    }
    [zoom>=15]{line-width:2;}
    [zoom>=16]{line-width:3;}
  }
}
