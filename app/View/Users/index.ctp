<!-- 
     index.ctp: this is the index file for users view. 
     This currently is not referenced anywhere; we discovered this file's functionality in AppController, experimenting with loginAction.
     This line is currently commented out in AppController (line 52).
     The current functionality of this file: display a table which prints out each user's ID and username.
-->
<div class="span4">
	<h3>Users</h3>
	<!-- Here's where we loop through our $posts array -->
	<table style="width: 100%;" class="table-striped table-bordered">
	<th>id</th>
	<th>Username</th>
	    <?php foreach ($users as $user): ?>
	    <tr>
		<td><?php echo $user['User']['id']; ?></td>
		<td><?php echo $user['User']['username']; ?></td>
	    </tr>
	    <?php endforeach; ?>
	</table>
	</ul>
</div>
