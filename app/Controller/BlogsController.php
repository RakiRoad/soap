<?php 


class BlogsController extends AppController {


	public function index() {
	
	}
	//view function 
	// Uses an sqll query 
	public function view($blog_id) 
	{
		$feed_sql = 'SELECT feeds FROM "newsoap"."feeds"';
		$feed_info = $this->Feed->query($feed_sql);
		$this->('feed_info', $feed_info);
	}

   

}


?>
