<?php 


class BlogsController extends AppController {


	public function index() {
	
	}
	//view function 
	// Uses an sqll query at least we hope it will grab the feed values and we use in index.ctp of Blogs
	public function view($blog_id) 
	{
		$feed_sql = 'SELECT feeds FROM "newsoap"."feeds"';
		$feed_info = $this->Feed->query($feed_sql);
		$this->('feed_info', $feed_info);
	}

   

}


?>
