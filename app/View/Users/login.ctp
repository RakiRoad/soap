<!-- Display Sidebar -->
<div class="span2">
	
	 <?php echo $this->element('sidebar'); ?>
</div>

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
<!--added this button-->
<?php echo $this->Form->end(__('Create User')); ?>
<?php echo $this->Form->end(__('Click here for Mental Breakdown')); ?>
</div>
