<?php

App::uses('FB', 'Facebook.Lib');
//The AppController class sets the structural framework for the Representatives webpage. 
class RepresentativesController extends AppController {
//Creates arrays that call from another location. 
    public $helpers = array('GoogleMapV3', 'Js');
    
    public $components = array('RequestHandler');
//This index function currently does not seem to be doing anything.
    public function index() {
    }
//The function returns name, party, date elected and district number data from the newsoap and politicians table. Only data in which
//the representative's chamber is lower will be returned. 
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
                WHERE chamber=\'lower\' AND ';
        //The below iterative code concatenates words such as "CAST", "ILIKE" and "AND" to the data returned from the search query.
        //However, this does not seem to be a valuable addition to the code. 
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
        //The output is simply ordered by the order in which each representative's entry is presently in the database. 
        $sql .= ' ORDER BY ' . $order;
        $count = count($this->Representative->query($sql));
        $sql .=' LIMIT ' . $limit . ' OFFSET ' . $offset . ';';
        $this->Representative->query($sql);
        if($this->RequestHandler->isAjax()){
            $result = array($count, $this->Representative->query($sql));
            return new CakeResponse(array('body' => json_encode($result)));
        }
    }
}
?>
