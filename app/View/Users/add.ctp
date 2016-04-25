<!-- Display Sidebar -->
<div class="span2">
	 <?php echo $this->element('sidebar'); ?>
</div>

<div class="users form">
<?php echo $this->Form->create('User'); ?>
    <fieldset>
        <legend><?php echo __('Add User'); ?></legend>
        <?php echo $this->Form->input('username');
        echo $this->Form->input('password');
        echo $this->Form->input('role', array(
            'options' => array('admin' => 'Admin', 'author' => 'Author')
        ));
    ?>
    </fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>

<!--this code is from login.txt; we need to implement some type of similar intake method?
<div class="usersform row-fluid">
			<!--<div class="span6">
				LOL
				<div class="input text required">
					<label style="color:#013435;" for="UserUsername">Username</label>
					<input name="data[User][username]" maxlength="50" type="text" id="UserUsername"/>
				</div>
				<div class="input password required">
					<label style="color:#013435;" for="UserPassword">Password</label>
					<input name="data[User][password]" type="password" id="UserPassword"/>
					//USE THIS METHOD TO INTAKE DATA^^^ NEED TO RENAME [USER][PASSWORD] TO [ROW][COLUMN] OR
					//SOMETHING SIMILAR TO THAT. THESE REPRESENT INDEX VALUES.
					//THIS NEEDS TO BE IMPLEMENTED IN OUR LOGIN.CTP FILE
					
				</div>
				<!--Submit button for the login page-->
				<!--<?//php 
					  //echo $this->Form->button('Log In', array('type' => 'submit', 'class' => 'btn btn-primary'));
					  //    //echo $this->Form->end();
				?>
				
				//IMPLEMENT THIS ON CLICK METHOD IN OUR VIEW
				<button type="button" class="btn" onClick="location.href='http://tardis.tcnj.edu/cabect/SOAP/index.php/users/add'">Register</button>
			</div>-->
