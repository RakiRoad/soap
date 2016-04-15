<?php
// Blog class that will extend the AppModel class
class Blog extends AppModel {
 
// Name of the Blog model
 public $name = 'Feed';

// Ensures that no null blog entries are added to the database
 public $validate = array(
        'feeds' => array(
            'rule' => 'notEmpty'
        )    );

}
?>


