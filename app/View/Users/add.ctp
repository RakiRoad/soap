<!-- //Edited Spring 2016 - Andrew, Greg, Jon, Sean, Kim, Kevin - The Young and the Reckless.
     // add.ctp: this file creates the form used to add new users, utilizing the add method in UsersController.php
-->
<!-- Display Sidebar -->
<div class="span2">
	 <?php echo $this->element('sidebar'); ?>			<!-- creates the sidebar-->
</div>

<div class="users form">
<?php echo $this->Form->create('User'); ?>
    <fieldset>
        <legend><?php echo __('Add User'); ?></legend>
        <?php echo $this->Form->input('username');			// text field for username
        echo $this->Form->input('password', ['type' => 'password']);				// text field for password
        echo $this->Form->input('password confirm', ['type' => 'password']);			// text field for password confirmation
        echo $this->Form->input('role', array(				// dropdown menu for role
            'options' => array('admin' => 'Admin', 'author' => 'Author', 'SOAP user' => 'SOAP User')
        ));
    ?>
    </fieldset>
<?php echo $this->Form->end(__('Submit')); ?>			<!--	// button to submit user info;
</div>
