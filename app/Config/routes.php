<?php
/**
 * Routes configuration
 *
 * In this file, you set up routes to your controllers and their actions.
 * Routes are very important mechanism that allows you to freely connect
 * different urls to chosen controllers and their actions (functions).
 *
 * PHP 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Config
 * @since         CakePHP(tm) v 0.2.9
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */
/**
 * Here, we are connecting '/' (base path) to controller called 'Pages',
 * its action called 'display', and we pass a param to select the view file
 * to use (in this case, /app/View/Pages/home.ctp)...
 */
	Router::connect('/politicians', array('controller' => 'politicians', 'action' => 'index'));
	Router::connect('/posts', array('controller' => 'posts', 'action' => 'index'));
	Router::connect('/SOAP', array('controller' => 'pages', 'action' => 'display', 'main'));
	Router::connect('/brownfields', array('controller' => 'brownfields', 'action' => 'index'));
	Router::connect('/chemicals', array('controller' => 'chemicals', 'action' => 'index'));
	Router::connect('/facilities', array('controller' => 'facilities', 'action' => 'index'));
	Router::connect('/uploads', array('controller' => 'uploads', 'action' => 'upload'));
	Router::connect('/map', array('controller' => 'map', 'action' => 'index'));
	/* This following line *fowards* the SOAP/ page to SOAP/index.php, reducing confusion for the end user - Kevin Bohinski - 12/1/14 */
	Router::connect('/', array('controller' => 'pages', 'action' => 'display', 'main'));
/**
 * ...and connect the rest of 'Pages' controller's urls.
 */
	Router::connect('/pages/*', array('controller' => 'pages', 'action' => 'display'));
	Router::connect('/blogs/', array('controller' => 'blogs', 'action' => 'index'));
/**
 * Load all plugin routes. See the CakePlugin documentation on
 * how to customize the loading of plugin routes.
 */
	CakePlugin::routes();

/**
 * Load the CakePHP default routes. Only remove this if you do not want to use
 * the built-in default routes.
 */
	require CAKE . 'Config' . DS . 'routes.php';
