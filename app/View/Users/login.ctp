<!-- Edited Spring 2016 - Andrew, Greg, Jon, Sean, Kim, Kevin - The Young and the Restless
     This file, displays the page reached by clicking login in the top right corner of the SOAP homepage.
     This file organizes the layout of the login page. This references UsersController's login() method.
-->

<!-- Display Sidebar -->
<div class="span2">
	 <?php echo $this->element('sidebar'); ?>				<!--this adds the sidebar-->
</div>

<!-- Display Main Forms -->
<div class="users form">
<?php echo $this->Form->create('User'); ?>
    <fieldset>
        <legend>
           <?php echo __('Please enter your username and password'); ?>		
        </legend>
        <?php echo $this->Form->input('username')?>				<!--these are text fields for username/password-->
        <?php echo $this->Form->input('password')?>
    </fieldset>
     <?php echo $this->Form->end(__('Login')); ?>				<!--login button-->
     
     <!-- this is a link to add a new account-->
    <?php echo '<a href="http://csc415-team03.tcnj.edu/cabect/SOAP/index.php/users/add">Click here to create a new account!</a>'; ?>
</div>

<!-- We formerly put code from add.ctp on the bottom of this page; instead, access add page by replacing 'login' with 'add' in the URL-->
