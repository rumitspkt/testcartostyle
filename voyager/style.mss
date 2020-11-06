// =====================================================================
// POSITRON ALL
// =====================================================================

// =====================================================================
// MAP SET UP:
// - style: fonts, base colors, map properties
// - admin: Boundaries, Places
// - hydro: Hydro
// - landuse: Urban areas, green areas, parks, buidlings, aeroways
// - roads: Roads
// - labels: Labels for all features
// =====================================================================

// STYLING VARIABLES //

//Fonts
@azo: "Azo Sans Regular","Open Sans Regular", "Arial Unicode MS Regular";
@azo_md: "Azo Sans Medium","Open Sans Semibold", "Arial Unicode MS Regular";
@azo_bd: "Azo Sans Bold","Open Sans Bold", "Arial Unicode MS Bold";
@azo_it: "Azo Sans Italic","Open Sans Italic";

//CARTO Fonts
@mont: "Montserrat Regular";
@mont_md: "Montserrat SemiBold";
@mont_bd: "Montserrat Bold";
@mont_it: "Montserrat Italic";

@sans: "Open Sans Regular", "Arial Unicode MS Regular";
@sans_md: "Open Sans Semibold", "Arial Unicode MS Regular";
@sans_bd: "Open Sans Bold", "Arial Unicode MS Bold";
@sans_it: "Open Sans Italic";

//Base Colors
@landmass_fill: lighten(#F8F3EB,2%);//lighten(#e3e3dc, 8%);
@land: darken(#F8F3EB,10%);

// MAP PROPERTIES //

Map {
  background-color: @landmass_fill;
  font-directory: url(fonts/);
}