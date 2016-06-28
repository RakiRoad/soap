

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
                    height: 400px;
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

.hilight h2{
    font-family: Helvetica, Verdana;
    color: #FFF;
    z-index: 200;
}

.promo {
    position: relative;
}
.promo img {
    z-index: 1;
}

.hilight {
margin: 80px auto;
 background-color: rgba(0,0,0,0.65);
 position: absolute;
 height: 100px;
 width: 800px;
font-family: Verdana, Geneva, sans-serif;
 color: #FFF;
 bottom: 0px;
left:270px;
top:285px;
 z-index: 1;
}
#twitter-widget-0{
        position: absolute !important;
        bottom: 40px !important;
        left: 0px !important;
        width: 150px !important;
}


 #hilight > div {
                    position: absolute;
                    top: 10px;
                    left: 10px;
                    right: 10px;
                    bottom: 10px;
                }

</style>


        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
     <!-- Function that sets the interval of time that a image in the 
        slideshow stays, fades in, and fades out.  -->
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
      <h1 style="font-size:300%"> SOAP News Page   </h1>

<!-- The slide show on the blog page. Contains a list of images that have
     links to relevant external articles. -->
<div id="slideshow">
           <div>
                <a href="http://www.habitat.org/magazine/article/anniversary-gifts" target="_blank" >
                <img src="http://artandarts.com/images/photos/trees/pear_tree_11_23_07/Pear_Tree_Photo.JPG" width=100% height=100%>        </div>
                </a>
           <div>
 <a href="http://www.habitat.org/magazine/article/who-does-it-take-build-habitat-house" target="_blank" >
             <img src="https://11111-presscdn-0-2-pagely.netdna-ssl.com/wp-content/uploads/2015/09/Bear-Cubs-Playing-3.jpg" width=100% height=100%>
                </a>
        </div>
        <div>
          <img src="https://newevolutiondesigns.com/images/freebies/nature-hd-background-9.jpg" width=100% height=100%>
        </div>
        <div>
          <img src="http://www.freedomwallpaper.com/nature-wallpaper/nature-hd-wallpapers-road.jpg" width=100% height=100%>
        </div>
        <div>
          <img src="https://newevolutiondesigns.com/images/freebies/nature-hd-background-20.jpg" width=100% height=100%>
        </div>           
        <div>
<a href="http://www.habitat.org/magazine/article/everyone-deserves-decent-place-live" target="_blank">
         <img src="http://wac.450f.edgecastcdn.net/80450F/nj1015.com/files/2012/06/hackelbarney1.jpg" width=100% height=100%>
                </a>
         </div>
        </div>

<!--div class="hilight">
             <h2>The Solution to Pollution</h2>
             <p>New research indicates that we can fight pollution</p>
         </div-->

<?php

 /*             

   Allows a user to input an RSS feed into the database.  If the input is 
   a valid RSS feed then it will be submitted into the database. Empty string
   values are still accepted at the moment but soon special permissions will
   be added to submit a feed.

 */
         if(isset($_POST['submit'])){



        if($_POST['submit']){
        $rss = $_POST["feed"];
                $dbconn = pg_connect("host=localhost port= 5432 dbname=soap user=postgres password=cabect") //connecting to pg_database
                or die('Count not connect: ' . pg_last_error());

                // Inserts input into the database in the 'feeds' row 
                $query  = "INSERT INTO newsoap.feeds (feed) VALUES('$rss')";

                if($query)
                    echo "RSS feed added to database";
                else
                    echo "RSS feed not valid";


              $result = pg_query($dbconn, $query);

                var_dump($result); // dump $result

             pg_close($dbconn); //closes connection to pg_database
                }
          }
?>

<!-- Displays a form for user input of an RSS feed -->
<form action= '<?php echo $_SERVER ['PHP_SELF']?>' method = "post">
  RSS Feed: <input type = "text" name = "feed" />
    <input type = "submit" name="submit" value="submit"  />

</form>

<section>
<!-- End SOAP Sidebar Code-->

        <!-- This div displays the twitter sidebar on the right, this code was generated by the twitter -->
<a class="twitter-timeline" href="https://twitter.com/Habitat_Trenton"
data-widget-id="726952338825592833">Tweets by @Habitat_Trenton</a>
<script>!function(d,s,id){var
js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
        <!-- End Twitter Sidebar Code-->
</section>






<?php

 /*

   This section takes an array containing the table of  feed strings from 
   the database. The array then gets imploded into one long string with 
   each index of the original array separated by commas. The string is then
   passed through a regular expression function that strips out unnecessary 
   characters and recretates an array of feed values that can be read by the
    parser. The feed values are then displayed on the feed reader on the blog 
   page. 

 */
        // make array to hold feed string from database
        $feeds = array();

        //grab $feed_info one string of all DB feeds stored
        foreach($feed_info as $f){

        // store in feeds varialbe
        $feeds = $f;

}
        // implode based on commas
        $feed_arr = implode(',',$feeds[0]);


        //keep the necessary items and remove the extra characters from the feed
        preg_match_all('/\b(?:(?:https?):\/\/|www\.)[-A-Z0-9+&@#\/%?=~_|$!:,.;]*[-A-Z0-9+&@#\/%=~_|$]/ix', $feed_arr, $feeds1, PREG_PATTERN_ORDER);
        $feeds2 = $feeds1[0]; //new array with feeds
                //Read each feed's items

        $entries = array();

        //pass into parser to parse feeds and merge into entries
        foreach($feeds2 as $feed) {

            $xml = simplexml_load_file($feed);

            $entries = array_merge($entries, $xml->xpath("//item"));

        }



        //Sort feed entries by pubDate

        usort($entries, function ($feed1, $feed2) {

            return strtotime($feed2->pubDate) - strtotime($feed1->pubDate);


        });



        ?>


<!-- A button containing a link to a survey monkey page for a user to submit
     a blog page or RSS feed. A second button contains a link to a page of 
     articles submitted by TCNJ students -->
<div>
        <a href="https://www.surveymonkey.com/r/W58T82D" target="_blank" >
        <button style="color:black; position:center;">Click to submit  your blog and RSS feed!</button>
</a>
<a href="http://csc415-team02.tcnj.edu/cabect/SOAP/index.php/blogs/View" target="_blank" >
        <button style="color:black; position:center;">Read articles by TCNJ authors.</button>
</a>
</div>
<br>
<br>
<center>

<div class="container">
        <!--div class="row"-->
        <!--div class="col-md-6"-->
<p style="font-size: 300%" >RSS READER</p>
<div style="height:600px;width:900px;border:10px solid #f2f3ec; font:16px/26px Georgia, Garamond, Serif;overflow:auto;">

        <ul><?php

        //Print all the entries within the feeds database

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
</div>
</div>
</div>
    </body>

</html>

 <a href="#0" class="cd-top">TESTTESTTESTTEST <?php echo $this->Html->image('goTop.jpg', array('height' => '60', 'width' => '60')); ?></a>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                                          


