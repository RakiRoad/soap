<?php
/*App::uses('AuthComponent', 'Controller/Component');
class User extends AppModel {
    public $name = 'User'; //user variable; not present in online source
    public $validate = array(   //validated through array
        'username' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'A username is required'
            )
        ),
        'password' => array(    //PW is validated through array
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'A password is required'
            )
        ),
        'role' => array(    
            'valid' => array(   //role is validated through array
                'rule' => array('inList', array('admin', 'user')),      //add journalist
                'message' => 'Please enter a valid role',
                'allowEmpty' => false
            )
        )
    );
     //commented out to match online version, entered below
    public function beforeSave($options = array()) {            //not in online source
        if (isset($this->data[$this->alias]['password'])) {
            $this->data[$this->alias]['password'] = AuthComponent::password($this->data[$this->alias]['password']); //checks to see if credentials are correct
        }
        return true;
    }
    /* public function beforeSave($options = array()) {
    if (isset($this->data[$this->alias]['password'])) {
        $passwordHasher = new BlowfishPasswordHasher();
        $this->data[$this->alias]['password'] = $passwordHasher->hash(
            $this->data[$this->alias]['password']
        );
    }
    return true;
} */

App::uses('AppModel', 'Model');

class User extends AppModel {
    public $validate = array(
        'username' => array(
            'required' => array(
                'rule' => 'notBlank',
                'message' => 'A username is required'
            )
        ),
        'password' => array(
            'required' => array(
                'rule' => 'notBlank',
                'message' => 'A password is required'
            )
        ),
        'role' => array(
            'valid' => array(
                'rule' => array('inList', array('admin', 'author')),
                'message' => 'Please enter a valid role',
                'allowEmpty' => false
            )
        )
    );
}
