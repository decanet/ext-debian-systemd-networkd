<?php

class IndexController extends pm_Controller_Action
{
	var $tools;
	
    public function init()
    {
		parent::init();
		
		if (!pm_Session::getClient()->isAdmin()) {
            throw new pm_Exception('Permission denied');
        }
		
		$this->_accessLevel = 'admin';
		$this->view->pageTitle = pm_Locale::lmsg('pageTitle');
    }
	
	public function indexAction()
    {
        // Default action will be formAction
        $this->_forward('support');
    }
	
	
	
}
