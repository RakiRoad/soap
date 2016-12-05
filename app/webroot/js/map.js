/* 
 *
 * map.js represents the code reponsible for generating the map seen on the Map page. The map is initialized at the current 
 * latitude and logitude of the user's location. Information regarding the x and y coordinates necessary for creating the markers
 * are gathered from the window.app.facilities variable. Main functionality of the Javascript seen here can be traced by the 
 * $(document).ready block seen at the bottom of the file. 
*/

/**
 * Fall 2016 - Team Turing
 * Jan-Lucas Ott, Raphael Rezkalla, Bryan Jimenez, Robert Mannuzza, Rocky Quinto, Spencer Viviano
 * 
 * Add a heatmap feature and created collapsible sidebar panels.
 * 
 * Heatmaps are done almost entirely in this file. In the ready function, each heatmap is initialized
 * from an "SQL" query to a Google Fusion table, and then a button is added to the heatmaps panel that
 * will toggle that heatmap layer on or off for the map.
 * 
 * The fusion table can be found here: https://fusiontables.google.com/data?docid=1qPK9ER5-xtqYWX5A_TmHeVsmlUtDpHWjhFH61HDE
 * It is an exact upload of the TRI_NJ_2014.csv file in the 'UpdateScripts' directory of the repo.
 * In the future, this table should be synced with the SQL database somehow, or the data should be
 * inserted into the page via PHP (although this is not preferred because it's a lot of data).
 * 
 * Aside from the small snippet in the ready method, we also added a handful of methods for working
 * with the data and heatmaps, and one variable containing the heatmap objects.
 * The methods are all individually documented and marked with "Team Turing".
 *
 * We also modified the map.css file (added panel-title, btn-collapse, and btn-heatmap classes),
 * and most of the UI work is in the View/Map/index.ctp file.
 * 
 */

/*
 * 
 *
 * Spring 2015
 *
 * map.js now includes a function filterbyCounty() that allow users to filter the map by selecting a County. Once a County is selected,
 * the map will pan and zoom into the corresponding county. Only markers associated with the County selected will be displayed.
 * The filterbyDangerLevel() function allows users to check boxes corresponding to danger levels from 1-5, and the facility markers 
 * corresponding to the danger levels that are checked are set to visible. A search by address bar was also included in the index.php file 
 * and the funcitonality is implemented in the gotoAddress() function, allowing users to search the map by any address. Basic search functionality
 * was also improved, allowing users to search by either a mouse click or enter key. 
*/

/*
 *  Fall 2015
 * Description: Added function nonSitePredictor() to make an action when the latitude/longitude search button is pressed.
 * Filename: map.js
 * Last Modified On: 12/3/15 by Jeremy Leon, Zach Nelson, Evan Melquist, and Richard Levenson
 * 
 * INFORMATION FOR FUTURE SOAP TEAMS:
 *
 * As of Fall 2015 the "percent minorities" column is not in the current implementation of the SOAP databases,
 * so it causes errors when trying to access it. 
 *
 * The nonSitePredictor() function below does not work to correctly display any information on the modal that pops up.
 * This function attempts to open the SOAP/app/view/map/prediction.ctp HTML file in a modal by first sending the
 * entered latitude and longitude to the MapController.  If you are trying to fix this we would recommend looking
 * for any documentation available for the AJAX function of JQuery and the CakePHP AppController and attempting to 
 * re-engineer the existing working modal pop up that occurs when clicking on a facility on the map.  We did not have
 * enough time to do this fully.
 *
 * After getting the pop up working in general, the SOAP/app/View/Map/coordTest.php file contains a sample of code that
 * could potentially run the PointAnalysis c++ executable file which analyzes the coordinates with the clusters formed
 * by the clustering algorithm.
 * 
 */

//NOTE THE USE CURRENT LOCATION FEATURE DOES NOT WORK IN FIREFOX

var map;
var mapOptions;
var facilities;
var markers = {};

var filterCounty = "ALL_COUNTIES";
var filterFacilityName = "";
var dgLevelsVisible = [true, true, true, true, true];
var geocoder;  //for zoom and address search

function initialize(wrapperId, mapOptions) {
  geocoder = new google.maps.Geocoder();  //For zoom and address search
  map = new google.maps.Map(document.getElementById(wrapperId), mapOptions);

  //Try HTML5 geolocation
  //SE F15
  //Updated by Hunter Dubel
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(goToCurrLoc);
    }
   else {
    handleNoGeolocation(mapOptions);
  }
}

function handleNoGeolocation(mapOptions) { 
  map.setCenter(mapOptions.center);
  map.setZoom(8);
}

// google maps API callback method
function initMap() {
}

/**
 * Specifies all the inbuilt heatmaps that are available for display.
 * Each heatmap is defined by a sql query to execute on the fusion table,
 * and a function that processes the data query into a lat/long, and weight
 * to make a WeightedLocation. These locations are then loaded into a
 * Google Maps HeatMapLayer object and displayed on the browser's map.
 *
 * Note:
 *  every query should be ordered by whichever column will be the weight, descending.
 *  this is because the heatmap gradient will display very faint/nonexistant values
 *  for very low data point, so the data is pre-processed by shifting it all up by
 *  one gradient value for existing points. for this reason, each query should also filter
 *  out (ignore) 0 values.
 *  the above two things can be accomplished by using the following clause:
 * 	WHERE 'column'>0 ORDER BY 'column' DESC
 *  as seen in the heatmaps below
 * 
 * Team Turing, Fall 2016
 */
var heatmaps = {
    "carcinogens": {
        name: "Carcinogens",
        query: "SELECT LATITUDE,LONGITUDE,'ON-SITE_RELEASE_TOTAL' from 1qPK9ER5-xtqYWX5A_TmHeVsmlUtDpHWjhFH61HDE where CARCINOGEN='YES' and 'ON-SITE_RELEASE_TOTAL'>0 ORDER BY 'ON-SITE_RELEASE_TOTAL' DESC",
        layer: null
    },
    "lead": {
        name: "Lead",
        query: "SELECT LATITUDE,LONGITUDE,'ON-SITE_RELEASE_TOTAL' from 1qPK9ER5-xtqYWX5A_TmHeVsmlUtDpHWjhFH61HDE where CHEMICAL IN ('LEAD', 'LEAD COMPOUNDS') and 'ON-SITE_RELEASE_TOTAL'>0 ORDER BY 'ON-SITE_RELEASE_TOTAL' DESC",
        layer: null
    },
    "water": {
	name: "Release into Water",
	query: "SELECT LATITUDE,LONGITUDE,'5.3_WATER' from 1qPK9ER5-xtqYWX5A_TmHeVsmlUtDpHWjhFH61HDE WHERE '5.3_WATER'>0 ORDER BY '5.3_WATER' DESC",
	layer: null
    }
    "metals":
};

/**
 * $.map() callback used to create a weighted location using
 *  * array index 0 and 1 as the lat/long
 *  * array index 2 as the weight
 *
 * Team Turing, Fall 2016
 */
function thirdIndexWeight(row) {
    return {
        location: new google.maps.LatLng(row[0], row[1]),
        weight: Number(row[2])
    }
}

/**
 * Creates a google HeatmapLayer from data pulled from
 * a fusion table and processed into weighted locations.
 * This only creates a layer, unless "add" is true, which will also add it to the page.
 *
 * Team Turing, Fall 2016
 */
function createHeatmapLayer(heatmapInfo, add) {
    if (heatmapInfo == null || heatmapInfo.layer != null) return;
    $.ajax({
        dataType: 'jsonp',
        url: 'https://www.googleapis.com/fusiontables/v1/query',
        data: {
            sql: heatmapInfo.query,
            key:'AIzaSyBv2FzPm4yBsnT_50cCOyufvs5YQl1LNtk'
        },
        success:  function(data) {   
	    // offset all data points by the first gradient width, ensuring they show up
	    // even when there are large outliers
	    var max = heatmapInfo.process(data.rows[0]).weight;
	    var offset = max / 11;
	    var offsetRows = $.map(data.rows, function(row) {
	       // explicit cast so no str concat,
	       // and double [[]] so it appends array instead of flattening
	      return [[ row[0], row[1], Number(row[2]) + Number(offset) ]];
	    });

            // process the data into a location and weight
            var heatmapData = $.map(offsetRows, (heatmapInfo.process ? heatmapInfo.process : thirdIndexWeight);
            // create the weighted heatmap
            heatmapInfo.layer = new google.maps.visualization.HeatmapLayer({
                data: heatmapData, dissipating: false, radius: 0.1
            });
	    if (add) {
	      addHeatmapLayer(heatmapInfo);
	    }
        },
        error: function() {
            alert("Failed to get heatmap " + heatmapInfo.name);
        }
   });
}

/**
 * Quick method to toggle (either add or remove) heatmap depending on current state.
 */
function toggleHeatmapLayer(heatmapInfo) {
  if (heatmapInfo == null || heatmapInfo.layer == null) return;
  if (heatmapInfo.layer.getMap() == null) {
    addHeatmapLayer(heatmapInfo);
  } else {
    removeHeatmapLayer(heatmapInfo);
  }
}
/**
 * Adds a heatmap object (with a layer) to the page's map object.
 *
 * Team Turing, Fall 2016
 */
function addHeatmapLayer(heatmapInfo) {
    if (heatmapInfo == null || heatmapInfo.layer == null) return;
    heatmapInfo.layer.setMap(map);
}

/**
 * Removes a heatmap object (with a layer) from the page's map object.
 * This causes it to stop rendering.
 *
 * Team Turing, Fall 2016
 */
function removeHeatmapLayer(heatmapInfo) {
    if (heatmapInfo == null || heatmapInfo.layer == null) return;
    heatmapInfo.layer.setMap(null);
}

//Centers the map on the user's current location.
//If nothing is entered, zooms out and centers on initial position (Trenton, NJ)
//SE Fall 2015
//Added by Zach Nelson & Hunter Dubel
//Modified by Richard Levenson.
function goToCurrLoc(position) {
    mapOptions.initialPosition = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    setInitialPosition(mapOptions);
    map.setCenter(mapOptions.initialPosition);
    map.setZoom(15);
    var latbox = document.getElementById('latitudeSearchBar');
    var lonbox = document.getElementById('longitudeSearchBar');
    latbox.value = position.coords.latitude;
    lonbox.value = position.coords.longitude;
}


//Finds lat/long of address and centers map on it
//Added by Trevor Fullman
function codeAddress(address) {     
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
      } else {
        console.log("Geocode was not successful for the following reason: " + status);
      }
    });
  }
// adds a marker at the users current position
function setInitialPosition(mapOptions) {
  
  var infowindow = new google.maps.InfoWindow({
      content: mapOptions.currentPositionLabel
  });
  
  marker = new google.maps.Marker({
      position: mapOptions.initialPosition,
      map: map,
      icon: mapOptions.initialPositionImage,
      title: mapOptions.currentPositionLabel
  });
  
}
// Sets the marker based on the facilityInfo and adds it to the map
// the icon location is not the same due to the cabect folder
function setFacilityMarker(facilityInfo) {
  var facilityPosition = new google.maps.LatLng(facilityInfo.x_coor, facilityInfo.y_coor)
  
  var iconType;
  
  switch (facilityInfo.dg_level) {
    case '1':
      iconType = "GreenFactoryFinal.png";
      break;
      
    case '2':
      iconType = "YellowFactoryFinal.png";
      break;
      
    case '3':
      iconType = "OrangeFactoryFinal.png";
      break;
      
    case '4':
      iconType = "Red2FactoryFinal.png";
      break;
      
    case '5':
      iconType = "RedFactoryFinal.png";
      break;
  }
  
  var marker = new google.maps.Marker({
    position: facilityPosition,
    map: map,
    icon: '/SOAP/app/webroot/img/map/'+iconType,
    title: facilityInfo.facility_name
  });
  
  marker.facilityId = facilityInfo.id;
  
  markers[facilityInfo.id] = marker;

  google.maps.event.addListener(marker, 'click', pullDetails);
}

// Creators: Nathan Gould and Vitor Machado
// Function which pulls the details of a given facilityId or the marker's details if clicked
// from a marker on the map instead.
function pullDetails(inputId) {
    if(typeof inputId == 'string' || inputId instanceof String) {
    	    realFacilityId = inputId;
    }
    else {
    	    realFacilityId = this.facilityId
    }
    $('#mapModal').modal('show');
    $.ajax({
      type: 'get',
      url: location.origin + '/SOAP/app/webroot/index.php/map/detail/'+ realFacilityId,
      beforeSend: function() {
        $("div#mapModal div.modal-body").empty();
        $("div#mapModal div.modal-body").addClass("loading");
      },
      success: function(response) {
        $("div#mapModal div.modal-body").removeClass("loading");
        $("div#mapModal div.modal-body").append(response);
      }
    });
}


//Sets handlers for checkbox clicks and sets all boxes to be checked
function checkboxSetup() {

    // get reference to checkboxes
    var dgCheckboxes = document.getElementsByClassName('dangerLevel');
    
    // set handler function for clicks on danger level checkboxes
    for (var i=0; i<dgCheckboxes.length; i++) {
        dgCheckboxes[i].checked = true;
        dgCheckboxes[i].onclick = function() {updateMapDangerLevel()};
    }
}

//Looks at danger level checkboxes and filters map according
//to which ones are checked
function updateMapDangerLevel(){
    var dgCheckboxes = document.getElementsByClassName('dangerLevel');
    for (var i = 0; i < dgLevelsVisible.length; i++) 
        dgLevelsVisible[i] = dgCheckboxes[i].checked;
    filterFacilities();
}

//Filters facilities according to county name
//Added by Dylan Wulf and Trevor Fullman
function filterByCounty(county){
    filterCounty = county.toUpperCase();
    filterFacilities();

    if (county != "ALL_COUNTIES"){
        var countyAddress = county + " County, New Jersey, USA";  //Adds full name to County String
        codeAddress(countyAddress);  //Send county to be zoomed
        map.setZoom(11);
    }
    else {
        // Fix this as intialPosition is all the way in the bottom right corner
        // and zoom 8 might be too much
        map.setCenter(mapOptions.initialPosition);
        map.setZoom(8);   //set new zoom level
    }
}

//Centers the map on the user-entered address and zooms in.
//If nothing is entered, zooms out and centers on initial position (Trenton, NJ)
function goToAddress(){
    var userAddress = document.getElementById("addressSearchBar").value;
    if (userAddress != ""){
        codeAddress(userAddress);
        map.setZoom(15);
    }
    else{
        // Fix this as intialPosition is all the way in the bottom right corner
        // and zoom 8 might be too much
        map.setCenter(mapOptions.initialPosition);
        map.setZoom(8);
    }
}


//Predicts the pollution at a location that is not a known facility
//Added Evan Melquist, Jeremy Leon, and Richard Levenson
//Modified by Hunter Dubel and Jeremy Leon
function nonSitePredictor() {
	var latitude = document.getElementById("latitudeSearchBar").value;
	var longitude = document.getElementById("longitudeSearchBar").value;
	
	if(latitude !== "" && longitude !== ""  && /^-?\d*\.{0,1}\d+$/.test(latitude) && /^-?\d*\.{0,1}\d+$/.test(longitude)) {
		    $('#mapModal').modal('show');
    $.ajax({
      type: 'get',
      url: location.origin + '/SOAP/app/webroot/index.php/map/prediction/' + latitude + longitude,
      beforeSend: function() {
        $("div#mapModal div.modal-body").empty();
        $("div#mapModal div.modal-body").addClass("loading");
      },
      success: function(response) {
        $("div#mapModal div.modal-body").removeClass("loading");
        $("div#mapModal div.modal-body").append(response);
      }
    });
	} else {
		alert("Please enter a valid longitude and latitude.");
	}
}


//Looks through every object in the facilities array and sets it to visible or 
//not visible according to filter parameters (filterCounty and dgLevelsVisible)
//Added by Dylan Wulf
function filterFacilities(){
    for(var i = 0; i < facilities.length; i++) {
        var marker = markers[facilities[i].id];
        var countyMatches = (filterCounty == "ALL_COUNTIES") || (facilities[i].county == filterCounty);
        var dgLevelMatches = dgLevelsVisible[parseInt(facilities[i].dg_level) - 1] == true;
        var nameMatches = (filterFacilityName == "") || (facilities[i].facility_name.indexOf(filterFacilityName) > -1);
        if(countyMatches && dgLevelMatches && nameMatches){
	    if (!marker.getVisible()){
                marker.setVisible(true);
                document.getElementById(facilities[i].id).style.display = "";
	    }
        }
        else{
            marker.setVisible(false);
            document.getElementById(facilities[i].id).style.display = "none";
        }
    }
}

//No longer used, but I'll leave it here in case someone in the future
//wants to use it.
function facilityNameSearchByAjax () {
  	var filter = $('#mainSearchBar').val();
    
    $.ajax({
      type: 'get',
      url: location.origin + '/SOAP/app/webroot/index.php/map/filter/'+ filter,
      success: function(response) {
        $(".search-wrapper ul").empty();
        $(".search-wrapper ul").append(response);
      }
    });
  }

//Filter map and facilities list by facility name
function facilityNameSearch(){
    filterFacilityName = $('#mainSearchBar').val().toUpperCase();
    filterFacilities();
}

$(document).ready(function(e){
  mapOptions = {
    center: new google.maps.LatLng(40.2679, -74.779), //Default location: NJ, USA
    zoom: 8,
    initialPositionImage: 'http://google-maps-icons.googlecode.com/files/home.png',
    currentPositionLabel: 'Current Position',
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  
  initialize("map_canvas", mapOptions);
  
  facilities = window.app.facilities; //window.app.facilities is created in View/Map/index.ctp
  
  for (i = 0; i < facilities.length; i++) { 
    setFacilityMarker(facilities[i]);
  }
  
  //When a facility in the list is clicked, center the map on that facility, 
  //set the zoom, and trigger a click event on the facility map marker 
  //(this results in a call to pullDetails, defined above) 
  $(document).on("click", "li.facility-list-item", function(e) {
      var facilityId = $(this).attr("id");
      
      map.setCenter(markers[facilityId].getPosition());
      map.setZoom(15);
      
      e.stopPropagation();
      e.preventDefault();
      
      new google.maps.event.trigger(markers[facilityId], 'click');
    });

  // Team Turing Fall 2016 - initialize heatmaps, adding a button for each
  $.each(heatmaps, function(key, heatmap) {
    createHeatmapLayer(heatmap, false); // this maybe should be deferred until first time press
    var hmbtn = $('<button/>', {
      // creates a button that will toggle the respective heatmap
        text: heatmap.name,
        click: function (e) { 
	  toggleHeatmapLayer(heatmaps[$(this).data('heatmap')]);
	  $(this).toggleClass('btn-primary');
	},
        'data-heatmap': key,
        class: 'btn btn-primary btn-heatmap',
	'autocomplete': "off"
    });
    hmbtn.appendTo('#heatmaplist'); // adds the button to the section
  });
  
  //Set up checkboxes to be checked when the page loads
  //And set up event handlers for checkboxes
  checkboxSetup();
  
  //
  $('.latlong-btn').click(function(e) {
    nonSitePredictor();
  });
  
  //Call goToAddress() when address button is pressed
  $('.address-btn').click(function(e) {
    goToAddress();
  });


  //Call handleNoGeoLoca() when address button is pressed
  //
  $('.currentlocation-btn').click(function(e) {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(goToCurrLoc);
    }else {
      error('Geo Location is not supported');
      }
  });


  //call goToAddress() when enter key is pressed on addressSearchBar
  $('#addressSearchBar').keypress(function(e) {
    if (e.which == 13) goToAddress();
  });

  //Call facilityNameSearch() when search button is pressed
  $('.search-btn').click(function(e) {
	facilityNameSearch();
  });
  
   //Call facilityNameSearch() when enter key is pressed on facility name search bar
   $('#mainSearchBar').keypress(function(e) {
   	if (e.which == 13) facilityNameSearch();
  });
});

