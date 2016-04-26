<?php
/* This file was the controller for the prior user auth system, we modified it based on a CakePHP bakery post to try to work with Hybridauth. The comment block at the bottom is the prior implimentation. If you wish to work on this and have questions contact Kevin Bohinski or Derek D. - Kevin Bohinski 12/1/14*/
//Edited Spring 2016 - Andrew, Greg, Jon, Sean, Kim, Kevin - The Young and the Reckless
//For HybridAuth REMOVING HYBRIDAUTH
session_start();	
App::uses('AuthComponentTwo', 'Controller');  //AuthComponentTwo was AuthComponent
//App::uses('Controller', 'Controller'); //replaced with lines below
App::uses('AppController', 'Controller'); 
class UsersController extends AppController {
    public function beforeFilter() {
        parent::beforeFilter();	//Allows anyone to call index, view, and display. 	//formerly commented out;
            	//$this->Auth->allow("*"); //remove eventually; allows any log in
        $this->Auth->allow('add');	//Allows anyone to call add and logout.	//uncommented to match online
        //$this->Auth->autoRedirect = false;	//Manual redirect set. CURRENT CHANGE
		//$this->Auth->flashElement = "invalidCredentials";	//Choose element to call for flash
    }
    
    public $uses = array('User');
    public function index() {  			//copied this method from inside hybridauth; present in online source
        $this->User->recursive = 0; //was commented out
        $this->set('users', $this->paginate());
    }
    
  /*  public function authenticate(){
        if($this->request->is('post')){
            $this->request->data['User']['password'] = $this->hashPassword($this->data['User']);  //im goin nuts
            if($this->Auth->login()){
                return $this->redirect($this->Auth->redirect());
            }
            $this->Session->setFlash('Invalid username or password.');
            return $this->redirect('users');
        }
    }
    
      private function hashPassword($login){
        // Get the salt of the user.
        $salt = $this->Login->find('first', array(
            'fields' => array(
                'Salt'),
            'conditions' => array(
                'Login.UserID' => $login['username'])));
        return md5(md5($login['password']) . $salt['User']['Salt']);
    }
*/
    public function login() 
    {			//method from online
    	if ($this->request->is('post')) 
    	{	
    		
    		
    		//Kim's epiphany
    		
    		//more nonsense
    		//$this->User->create();
    		//$id = 8009;
            	$username = $this->request->data['User']['username'];      //pulling username and password from the User form in app/view/Users/login.ctp
            	$password = $this->request->data['User']['password'];      
            	
            	$dbconn = pg_connect("host=localhost port= 5432 dbname=soap user=postgres password=cabect") //connecting to pg_database
    			or die('Count not connect: ' . pg_last_error());
            	$result = pg_query($dbconn, "SELECT password FROM newsoap.users WHERE username = '$username'"); //finding location of password associated with user
            	$found_password = pg_fetch_result($result, 'password'); //getting password from location
            	$result2 = pg_query($dbconn, "SELECT id FROM newsoap.users WHERE username = '$username'"); //finding location of user id associated with user
            	$found_id = pg_fetch_result($result2, 'id'); //getting id from location
            	$result3 = pg_query($dbconn, "SELECT role FROM newsoap.users WHERE username = '$username'"); //finding role of user
            	$found_role = pg_fetch_result($result3, 'role'); //getting role from location
         
                var_dump($result);
    		
    		pg_close($dbconn); //closes connection to pg_database
            	
            	
            	if(($password == $found_password) && (!($password == ""))){
            		$this->Session->setFlash(__('Username and password match! ')); //checks to see if password is valid
            		///more trial   session hasn't been tried yet, but doesn't seem to cause harm yet
            		session_name($found_role);
            		session_start();
            		$_Session['login_id'] = $found_id;
            		//end trial
            		
            		
        		return $this->redirect($this->Auth->redirect());
            	}
            	else{
            		$this->Session->setFlash(__('Username and password do not match! '));
            	}
     
    		//end of Kim's epiphany
    		
    		
    		
    	/*	
    		
    		//echo "hi!"; //just testing login function override
    	//not sure what post is; this condition is satisfied though
    	//$this->Session->setFlash(__('Invalid Username or Password. Please try again.'));	//trying to debug, see what happens here
        	if ($this->Auth->login())
        	{
        		//this line currently is not functioning; need to satisfy Auth. //removing ->login()
        		$this->Session->setFlash(__('Login Success! '));  ///just trying something
        		//return $this->redirect($this->Auth->redirect());   //this redirect method currently functions; we tested it by moving it into the else portion, it sent us to the home page and gave us the flash message.
            		//return $this->redirect($this->Auth->redirectUrl());
        	}
        	else
        	{
        	//$this->Session->setFlash(__('Invalid Username or Password. Please try again.'));  temperarily commented out
        	//return $this->redirect($this->Auth->redirect());
        	//$this->Session->setFlash(__($UserUsername)); //display this if credentials are incorrect
        	}
        	*/
    	} 
       //$this->Flash->error(__('Invalid username or password, try again')); 		//this resulted in error; the error() method was not found
  }
  
  public function logout() {			//hasn't been tested or provided a button yet
    session_destroy();  ///if this logs out everyone, look into if(isset($_SESSION['login_id']))unset($_SESSION['login_id'])
    return $this->redirect($this->Auth->logout());  //didn't try out yet
  	
  }
    						//this is different than online
    public function isAuthorized($user) {	//Checks to see if a user is logged in. If not, access is denied.
	    if ($this->action === 'dashboard' && $this->Auth->user('id') !== null) {
	       // Registered users can view the dashboard
	        return true;
	    }
	    else if ($this->action === 'delete' && $user['role'] === 'admin') //Admin has the power to delete
	    	return true;
	    else
	    	return false;
	}
    public function view($id = null) {
        $this->User->id = $id;
        if (!$this->User->exists()) {
            throw new NotFoundException(__('Invalid user'));
        }
       $this->set('user', $this->User->read(null, $id)); 
       //$this->set('user', $this->User->findById($id)); was tried in place of line above
    }
    public function add() {
	$this->layout = 'login';  //changed from login to add
        if ($this->request->is('post')) {
        	
        	//more nonsense
    		//$this->User->create();
    		//$id = 8009;
            	$username = $this->request->data['User']['username'];
            	$password = $this->request->data['User']['password'];   //sets variables to pull from user forms to put into database
            	$role = $this->request->data['User']['role'];
    		$date = date('m/d/Y h:i:s a', time());
    		
    		if (($username == "") || ($password == "")){					//checks if fields are left empty
    			echo 'Username or password was not entered.';
    		}
    		else{
    		// this nonsense works to hardcode an entry into the database  (remove // infront of result and var dump, replace hardcode with variable)
    		
    		$dbconn = pg_connect("host=localhost port= 5432 dbname=soap user=postgres password=cabect")  //connects to pg_database
    			or die('Count not connect: ' . pg_last_error());
    			
    			
    		$result = pg_query($dbconn, "INSERT INTO newsoap.users(username, password, created, modified, role) VALUES('$username', '$password', '$date', '$date', '$role');");
    		//^ queries the pg_database and inputs various variables from user fields and input ^
    		
    		//var_dump($result); ///remove var_dump() around $result
    		pg_close($dbconn); 
    		

    		
    		$this->Session->setFlash(__(var_dump($result))); //remove 'Account created!', replaced with $result
        		return $this->redirect('http://csc415-team03.tcnj.edu/cabect/SOAP/index.php/users/login'); //were getting wacky
    		
    		}
        	
        	
	//was there is now removed 	
            /*$this->User->create();
            if ($this->User->save($this->request->data)) {
                $this->Session->setFlash('Account has been created. Welcome to SOAP!', 'uploadSuccess');
                $this->redirect(array('controller' => 'pages', 'action' => 'main'));
            } else {
                $this->Session->setFlash(__('The user could not be saved. Please, try again.'));
            }*/
    		
        }
    }
    public function edit($id = null) {
        $this->User->id = $id;
        if (!$this->User->exists()) {
            throw new NotFoundException(__('Invalid user'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->User->save($this->request->data)) {
                $this->Session->setFlash(__('The user has been saved'));
                return $this->redirect(array('action' => 'index'));  ///added return
            } else {
                $this->Session->setFlash(__('The user could not be saved. Please, try again.'));
            }
        } 
        else {
        	//$this->request->data = $this->User->findById($id); //was tried in place of line below
            $this->request->data = $this->User->read(null, $id);
            unset($this->request->data['User']['password']);
        }
    }
    
    public function delete($id = null) {
        $this->User->id = $id;
        if (!$this->User->exists()) {
            throw new NotFoundException(__('Invalid user'));
        }
        if ($this->User->delete()) {
            $this->Session->setFlash(__('User deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('User was not deleted'));
        $this->redirect(array('action' => 'index'));
    }
}
/* REMOVING HYBRID AUTH
	public function login2($provider) {
//http://bakery.cakephp.org/articles/thehanx/2012/07/27/social_login_with_hybridauth
		 require_once( WWW_ROOT . 'hybridauth/Hybrid/Auth.php' );
        $hybridauth_config = array(
            "base_url" => 'http://' . $_SERVER['HTTP_HOST'] . $this->base . "/hybridauth/", // set hybridauth path
            "providers" => array(
                "Facebook" => array(
                    "enabled" => true,
                    "keys" => array("id" => "718903374814138", "secret" => "2da259d93197b6113615717853b5b20d"),
                    "scope" => 'email',
                ),
                "Twitter" => array(
                    "enabled" => true,
                    "keys" => array("key" => "twitter_api_key", "secret" => "twitter_api_secret")
                )
// for another provider refer to hybridauth documentation
            )
        );
	echo "IM OUT OF THE TRY";
        try {
            // create an instance for Hybridauth with the configuration file path as parameter
            $hybridauth = new Hybrid_Auth($hybridauth_config);
            // try to authenticate the selected $provider
            $adapter = $hybridauth->authenticate($provider);
            // grab the user profile
            $user_profile = $adapter->getUserProfile();
//debug($user_profile); //uncomment this to print the object
//exit();
            //$this->set( 'user_profile',  $user_profile );
            //login user using auth component
            if (!empty($user_profile)) {
                $user = $this->_findOrCreateUser($user_profile, $provider); // optional function if you combine with Auth component
                unset($user['password']);
                $this->request->data['User'] = $user;
                if ($this->Auth->login($this->request->data['User'])) {
                    $this->redirect($this->Auth->redirect());
                    $this->Session->setFlash('You are successfully logged in');
                } else {
                    $this->Session->setFlash('Failed to login');
                }
            }
        } catch (Exception $e) {
            // Display the recived error
		echo "IM IN THE CATCH";
            switch ($e->getCode()) {
                case 0 : $error = "Unspecified error.";
                    break;
                case 1 : $error = "Hybriauth configuration error.";
                    break;
                case 2 : $error = "Provider not properly configured.";
                    break;
                case 3 : $error = "Unknown or disabled provider.";
                    break;
                case 4 : $error = "Missing provider application credentials.";
                    break;
                case 5 : $error = "Authentification failed. The user has canceled the authentication or the provider refused the connection.";
                    break;
                case 6 : $error = "User profile request failed. Most likely the user is not connected to the provider and he should to authenticate again.";
                    $adapter->logout();
                    break;
                case 7 : $error = "User not connected to the provider.";
                    $adapter->logout();
                    break;
            }
            // well, basically you should not display this to the end user, just give him a hint and move on..
            $error .= "Original error message: " . $e->getMessage();
            $error .= "Trace: " . $e->getTraceAsString();
            $this->set('error', $error);
        }
    }
// this is optional function to create user if not already in database. you can do anything with your hybridauth object
private function _findOrCreateUser($user_profile = array(), $provider=null) {
        if (!empty($user_profile)) {
            $user = $this->User->find('first', array('conditions' => array(
                'OR'=>array('User.username' => $user_profile->identifier, 'User.email'=>$user_profile->email))));
            //When there is no user found he/she will have the option to create a profile
            if (!$user) {
                $this->User->create();
                $this->User->set(array(
                    'group_id' => 2,
                    'first_name' => $user_profile->firstName,
                    'last_name' => $user_profile->lastName,
                    'email' => $user_profile->email,
                    'username' => $user_profile->identifier,
                    'password' => AuthComponent::password($user_profile->identifier), //in case you need to save password to database
                    'country' => $user_profile->country,
                    'city' => $user_profile->city,
                    'address' => $user_profile->address,
                    //add another fields you want
                ));
                if ($this->User->save()) {
                    $this->User->recursive = -1;
                    $user = $this->User->read(null, $this->User->getLastInsertId());
                    return $user['User'];
                }
            } else {
                return $user['User'];
            }
        }
	}
	public function login() {
		if ($this->request->is('post')) {
        		if ($this->Auth->login()) {
            			return $this->redirect($this->Auth->redirect());
        		} else {
            			$this->Session->setFlash('Username or password is incorrect');
        		}
    		}	
	}
    public function logout() {
        $this->Connect->FB->destroysession();	//stops FB session
        $this->Session->destroy();
        $this->Auth->logout();
        $this->redirect('/');
    }
    public function index() {
        $this->User->recursive = 0;
        $this->set('users', $this->paginate());
    }
    public function dashboard() {
        $userId = $this->Session->read('Auth.User.username');
        if ($userId !== null)
        {
        	$this->set('username', $userId);
        }
    }
    */ //END OF HYBRID AUTH REMOVAL
?>
