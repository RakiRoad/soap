<!-- Edited Spring 2016 - Andrew, Greg, Jon, Sean, Kim, Kevin - The Young and the Restless
     This file, displays the page reached by clicking login in the top right corner of the SOAP homepage.
     This file organizes the layout of the login page.
-->

<!-- Display Sidebar -->
<div class="span2">
	 <?php echo $this->element('sidebar'); ?>
</div>

<!-- Display Main Forms -->
<div class="users form">
<?php echo $this->Form->create('User'); ?>
    <fieldset>
        <legend>
           <?php echo __('Please enter your username and password'); ?>
        </legend>
        <?php echo $this->Form->input('username'); ?>
        <?php echo $this->Form->input('password'); ?>
    </fieldset>
     <?php echo $this->Form->end(__('Login')); ?>
</div>

<!-- adding a new div class to create users.-->
<!-- <div class="create user form">
<!--added this button, which will allow for the creation of new users-->
<!--		//added slashes
<?//php echo $this->Form->end(__('Create User')); ?>   //added slashes
<fieldset>
		        <?//php echo $this->Form->input('username'); ?>	  //added slashes
</fieldset>
</div>
-->

<!-- copied this from add.ctp-->
<div class="users form">
<?php echo $this->Form->create('User'); ?>
    <fieldset>
        <legend><?php echo __('Add User'); ?></legend>
        <?php echo $this->Form->input('new username');
        echo $this->Form->input('new password');
        echo $this->Form->input('role', array(
            'options' => array('admin' => 'Admin', 'author' => 'Author')
        ));
    ?>
    </fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>

