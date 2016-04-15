
<html>
<style>
section{
    float:left;
    position : relative;
    left : 300px;

}

nav{
    float:right;
    position : relative;
    right: 100px;
}

#slideshow{

    margin: 80px auto;
    position: auto;
    width: 240px;
    height: 240px;
    padding: 10px;
    box-shadow: 0 0 20px rgba(0,0,0,0.4);
}

#slideshow > div{
    position: absolute;
    top: 10px;
    left: 10px;
    right: 10px;
    bottom: 10px;
}


</style>


<script src ="//ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script>
        $(function() {

            $("#slideshow > div:gt(0)").hide();

            setInterval(function()   {

                $('#slideshow > div:first')
                    .fadeOut(1000)
                    .next()
                    .fadeIn(1000)
                    .end()
                    .appendTo('#slideshow');
                }, 3000);
            });
        </script>


<head>

    <title> SOAP News Page </title>


</head>

<body>
    <div class "span8">
        <div class "details">
            <div class "style" style="text-align:center" >
                <h1 style= "font-size:300%"> SOAP Blog Home Page </h1>

    <div id= "slideshow">
        <div>
            <img src = "http://farm6.static.flickr.com/5224/5658667829_2bb7d42a9c_m.jpg">
        </div>
        <div>
            <img src = "http://farm6.static.flickr.com/5230/5638093881_a791e4f819_m.jpg">
        </div>
        <div>
            SOAP
        </div>
    </div>


<section>
    <p> This is a paragraph </p>
    <p> This is another paragraph </p>
    <img src = "http://farm4.staticflickr.com/3130/2836828090_67d4900ab3_o.jpg" alt = "Mountain View" style = "width:304px; height:228px;">
    <form>
        First Name: <br>
        <input type="text" name="firstname"><br>
        Last Name: <br>
        <input type = "text" name = "lastname"><br>
    </form>
    <textarea name= "message" rows="10" cols="30">
    </textarea>
</section>



     <?php
        //Feed URLs
        $feeds = array(
            "http://www.littoralsociety.org/index.php?format=feed&type=rss",
            "http://www.delawareriverkeeper.org/rss.xml",
            "http://www.nj.gov/dep/newsrel/newsrel.rss",    
        );
        
        //Read each feed's items
        $entries = array();
        foreach($feeds as $feed) {
            $xml = simplexml_load_file($feed);
            $entries = array_merge($entries, $xml->xpath("//item"));
        }
        
        //Sort feed entries by pubDate
        usort($entries, function ($feed1, $feed2) {
            return strtotime($feed2->pubDate) - strtotime($feed1->pubDate);
        });
        
        ?>
        
        <nav>
        <p> SOAP RSS Feed Reader </p>
        <div style="height:1000px; width:500px; border:8px solid #ccc; font:16px/26px Georgia, Garamond, Serif;overflow:auto;">
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
</nav>
</div>
</div>
</div>
</body>
</html>
