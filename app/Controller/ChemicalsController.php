<?php
//Class is an exstenstion from the App Controller file, which gives the structure of the webpage.  And how applications will interact with the webpage
class ChemicalsController extends AppController {
	//Creating a new arrays
    public $helpers = array('GoogleMapV3', 'Js');
    
    public $components = array('RequestHandler');
    
    public function index() {
    }
    //This is the search function for Chemicals where you can search and get results returned based on chemical name, carcinogenic or not
    //if the clean air act was passed for the chemical, if the chemical is metal, and its pbt levels
    //pulls data from newsoap table and chemicals table
    //where the id = to whatever the chemicals id is, so it must be typed exactly.
    public function view($chem_id) {
        $chem_sql = 'SELECT chemical_name, carcinogenic, clean_air_act, metal, pbt
                    FROM "newsoap"."chemicals"
                    WHERE "newsoap"."chemicals".id = \'' . $chem_id . '\';';
        $chem_info = $this->Chemical->query($chem_sql);
        /*
        Returns the facility IDs Facility names from the New Soap and Chemicals Tables in the SOAP database, when the facility 
        chemical ID = the chemical searched, and when there are multiple results returned, the facilities will be ordered alphabetically
        by facility name
        */
        $this->set('chem_info', $chem_info);
        $facility_sql = 'SELECT facility_id, facility_name
                        FROM "newsoap"."chemicals"
                        JOIN ("newsoap"."contains" JOIN "newsoap"."facilities" ON "newsoap"."contains".facility_id = "newsoap"."facilities".id) as facility ON "newsoap"."chemicals".id = facility.chemical_id
                        WHERE facility.chemical_id = \'' . $chem_id . '\' ORDER BY facility_name;';
		$facility_info = $this->Chemical->query($facility_sql);
        $this->set('facility_info', $facility_info);
    }
    
    /*
    After data is pulled from above, a new table will be created with specific information based on the chemicals and facilities retrieved.
    What will be included in this table are in fields 0-4
    In this new table you can also run queries where you can return all the data from the original databases.
    However, this function looks incomplete, because the WHERE has no current conditions.
    */
    
    //This currently looks to be an incomplete function without any returning output, this will need to be cleaned up and rewritten
    public function loadTable(){
        $this->autoRender = false;
        $data = $this->request->data;
        $limit = $data['limit'];
        $order = $data['order'];
        $offset = $data['offset'];
        $filters = $data['filters'];
        $fields = array();
        $fields[0] = "chemical_name";
        $fields[1] = "carcinogenic";
        $fields[2] = "clean_air_act";
        $fields[3] = "metal";
        $fields[4] = "pbt";
        $sql = 'SELECT chemicals.id, chemical_name, carcinogenic, clean_air_act, metal, pbt 
                FROM "newsoap"."chemicals"
                WHERE ';
                
        /* The code below doesnt seem to serve a valid function or purpose, so it has been commented out.
       */
        
        for($i = 0; $i < 5; $i++){
            $sql .= '(';
            for($j = 0; $j < count($filters[$i]); $j++){
                $sql .= '"' . $fields[$i] . '" ILIKE \'%' . $filters[$i][$j] . '%\'';
                if($j+1 < count($filters[$i])){
                    $sql .= ' AND ';
                }
                else{
                    $sql .= ')';
                }
            }
            if($i < count($filters)-1){
                $sql.= ' AND ';
            }
        }
        $sql .= ' ORDER BY ' . $order;
        $count = count($this->Chemical->query($sql));
        $sql .=' LIMIT ' . $limit . ' OFFSET ' . $offset . ';';
        if($this->RequestHandler->isAjax()){
            $result = array($count, $this->Chemical->query($sql));
            return new CakeResponse(array('body' => json_encode($result)));
        }
    }
}
?>
