<!--This file is no longer used, since filtering is now done through javascript. But we will keep it here
    in case a future group wants to use it-->
<?php 
	foreach($facilities as $facility):
	
		$imgType = "";
		
		switch ($facility[0]['dangerous_state']) {
			case '1':
				$imgType = "GreenFactoryIcon.png"; //switches to green factory icon
				break;
			case '2':
				$imgType = "YellowFactoryIcon.png"; // switches to yellow factory icon
				break;
			case '3':
				$imgType = "OrangeFactoryIcon.png"; // switches to orange factory icon
				break;
			case '4':
				$imgType = "Red2FactoryIcon.png"; //switches to red factory icon
				break;
			case '5':
				$imgType = "RedFactoryIcon.png"; //switches to red factory icon 
				break;
		}
		
		if($facility[0]['x_coor'] != NULL && $facility[0]['y_coor'] != NULL):
?>
	<li id="<?php echo $facility[0]['id']; ?>" class="facility-list-item"><img src="/SOAP/app/webroot/img/map/<?php echo $imgType; ?>" class="dg-level"><?php echo $facility[0]['facility_name']; ?></li>
<?php endif;
			endforeach;	?>
