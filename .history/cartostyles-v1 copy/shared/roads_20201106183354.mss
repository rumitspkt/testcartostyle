// =====================================================================
// ROADS
// - #transportation: ::case and ::fill for roads, rail, bridges, tunnels
// - #transportation_name: transportation labels
// =====================================================================


// Basic color palette, from which variations will be derived.
@motorway:         rgb(255, 233, 165);
@motorway_case:     mix(@motorway,#f1d2a2,50%);
@main:             rgb(254,253,215);
@main_case_lowzoom:   mix(@main,#ffdda9,20%);
@main_case:         mix(@main,#ffdda9,40%);
@secondary:         #fff;
@secondary_case:    mix(@main,#ffdda9,60%);
@street:            #fff;


#transportation {
  ::case { }
  ::fill { }
}

#transportation {
  [class='motorway']['mapnik::geometry_type'=2] {
    ::case[zoom>=8] {
      line-color: @motorway_case;
      [zoom>=8]   { line-width:1.5; line-opacity:1;}
      [zoom>=9]   { line-width:2; line-opacity:1;}
      [zoom>=10]  { line-width:2; }
      [zoom>=13] { line-width:5; }
      [zoom>=14] { line-width:7; }
      [zoom>=15] { line-width:9; }
      [zoom>=16] { line-width:11; }
      [zoom>=17] { line-width:13; }
      [zoom>=18] { line-width:22; }
      
      [zoom>=14]{
        [brunnel='tunnel']{ line-opacity: 1;line-color:#fff;}
        [brunnel='bridge']{
          line-color:#fff;
          line-dasharray: 2,2;
        }
      }
    }
    ::fill[zoom>=5] {
        line-color:@motorway_case;   
        [zoom>=5]{ line-width:0.5;line-opacity: 0.5; }
        [zoom>=6] {line-opacity: 1;}
        [zoom>=8] {line-color:@motorway}  
        [zoom>=9] { line-width:1;}
        [zoom>=10] { line-width:1.5; }   
        [zoom>=13] { line-width:3; }
        [zoom>=14] { line-width:5; }
        [zoom>=15] { line-width:6.5; }
        [zoom>=16] { line-width:9; }
        [zoom>=17] { line-width:11; }
        [zoom>=18] { line-width:20; }
        
        [zoom>=14] {
          [brunnel='tunnel']{line-opacity: 0.6;}  
          [brunnel='bridge']{ line-opacity:0.8;}
        }
      }
     }
 
  [ramp=1][class='motorway']['mapnik::geometry_type'=2],
  [ramp=1][class='trunk']['mapnik::geometry_type'=2],
  [ramp=1][class='primary']['mapnik::geometry_type'=2],
  [ramp=1][class='secondary']['mapnik::geometry_type'=2],
  [ramp=1][class='tertiary']['mapnik::geometry_type'=2] {
    ::case[zoom>=8] {
      line-join:round;
      line-color:@motorway_case;
      line-cap: round;
      [zoom<=12] {line-width: 0.5;}
      [zoom>=13] { line-width:1; }
      [zoom>=14] { line-width:2; }
      [zoom>=15] { line-width:5; }
      [zoom>=16] { line-width:6.5; }
      [zoom>=17] { line-width:10; }
      [zoom>=18] { line-width:12; }
      
      [ramp=1][class='motorway']{line-color:@motorway_case;}
      
      [ramp=1][class='trunk'],
      [ramp=1][class='primary']{
        line-color:@main_case;
      }
      [ramp=1][class='secondary'],
      [ramp=1][class='tertiary']{
        line-color:@secondary_case;
      }
    }

    ::fill[zoom>=5]{
      line-join:round;
      line-color:@motorway;
      [zoom<=13] {line-width: 0;line-color:transparent;}
      [zoom>=14] { line-width:1.5; }
      [zoom>=15] { line-width:3; }
      [zoom>=16] { line-width:4.5; }
      [zoom>=17] { line-width:8; }
      [zoom>=18] { line-width:10; }
      
      [ramp=1][class='motorway']{
        line-color:@motorway;
      }
      [ramp=1][class='trunk'],
      [ramp=1][class='primary']{
        line-color:@main;
      }
      [ramp=1][class='secondary'],
      [ramp=1][class='tertiary']{
        line-color:@secondary;
      }
    }
  }
    
  [class='trunk']['mapnik::geometry_type'=2],
  [class='primary']['mapnik::geometry_type'=2] {
    ::case[zoom>=10]{ 
      line-join:round;
      line-color: @main_case_lowzoom;
      [zoom>=6] { line-width:0.2; }
      [zoom>=7] { line-width:0.4; }
      [zoom>=8] { line-width:2; }
      [zoom>=11] { line-width:3;  }
      [zoom>=13] { line-width:4; line-color:@main_case; }
      [zoom>=14] { line-width:6;  }
      [zoom>=15] { line-width:8; }
      [zoom>=16] { line-width:10; }
      [zoom>=17] { line-width:14; }
      [zoom>=18] { line-width:18; }
      
      [zoom>=15]{
        [brunnel='tunnel']{ line-opacity: 1;line-color:#fff;}
        [brunnel='bridge']{
          line-color:#fff;
          line-dasharray: 2,2;}
      }
    }

    ::fill[zoom>=8]{
      line-join:round;
      line-color:darken(@main_case,5%);
      [zoom>=8] { line-width:0.5;line-opacity:0.5; }
      [zoom>=9] {line-opacity: 1;}
      [zoom>=10] { line-width:1; line-color: @main;}
      [zoom>=11] { line-opacity:1;}   
      [zoom>=13] { line-width:2; }
      [zoom>=14] { line-width:4; }
      [zoom>=15] { line-width:6; }
      [zoom>=16] { line-width:8; }
      [zoom>=17] { line-width:12; }
      [zoom>=18] { line-width:16; }
      
      [zoom>=15] {
          [brunnel='tunnel']{line-opacity: 0.6;}  
          [brunnel='bridge']{ line-opacity:0.8;}
      }
    }
  }

  [class='secondary']['mapnik::geometry_type'=2],
  [class='tertiary']['mapnik::geometry_type'=2] {
    ::case[zoom>=13]{
      line-join:round;
      line-color: @secondary_case;
      [zoom>=6] { line-width:0.2; }
      [zoom>=7] { line-width:0.4; }
      [zoom>=8] { line-width:1.5; }
      [zoom>=10] { line-width:2.5; }
      [zoom>=12] { line-width:2; }
      [zoom>=13] { line-width:4;}
      [zoom>=14] {line-width: 5;}
      [zoom>=15] { line-width:6; }
      [zoom>=16] { line-width:8; }
      [zoom>=17] { line-width:12; }
      [zoom>=18] { line-width:16; }
   
      [zoom>=16]{
        [brunnel='tunnel']{ 
          line-color:@motorway;
        }
        [brunnel='bridge']{
          line-color:#fff;
          line-dasharray: 2,2;
        }
      }
    }
    ::fill[zoom>=12]{
      line-join:round;
      line-color:@street;  
      [zoom>=8] { line-width:0.6;line-opacity:0.5; }
      [zoom>=12] { line-width:1; line-opacity:1;}
      [zoom>=13] { line-width:2; }
      [zoom>=14] { line-width: 3;}
      [zoom>=15] { line-width:4; }
      [zoom>=16] { line-width:6;}
      [zoom>=17] { line-width:10; }
      [zoom>=18]{line-width:14;}
      
      [zoom>=16] {
          [brunnel='tunnel']{line-opacity: 0.6;}  
          [brunnel='bridge']{ line-opacity:0.8;}
      }
    }
  }

  [class='minor']['mapnik::geometry_type'=2] {
    ::case[zoom>=13]{
      line-join:round;
      line-cap: round;
      line-color:@secondary_case;
      [zoom<=14]{line-color:rgba(255,255,255,0.8);}
      [zoom>=12] { line-width:0.5; }
      [zoom>=14] { line-width:1; }
      [zoom>=15] { line-width:5; }
      [zoom>=16] { line-width:6; }
      [zoom>=17] { line-width:8; }
      [zoom>=18] { line-width:14; }
    }
    ::fill[zoom>=15]{
      line-join:round;
      line-cap: round;
      line-color:#fff;
      [zoom>=15] { line-width:3; }
      [zoom>=16] { line-width:4; }
      [zoom>=17] { line-width:6; }
      [zoom>=18] { line-width:12; }
    }
  }

  [class='service']['mapnik::geometry_type'=2] {
    ::case[zoom>=15]{
      line-join:round;
      line-cap: round; 
      line-color:rgba(255,255,255,0.9);
      [zoom>=15] { line-width:1; }
      [zoom>=16] { line-width:3.5; line-color: @secondary_case;}
      [zoom>=17] { line-width:6; }
      [zoom>=18] { line-width:8; }
    }
    ::fill[zoom>=16]{
      line-color: #fff;
      line-join:round;
      line-cap: round;
      [zoom>=16]{line-width: 2;}
      [zoom>=17] { line-width:4; }
      [zoom>=18] { line-width:6; }
    }
  }

  [class='path']['mapnik::geometry_type'=2] {
    ::case[zoom>=17]{
      line-color: darken(@secondary_case,5%);
      [zoom>=17] { line-width: 2; }  
      [zoom>=18] { line-width: 3; }
    }
    
    ::fill[zoom>=15]{
      line-color: #fff;
      line-dasharray: 1,1;
      [zoom>=16] { line-width: 1; }
      [zoom>=17] { line-width: 2;}  
      [zoom>=18] { line-width: 3; line-dasharray:3,3; }
    }
  }
  
  [class='rail'][zoom>=13],
  [class='transit'][zoom>=16] {
    line-width: 0.5;
    line-color: #ddd;//@rail_line;
    [zoom>=15]{
      line-width: 2;    
      dash/line-width: 1;
      dash/line-color: #fff;//@rail_dashline;
      dash/line-dasharray: 6,6;
    }
    [zoom>=17]{
      line-width: 3;    
      dash/line-width: 2;
    }
    [zoom>=18]{
      line-width: 4;    
      dash/line-width: 3;
    }
  }
}
