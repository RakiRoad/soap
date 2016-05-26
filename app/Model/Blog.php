<?php
// Blog class that will extend the AppModel class
class Blog extends AppModel {

// Name of the Feed Model
 public $name = 'Blog';



/*
 public $useTable = 'blogs';
 public $useTable = 'categories';
 public $useTable = 'comments';
 public $useTable = 'feeds';
// Ensures that no null feed entries are added to the database
 public $validate = array(
        'feeds' => array(
            'rule' => 'notEmpty'
        )
    ); 
*/

}
?>