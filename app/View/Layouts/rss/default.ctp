<?php
/**
 *
 * PHP 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright 2005-2011, Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2005-2011, Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       Cake.View.Layouts
 * @since         CakePHP(tm) v 0.10.0.1076
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */

$cakeDescription = __d('cake_dev', 'CakePHP: the rapid development php framework');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<?php echo $this->Html->charset(); ?>
	<title>
		TCNJ SOAP | <?php echo $title_for_layout; ?> //Label of site
	</title>
	<?php
		echo $this->Html->meta('icon');
		echo $this->Html->css('bootstrap.min');
		echo $this->fetch('meta');
		echo $this->fetch('css');
		echo $this->fetch('script');
	?>
    <style type='text/css'>
        html, body {
            height: 100%; //height of body element
        }
        footer {
            color: black; //color of footer
            background: #D9EDF7; //background color
            padding: 17px 0 18px 0; //change padding attribute of footer
            <!--border-top: 2px solid #3A87AD;-->
        }
        footer a {
        }
        footer a:hover {
            color: #999; //add hover event, when footer is hovered over color changes
        }
        .wrapper {
            min-height: 95%;// set min height to 95% of height
            height: auto !important; 
            height: 100%; //change height to 100%
            margin: 0 auto -63px;
        }
        .push {
            height: 63px; //change height to 63 pixels
        }
        .wrapper > .container {
            padding-top: 60px; // change padding to 60 pixels
        }
        ul.footer {
			list-style-type: none;
			float: left;
		}
		ul.footer li {
			list-style-type: none; //set no list-style-type
			float: left; 
			padding-right: 16px; //change padding on right to 16 pixels
		}
    </style>
    <style type='text/css'>
    .social {
        font-family: 'JustVector'; // choose justvector of font family 
    }
    </style>

	<script language='javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js'></script> 
	
</head>
<body>
	
	<?php echo $this->element('nav'); ?>
	<div class="wrapper">
			<div class"row-fluid" style="">
			     <?php echo $this->Session->flash(); ?>
			     <?php echo $this->fetch('content'); ?>
			</div>
	</div>
    <?php echo $this->element('footer'); ?>
</body>
<link rel="stylesheet" href="<?=$this->webroot?>css/stylesheet.css" type="text/css" charset="utf-8" />
<script language='javascript' src='http://twitter.github.com/bootstrap/assets/js/bootstrap-dropdown.js'></script>
<script language='javascript' src='http://twitter.github.com/bootstrap/assets/js/bootstrap-collapse.js'></script>
<script language='javascript' src='http://twitter.github.com/bootstrap/assets/js/bootstrap-modal.js'></script>
</html>
