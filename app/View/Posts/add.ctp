<!-- File: /app/View/Posts/add.ctp -->

<div class="span2">
    <!-- creates sidebar --> 
    <?php echo $this->element('sidebar'); ?>
</div>
<div class="span9">
<?php echo $this->Html->link('Back to posts', array('controller' => 'posts'));    //links back to posts
    <br>
    <br>
    <h1>Add Post</h1>
    <?php>
        echo $this->Form->create('Post'); // creates a form to post in
        echo $this->Form->input('title'); // allows users to input the value for 'title'
        echo $this->Form->input('body', array('rows' => '3')); // three rows for the body/ layout of the form 
        echo $this->Form->end('Save Post'); // allows user to save the form/ post
    ?>
</div>
