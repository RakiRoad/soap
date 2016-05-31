<?php

App::uses('FB', 'Facebook.Lib');
// The AppController class creates the framework for the SenatorsController class and controls how applications interact. 
class SenatorsController extends AppController {
// Creates new arrays 
    public $helpers = array('GoogleMapV3', 'Js');
    
    public $components = array('RequestHandler');
    //The index function will need to be filled in. 
    public function index() {
    }
    //Outputs data that returns name, party, date elected and district number from the new soap and politicians tables with 
    //the chamber value equal to upper.  
    public function loadTable(){
        $this->autoRender = false;
        $data = $this->request->data;
        $limit = $data['limit'];
        $order = $data['order'];
        $offset = $data['offset'];
        $filters = $data['filters'];
        $fields = array();
        $fields[0] = "name";
        $fields[1] = "party";
        $fields[2] = "date_elected";
        $fields[3] = "district_no";
        $sql = 'SELECT image_link, name, party, date_elected, district_no 
                FROM "newsoap"."politicians"
                WHERE chamber=\'upper\' AND ';
       //This block of code does not seem to provide value to the overall program, as it only concatenates meaningless words to 
       //the output from the search query. 
        for($i = 0; $i < 4; $i++){
            $sql .= '(';
            for($j = 0; $j < count($filters[$i]); $j++){
                $sql .= 'CAST("' . $fields[$i] . '" AS TEXT) ILIKE \'%' . $filters[$i][$j] . '%\'';
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
        //This block of code orders the data from the search query based on its location in the database. 
        $sql .= ' ORDER BY ' . $order;
        $count = count($this->Senator->query($sql));
        $sql .=' LIMIT ' . $limit . ' OFFSET ' . $offset . ';';
        $this->Senator->query($sql);
        if($this->RequestHandler->isAjax()){
            $result = array($count, $this->Senator->query($sql));
            return new CakeResponse(array('body' => json_encode($result)));
        }
    }
}
?>
