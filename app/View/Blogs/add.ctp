<!-- File: /app/View/Posts/add.ctp -->
<!-- Submit a Post -->

<!-- We could look at what the group here did and maybe take some ideas from them for our blog idea. We might not allow users
to post blogs but we'll display advocacy groups posts and maybe if we have time a system to submit links to the RSS feed reader -->

<!-- Display Sidebar -->
<div class="span2">
	
	 <?php echo $this->element('sidebar'); ?>
</div>

<!-- Blog Form -->
<div class="span9">
    <!-- link to Return to Blog Home page -->
    <a title="Return to Blog" id="returnLink" href="/SOAP/index.php/blogs">⬅ Return to Blog</a>
    <?php echo $this->Session->flash();?>	
    
    <br>
    <br>
    
    <h2>Add Post</h2>
	 
    <!-- Create Blog form and display text field for title -->   
    <?php	
        echo $this->Form->create('Blog', array('action' => 'submit' )); // submit calls from the blog controller function
        echo $this->Form->input('title', array('id'=>'addTitle','maxlength'=>'64')); 
     ?>

    <h3 id="addBody">Body</h3>      
    
    <!-- Adds text field for body using CKEditor and creates submit button --> 
    <?php       
	echo $this->Form->textarea('body',array('class'=>'ckeditor'));
        echo "<br>";
 	echo $this->Form->end('Submit Post');
     ?>

</div>

