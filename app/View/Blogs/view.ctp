
<!-- File: /app/View/Blog/view.ctp -->
<!-- This file was made in the Fall 2014 Semester of CSC 415 (Software Engineering) for the Blogging in the Deep Group (12/1/14) -->
<!-- View post -->
<!-- This file allows us to view posts, we might use this to reference if we have to resort to cakePHP to opening our RSS feed reader likely.-->

<!-- Displays sidebar
the styling for the page is found below. For example, the #main makes sure the the pictures are not too large and the content has a margin -->
<style>
p {}
p.ex {
 border:1px;
 margin-top: 100px;
 margin-bottom: 100px;
 margin-right: 150px;
 margin-left: 80px;
}
#main{
width: 600px;
margin: 0 auto;
}


</style>
<!-- This is how a post is submitted to the database -->
<?php

if(isset($_POST['submit'])){
//First store the posted information into php variables that will put into the database
        $title = $_POST["title"];
        $body = $_POST["body"];
        $image = $_POST["image"];
        var_dump($_POST);
//Uncomment to print out the submission if needed       
//      echo $title;
//      echo $body;
//      echo $image;
//connect to the database and submit to the newsoap and the schema bloggers. Put in the title, body, and image url 
     $db = pg_connect("host=localhost port=5432 dbname=soap user=postgres password=cabect");
         $query = "INSERT INTO newsoap.bloggers (title, body, image) VALUES('$title', '$body', '$image')";
                if($query){
                echo "post added";
                $result = pg_query($db, $query);
                }else {
                echo "error";
                }
        }
?>
<!--Just the top bar at the top of the page for appearance-->
<div class="sideView">
<div id="sidebarView" class="span2">

</div>
</div>
<!--Making sure that everything is centered-->
<div id="postContainer" class="span10">

<center>
<div class="post">
</div>
</div>

<br>
<br>

<center>

<div id="main">
<p class="ex">
<!--The title and the subtitle of the journalist page-->
<p style="font-size:260%;">Welcome to TCNJ SOAP Blog Page!</p>
<br>


<p style="font-size:160%;">Featuring Article's By Real TCNJ Students</p>
<?php
//loop through all the articles and display them to the site
foreach($blogger_info as $bb){
                                                                                                                                                                                                                                                            39,1-8        Top
$string = $bb[0]['image'];
echo "<br><br><br><br><br><br>";
echo "<img src=$string>";

echo "<br>";
print_r($bb[0]['title']); echo "<br>";
echo "<hr />";
print_r($bb[0]['body']);
echo "<hr />";
}
echo "<br>";
 ?>
</p>
</center>
<!--The beginning of the submission part of the website-->
<p class="ex">
<center>
<p style="font-size:160%;">Submit Your Blog Post Today!</p>

<img src="http://farm4.staticflickr.com/3130/2836828090_67d4900ab3_o.jpg" alt="Mountain View"style="width:550px;height:250px;">

<div>

        <div>
<!--The form to submit the journalist article-->
        <form action="<?php echo $_SERVER['PHP_SELF']?>" method="post">

        <label>Title</label><input type="text"id="title" name="title" />

        <label for="body">Body:</label>
        <textarea name="body" id="body" col=50 rows=10></textarea>
        <label>Image URL</label><input type="text"id="image" name="image" />
        </select>
        <br />
        <input type="submit" name="submit" value="submit" />
<!--After the form is submitted then the information goes to the php code at the top of this document-->
        </form>
        </div>
</div>
</p>
</center>
