<?php
/*namespace Tools\View\Helper;
use Cake\Core\Configure;
use Cake\Utility\Hash;
use Cake\View\Helper;
use Tools\Controller\Component\FlashComponent;
/**
 * Flash helper
 *
 * @author Mark Scherer
 */
class FlashHelper extends AppHelper {
	/**
	 * Display all flash messages.
	 *
	 * @param array $types Types to output. Defaults to all if none are specified.
	 * @return string HTML
	 * @deprecated Use render() instead
	 */
	public function flash(array $types = []) {
		return $this->render($types);
	}
	public function render(array $types = []){
		echo $this->Flash->render($types);
	}


}
