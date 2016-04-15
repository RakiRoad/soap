<?php
// Blog class that will extend the AppModel class
class Blog extends AppModel {
 
// Name of the Feed Model
 public $name = 'Feed';

// Ensures that no null feed entries are added to the database
 public $validate = array(
        'feeds' => array(
            'rule' => 'notEmpty'
        )    );

}
?>


