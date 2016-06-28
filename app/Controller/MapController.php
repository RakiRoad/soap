<?php
// The MapController class primarily is responsible for queries to the database on 
// behalf of the Map page's view. Appropriate
// information is retrieved from the database and sent to the view (index.ctp located in .../app/View/Map/). This same process
// is used for the dynamic generation of the details infographic which is displayed when a facility marker is clicked by the user.
//

/**
 * Modified to include the retrieval of demographic information 
 * to be displayed within the details box. 
 * 
 */

/**
 *
 * Commented out percent_minority field to prevent error in SOAP server integration.
 * Filename: MapController.php
 * Last Modified On: 12/3/15
 * 
 *
 * INFORMATION FOR FUTURE SOAP TEAMS:
 *
 * As of Fall 2015 the "percent minorities" column is not in the current implementation of the SOAP databases,
 * so it causes errors when trying to access it. 
 *
 * The prediction() function below does not work to display any information on the modal that pops up.  This function
 * is called from nonSitePredictor() of SOAP/app/webroot/js/map.js.  If you are trying to fix this we would recommend
 * looking for any documentation available for the AJAX function of JQuery and attempting to re-engineer the existing
 * working modal pop up that occurs when clicking on a facility on the map.  We did not have enough time to do this 
 * fully.
 * 
 */
 
 //MapController class is an extension of the AppController class that handles map      //requests sent to the database. Map information is retrieved from the database
// and sent to View
class MapController extends AppController {

	public $components = array('RequestHandler');
	var $uses = array('Facility');
	//selects information from select tables.
	public function index() {
		$map_sql = 'SELECT f.id,f.facility_name,l.x_coor,l.y_coor, n.dangerous_state, l.county FROM facilities f,locations l, nn_data n WHERE f.location_id = l.id AND n.facility_id = f.id';
		//returns information to $map_info
		$map_info = $this->Facility->query($map_sql);
		//Sets $map_info to title.
		$this->set('map_info', $map_info);
	}	

	//percent_minority data was added to the vitual machine database server ubuntu@172.16.100.43 and will need to be integrated with the main SOAP server for the information to be retrieved
	//percent_minority commented out to prevent error
	public function detail($facility_id) {
		//SQL argument that selects 11 parameters from newsoap.facilities
		//JOIN combines data from various tables.
		$facility_sql = 'SELECT facility_name, owner_name, dangerous_state, is_brownfield, location_id, county, municipality, latitude, longitude, x_coor, y_coor--, percent_minority
                        FROM "newsoap"."facilities"
                        JOIN "newsoap"."locations" ON "newsoap"."facilities".location_id = "newsoap"."locations".id
                        JOIN ("newsoap"."owned_by" JOIN "newsoap"."owners" ON "newsoap"."owned_by".owner_id = "newsoap"."owners".id) as owned ON "newsoap"."facilities".id = owned.facility_id
                        JOIN "newsoap"."nn_data" ON "newsoap"."facilities".id = "newsoap"."nn_data".facility_id
                        WHERE "newsoap"."facilities".id = \'' . $facility_id . '\';';
        //Returns resultant information to $facility_info after running SQL arguments
		$facility_info = $this->Facility->query($facility_sql);
		//Sets variable $facility_info into title
		$this->set('facility_info', $facility_info);
		//This SQL argument fetches information for 6 parameters from newsoap.facilities
		//Tables are joined together using JOIN.
		$chem_sql = 'SELECT chemical_id, chemical_name, total_amount, fugair_amount, water_amount, stackair_amount
                    FROM "newsoap"."facilities"
                    JOIN ("newsoap"."contains" JOIN "newsoap"."chemicals" ON "newsoap"."contains".chemical_id = "newsoap"."chemicals".id) as chem ON "newsoap"."facilities".id = chem.facility_id
                    WHERE chem.facility_id = \'' . $facility_id . '\' ORDER BY chemical_name;';
        //Information returned to $chem_info
		$chem_info = $this->Facility->query($chem_sql);
		//Variable $chem_info set to title
		$this->set('chem_info', $chem_info);
		
		
		$this->layout = 'ajax';
		$this->render('detail');
	}

	//This function is used to display prediction popup
	public function prediction($latitude, $longitude){
		$this->set('latitude', $latitude);
		$this->set('longitude', $longitude);
		$this->layout = 'ajax';
		$this->render('prediction');
	}

	//This function is no longer used, since filtering is now done through javascript. 
	//But we will leave it here in case a future group wants to use it.	
	//This function filters based on the selected filtering criteria.
	public function filter($filter_criteria = "") {
		
		//Filtering criteria converted to lowercase.
		$filter_criteria = strtolower($filter_criteria);
		//Selects id, facility name, x coordinate, y coordinate, and state data from
		//newsoap.facilities
		$filter_query = "SELECT 
  			f.id, 
  			f.facility_name,
  			l.x_coor, 
  			l.y_coor,
  			n.dangerous_state
		
			FROM 
  			newsoap.facilities f
			JOIN newsoap.locations l ON f.location_id = l.id
			JOIN newsoap.nn_data n ON n.facility_id = f.id
			WHERE
			lower(f.location_id) LIKE '%$filter_criteria%' OR
			lower(f.facility_name) LIKE '%$filter_criteria%'";
		//Retuns informaion to $facilities
		$facilities = $this->Facility->query($filter_query);
		//Sets $facilities into title
		$this->set('facilities', $facilities);
		
		
		$this->layout = 'ajax';
		$this->render('filter');
	}
}
?>
