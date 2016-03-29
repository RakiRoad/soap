<h3>Search Results</h3>
<!--Creates a table for posts-->
<table class='table-bordered table-striped' width=100%>
	    <tr>
        <th>Id</th>
        <th>Title</th>
        <th>Created</th>
        <th>Actions</th>
    </tr>
    <!--Creates the data for the table for each post. Adds the post id, link to the post, date created, and the actions
    that can be performed on them-->
<?php foreach ($posts as $post): ?>
    <tr>
        <td>
        	<?php echo $post['Post']['id']; ?>
        </td>
        <td>
        	<?php echo $this->Html->link($post['Post']['title'],'/posts/view/'.$post['Post']['id']);?>
        </td>
        <td>
        	<?php echo $post['Post']['created']; ?>
        </td>
        <td>
        	<!--Button to edit post-->
            <button class='btn'>
            		<?php echo $this->Html->link(
            		'<i class='.'icon-pencil'.'></i>',
            		array('action' => 'edit', $post['Post']['id']),
            		array('escape' => false)
            		);?>
            </button>
            <!--Button to delete post-->
            <button class='btn btn-danger'>
	            <?php echo $this->Form->postLink(
	                '<i class='."icon-trash".'></i>',
	                array('action' => 'delete', $post['Post']['id']),
	                array('escape' => false),
	                array('confirm' => 'Are you sure?')
	                );
	            ?>
        	</button>
        </td>
    </tr>
<?php endforeach; ?> 
</table>
