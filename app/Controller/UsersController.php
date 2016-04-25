<?php
class UsersController extends AppController{
	
	public $name = 'Users';
	
	public function beforeFilter(){
		parent::beforeFilter();
		$this->Auth->allow('add');
	}
	
	public function isAuthorized($user){
		if(in_array($this->action, array('edit', 'delete'))){
			if($user['id'] != $this->request->params['pass'][0]){
				return false;
			}
		}
		return true;
	}
	
	public function login(){
		if($this->request->is('post')){
			if($this->Auth->login()){
				$this->redirect($this->Auth->redirect());
			} else{
				$this->Session->setFlash('Your username/password combination was incorrect');
			}
		}
	}
	
	public function index(){
		$this->User->recursive = 0;
		$this->set('users', $this->User->find('all'));
	}
	
	public function view($id = null){
		$this->User->id = $id;
		
		if(!$this->User->exists()){
			throw new NotFoundException('Invalid user');
		}
		
		if(!$id){
			$this->Session->setFlash('Invalid user');
			$this->redirect(array('action' => 'index'));
		}
		$this->set('user', $this->User->read());
	}
	
	public function add(){
		if($this->request->is('post')){
			if($this->User->save($this->request->data)){
				$this->Session->setFlash('The user has been saved');
				$this->redirect(array('action'=>'index'));
			} else{
				$this->Session->setFlash('The user could not be saved. Please try again');
			}
		}
	}
	
	public function edit($id = null){
		$this->User->id = $id;
		
		if
	}
}
