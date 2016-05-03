
{
    "NAME": "<?php echo addslashes($facility_info[0][0]['facility_name']); ?>",
    "PARENT": "<?php echo addslashes($facility_info[0][0]['owner_name']); ?>",
    "DANGER": "<?php echo addslashes($facility_info[0][0]['dangerous_state']); ?>",
    "BROWN": "<?php echo addslashes($facility_info[0][0]['is_brownfield']); ?>",
    "ADDR": "<?php echo addslashes($facility_info[0][0]['location_id']); ?>",
    "COUNTY": "<?php echo addslashes($facility_info[0][0]['county']); ?>",
    "MUN": "<?php echo ($facility_info[0][0]['municipality'] == null ? 'N/A' : addslashes($facility_info[0][0]['municipality'])); ?>",
    "LAT": "<?php echo ($facility_info[0][0]['latitude'] == null ? 'Latitude: N/A' : 'Latitude: ' . $facility_info[0][0]['latitude']); ?>,
    "LNG": "<?php echo ($facility_info[0][0]['longitude'] == null ? 'Longitude: N/A' : 'Longitude: ' . $facility_info[0][0]['longitude']); ?>,
    "X_COORD": "<?php echo ($facility_info[0][0]['x_coor'] == null ? 'N/A' : floatval($facility_info[0][0]['x_coor'])); ?>",
    "Y_COORD": "<?php echo ($facility_info[0][0]['y_coor'] == null ? 'N/A' : floatval($facility_info[0][0]['y_coor'])); ?>",
    "CHEMICAL": [
       <?php for ($x = 0; $x < count($chem_info); $x++) 
        {
            echo '{ "name" : "' . addcslashes($chem_info[$x][0]["chemical_name"], '"\\/') . '", "id" : "' . $chem_info[$x][0]["chemical_id"] . '", "totalAmt" : "' . addslashes($chem_info[$x][0]["total_amount"]) . '", "fugAmt" : "' . addslashes($chem_info[$x][0]["fugair_amount"]) . '", "waterAmt" : "' . addslashes($chem_info[$x][0]["water_amount"]) . '", "airAmt" : "' . addslashes($chem_info[$x][0]["stackair_amount"]) . '" }';
            
            echo ($x < count($chem_info) - 1 ? ',' : '');
        }
        ?>
    ]
}