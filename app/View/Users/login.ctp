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
<div class="create user form">
<!--added this button, which will allow for the creation of new users-->
<?php echo $this->Form->end(__('Create User')); ?>
</div>
