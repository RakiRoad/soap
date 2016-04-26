
<?php
/*$db = new mysqli('localhost','root','','blog') or die('error with connection');
?>
<?php
session_start();
include('../includes/db_connect.php');
if(isset($_POST['submit'])){
        $title = $_POST['title'];
        $body = $_POST['body'];
        $category = $_POST['category'];
        $title = $db->real_escape_string($title);
        $body = $db->real_escape_string($body);
        $user_id = $_SESSION['user_id'];
        $date = data('Y-m-d G:i:s'); 
        $body = htmlentities($body);
        if ($title && $body){// && $category) { 
        $query = $db->query("INSERT INTO posts (user_id, title, body, category_id, posted) VALUES('$user_id','$title', '$body', '$category', '$date')");        
                if($query){     
                echo "post added";
                }else {
                echo "error";
                }
            }else{
        echo "missing data";
        }
}*/
?>
<html>
<head>     
   <?php $this->Html->script('jquery'); ?>
        <script type="text/javascript"  src="<?php echo $this->webroot; ?>/js/userQuery.js"></script>
    </head>
<style>
section{
float:left;
position: absolute;
left: 20px;
}
nav{
float:right;
position: relative;
right: 50px;
}


#slideshow {
                    margin: 80px auto;
                    position: relative;
                    width: 800px;
                    height: 250px;
                    padding: 10px;
                    box-shadow: 0 0 20px rgba(0,0,0,0.4);
                }

                #slideshow > div {
                    position: absolute;
top: 10px;
                    left: 10px;
                    right: 10px;
                    bottom: 10px;
                }


 #wrapper{
margin:auto;
width:800px;

}



</style>


        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
        <script>
                $(function() {
$("#slideshow > div:gt(0)").hide();

                        setInterval(function() {
                          $('#slideshow > div:first')
                            .fadeOut(3000)
                            .next()
                            .fadeIn(5000)
                            .end()
                            .appendTo('#slideshow');
                        },  5000);

                });
        </script>
    <head>

        <title>RSS Feed Reader</title>

    </head>
    <body>

        <div class"details">
        <div class"style" style="text-align:center" >
      <h1 style="font-size:300%"> SOAP Blog Home Page   </h1>


<div id="slideshow">
           <div>
                <img src="http://artandarts.com/images/photos/trees/pear_tree_11_23_07/Pear_Tree_Photo.JPG" width=100% height=100%>        </div>
           <div>
             <img src="https://11111-presscdn-0-2-pagely.netdna-ssl.com/wp-content/uploads/2015/09/Bear-Cubs-Playing-3.jpg" width=100% height=100%>
           </div>
           <div>
         <img src="http://wac.450f.edgecastcdn.net/80450F/nj1015.com/files/2012/06/hackelbarney1.jpg" width=100% height=100%>
           </div>
        </div>



<section>
<!--
<br>
<br>
<p>This is a paragraph</p>
<p>This is another paragraph</p>
<img src="http://farm4.staticflickr.com/3130/2836828090_67d4900ab3_o.jpg" alt="Mountain View" style="width:304px;height:228px;">

<div id="wrapper">

        <div id="content">

        <form action="<?php echo $_SERVER['PHP_SELF']?>" method="post">

        <label>Title</label><input type="text" name="title" />  

        <label for="body">Body:</label>

        <textarea name="body" col=50 rows=10></textarea>

        <label> Category:</label>

        <select name="category">
        
                <?php

                        /*$query = $this->Blog->query("SELECT * FROM categories");
                        while($row = $query->fetch_object()){
                        echo "<option value' ".$row->category_id."'>".$row->category."</option>";
                        }*/
                ?>
        </select>
        <br />
        <input type="submit" name="submit" value="submit" />

        </form>
        </div>
</div>

<!--<form>
  First name:<br>
  <input type="text" name="firstname"><br>
  Last name:<br>
<input type="text" name="lastname">
</form>
<textarea name="message" rows="10" cols="30">

</textarea>

-->
</section>







<?php

        $feeds = array();

        foreach($feed_info as $f){

        $feeds = $f;
        
}

  //  print_r($feeds[0]);
//      echo count($feeds[0]);
        $feed_arr = implode(',',$feeds[0]);

/*
$clean = str_replace('\"', '', $feed_arr);
$clean = str_replace(')', '', $clean);
$clean = str_replace('(', '', $clean);
$clean = str_replace('}', '', $clean);
$clean = str_replace('{', '', $clean);
$clean = str_replace(' ', '', $clean);
//$clean = trim($clean , '"');
*/

        preg_match_all('/\b(?:(?:https?):\/\/|www\.)[-A-Z0-9+&@#\/%?=~_|$!:,.;]*[-A-Z0-9+&@#\/%=~_|$]/ix', $feed_arr, $feeds1, PREG_PATTERN_ORDER);
  //     print_r($feeds1[0]);
        $feeds2 = $feeds1[0];

/*      
        for($i = 0;$i < 3; $i++){
         $str = $feeds1[$i];
        $str = trim($str, '"');
        $feeds1[$i] = $str;
}
*/
  //     print_r($feeds1);
//      print_r("\n");
/*      $feeds = array(

            "http://www.littoralsociety.org/index.php?format=feed&type=rss",

            "http://www.delawareriverkeeper.org/rss.xml",

            "http://www.nj.gov/dep/newsrel/newsrel.rss",    

        );
*/

//      print_r($feeds);  

//echo $feeds[2];
//echo "\n";
//echo $feeds1[2];               
//echo $check;
        //Read each feed's items

        $entries = array();


        foreach($feeds2 as $feed) {

            $xml = simplexml_load_file($feed);

            $entries = array_merge($entries, $xml->xpath("//item"));

        }



        //Sort feed entries by pubDate
        
        usort($entries, function ($feed1, $feed2) {

            return strtotime($feed2->pubDate) - strtotime($feed1->pubDate);

        });



        ?>

<nav>
<center>
<div class="container">
        <div class="row">
        <div class="col-md-6">
<p>RSS READER</p>
<div style="height:1000px;width:500px;border:8px solid #ccc;font:16px/26px Georgia, Garamond, Serif;overflow:auto;">
        <ul><?php

        //Print all the entries
        
        foreach($entries as $entry){

            ?>

            <li><a href="<?= $entry->link ?>"><?= $entry->title ?></a> (<?= parse_url($entry->link)['host'] ?>)

            <p><?= strftime('%m/%d/%Y %I:%M %p', strtotime($entry->pubDate)) ?></p>

            <p><?= $entry->description ?></p></li>
            <?php

        }

        ?>

        </ul>
</div>
<center>
</div>
</nav>
</div>
</div>
</div>
    </body>

</html>

 <a href="#0" class="cd-top">TESTTESTTESTTEST <?php echo $this->Html->image('goTop.jpg', array('height' => '60', 'width' => '60')); ?></a>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

