
<!-- Display Sidebar -->
<div class="span2">
	 <?php echo $this->element('sidebar'); ?>			<!-- creates the sidebar-->
</div>

<div class="usersForm">
<?php echo $this->Form->create('User'); ?>
    <fieldset>
        <legend><?php echo __('Add User'); ?></legend>
        <?php echo $this->Form->input('username');			// text field for username
        echo $this->Form->input('password', ['type' => 'password']);				// text field for password
        echo $this->Form->input('password confirm', ['type' => 'password']);			// text field for password confirmation
        echo $this->Form->input('role', array(				// dropdown menu for role
            'options' => array('SOAP user' => 'SOAP User', 'author' => 'Author')
        ));
    ?>
    </fieldset>
<?php echo $this->Form->end(__('Submit')); ?>			<!--	// button to submit user info;
</div>
