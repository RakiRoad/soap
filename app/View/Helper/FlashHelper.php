<?php
/*
  This file was missing previously; the setFlash method in UsersController was previously throwing an error.
  Accessed from the following link: https://github.com/dereuromark/cakephp-tools/blob/master/src/View/Helper/FlashHelper.php
  */
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
	// Get the messages from the session
		$messages = (array)$this->request->session()->read('FlashMessage');
		$cMessages = (array)Configure::read('FlashMessage');
		if (!empty($cMessages)) {
			$messages = (array)Hash::merge($messages, $cMessages);
		}
		$html = '';
		if (!empty($messages)) {
			$html = '<div class="flash-messages">';
			if ($types) {
				foreach ($types as $type) {
					// Add a div for each message using the type as the class.
					foreach ($messages as $messageType => $msgs) {
						if ($messageType !== $type) {
							continue;
						}
						foreach ((array)$msgs as $msg) {
							$html .= $this->_message($msg, $messageType);
						}
					}
				}
			} else {
				foreach ($messages as $messageType => $msgs) {
					foreach ((array)$msgs as $msg) {
						$html .= $this->_message($msg, $messageType);
					}
				}
			}
			$html .= '</div>';
			if ($types) {
				foreach ($types as $type) {
					$this->request->session()->delete('FlashMessage.' . $type);
					Configure::delete('FlashMessage.' . $type);
				}
			} else {
				$this->request->session()->delete('FlashMessage');
				Configure::delete('FlashMessage');
			}
		}
		return $html;
	}


}
