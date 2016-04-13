<?php

App::uses('AppHelper', 'View/Helper')

class FlashHelper extends AppHelper {

<?php echo $this->Flash->render() ?>

<?php echo $this->Flash->render('other') ?>

// In your Controller
$this->Flash->set('The user has been saved.', array(
    'element' => 'success'
));

// In your View: Will use great_success.ctp instead of success.ctp
<?php echo $this->Flash->render('flash', array(
    'element' => 'great_success'
));

}

