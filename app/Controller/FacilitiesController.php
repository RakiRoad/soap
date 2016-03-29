<?php
class FacilitiesController extends AppController {
		
	public $helpers = array('GoogleMapV3', 'Js');
    
    public $components = array('RequestHandler');

	public function index() {
	}
    
    public function view($facility_id) {
        // SQL argument - selects 11 parameters from newsoap.facilities table (focuses on facility info)
        // Joins rows of various tables 
        $facility_sql = 'SELECT facility_name, owner_name, dangerous_state, is_brownfield, location_id, county, municipality, latitude, longitude, x_coor, y_coor
                        FROM "newsoap"."facilities"
                        JOIN "newsoap"."locations" ON "newsoap"."facilities".location_id = "newsoap"."locations".id
                        JOIN ("newsoap"."owned_by" JOIN "newsoap"."owners" ON "newsoap"."owned_by".owner_id = "newsoap"."owners".id) as owned ON "newsoap"."facilities".id = owned.facility_id
                        JOIN "newsoap"."nn_data" ON "newsoap"."facilities".id = "newsoap"."nn_data".facility_id
                        WHERE "newsoap"."facilities".id = \'' . $facility_id . '\';';
        // Runs SQL arguemnts - returns information to $facility_info
        $facility_info = $this->Facility->query($facility_sql);
        // Sets var $facility_info into title
        $this->set('facility_info', $facility_info);
        // Another SQL argument fetching 6 parameters from newsoap.facilities table (focuses on chemical info)
        // Joins rows of toables
        $chem_sql = 'SELECT chemical_id, chemical_name, total_amount, fugair_amount, water_amount, stackair_amount
                    FROM "newsoap"."facilities"
                    JOIN ("newsoap"."contains" JOIN "newsoap"."chemicals" ON "newsoap"."contains".chemical_id = "newsoap"."chemicals".id) as chem ON "newsoap"."facilities".id = chem.facility_id
                    WHERE chem.facility_id = \'' . $facility_id . '\' ORDER BY chemical_name;';
		// Runs SQL arguemnts - returns information to $chem_info
        $chem_info = $this->Facility->query($chem_sql);
        // Sets var $chem_info into title
        $this->set('chem_info', $chem_info);
    }
    
    public function loadTable(){
        // Set auto render to false
        $this->autoRender = false;
        // Request data collected from database
        $data = $this->request->data;
        
        // Configure data var
        $limit = $data['limit'];
        $order = $data['order'];
        $offset = $data['offset'];
        $filters = $data['filters'];
        
        // Initalize array fields
        $fields = array();

        //Populate array with data previouslt colleced from the data base
        $fields[0] = "facility_name";
        $fields[1] = "location_id";
        $fields[2] = "county";
        $fields[3] = "owner_name";
        $fields[4] = "dangerous_state";
        $fields[5] = "is_brownfield";
        // Prepare another SQL argument
        $sql = 'SELECT facilities.id, facility_name, location_id, county, owner_name, dangerous_state, is_brownfield 
                FROM "newsoap"."facilities"
                JOIN "newsoap"."locations" ON "newsoap"."facilities".location_id = "newsoap"."locations".id
                JOIN ("newsoap"."owned_by" JOIN "newsoap"."owners" ON "newsoap"."owned_by".owner_id = "newsoap"."owners".id) as owned ON "newsoap"."facilities".id = owned.facility_id
                JOIN "newsoap"."nn_data" ON "newsoap"."facilities".id = "newsoap"."nn_data".facility_id
                WHERE ';
        // Add to SQL argument
        for($i = 0; $i < 6; $i++){
            $sql .= '(';
            // For each filter
            for($j = 0; $j < count($filters[$i]); $j++){
                // Add '[field] ILIKE [filter]'
                $sql .= '"' . $fields[$i] . '" ILIKE \'%' . $filters[$i][$j] . '%\'';
                // If more to add also append 'AND'
                if($j+1 < count($filters[$i])){
                    $sql .= ' AND ';
                }
                // If last memeber close statement with ')'
                else{
                    $sql .= ')';
                }
            }
            // If more filters append 'AND'
            if($i < count($filters)-1){
                $sql.= ' AND ';
            }
        }
        // Add to SQL argument - ORDER BY command
        $sql .= ' ORDER BY ' . $order;
        // Run SQL query - storing in count var
        $count = count($this->Facility->query($sql));
        // Add to SQL argument
        $sql .=' LIMIT ' . $limit . ' OFFSET ' . $offset . ';';
        // If Ajax - run SQL query and return Cake Response
        if($this->RequestHandler->isAjax()){
            $result = array($count, $this->Facility->query($sql));
            return new CakeResponse(array('body' => json_encode($result)));
        }
    }
}
?>