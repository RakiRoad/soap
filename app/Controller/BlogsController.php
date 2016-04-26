<?php

class BlogsController extends AppController {


        public function index() {
         $feed_sql = 'SELECT ARRAY(SELECT ROW(feeds) FROM "newsoap"."feeds")';
          $feed_info = $this->Blog->query($feed_sql);
                  $this->set('feed_info', $feed_info);


          }


        public function add(){

        }

       public function view(){
         /*  $feed_sql = 'SELECT feeds FROM "newsoap"."feeds"';
           $feed_info = $this->Feed->query($feed_sql);
           $this->set('feed_info', $feed_info);*/
           }
        public function blog(){
           $blog_sql = 'SELECT * FROM "newsoap"."blogs"';
           $blog_info = $this->Blog->query($blog_sql);
           $this->set('blog_info', $blog_info);
}

        public function category(){
           $category_sql = 'SELECT * FROM "newsoap"."categories"';
           $category_info = $this->Category->query($category_sql);
           $this->set('category_info', $category_info);
}

        public function comment(){
           $comment_sql = 'SELECT * FROM "newsoap"."comments"';
           $comment_info = $this->Comment->query($comment_sql);
           $this->set('comment_info', $comment_info);
}

}





?>

