<!-- File: /app/View/Posts/edit.ctp -->

<h1>Edit Post</h1>
<?php
    echo $this->Form->create('Post', array('action' => 'edit')); //allows user to open old edited post
    echo $this->Form->input('title'); //input title
    echo $this->Form->input('body', array('rows' => '3')); //three rows 
    echo $this->Form->input('id', array('type' => 'hidden')); //hidden array
    echo $this->Form->end('Save Post');  //save the edited post 
?> 
