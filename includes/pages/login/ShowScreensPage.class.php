<?php

/*
 * ╔══╗╔══╗╔╗──╔╗╔═══╗╔══╗╔╗─╔╗╔╗╔╗──╔╗╔══╗╔══╗╔══╗
 * ║╔═╝║╔╗║║║──║║║╔═╗║║╔╗║║╚═╝║║║║║─╔╝║╚═╗║║╔═╝╚═╗║
 * ║║──║║║║║╚╗╔╝║║╚═╝║║╚╝║║╔╗─║║╚╝║─╚╗║╔═╝║║╚═╗──║║
 * ║║──║║║║║╔╗╔╗║║╔══╝║╔╗║║║╚╗║╚═╗║──║║╚═╗║║╔╗║──║║
 * ║╚═╗║╚╝║║║╚╝║║║║───║║║║║║─║║─╔╝║──║║╔═╝║║╚╝║──║║
 * ╚══╝╚══╝╚╝──╚╝╚╝───╚╝╚╝╚╝─╚╝─╚═╝──╚╝╚══╝╚══╝──╚╝
 *
 * @author Tsvira Yaroslav <https://github.com/Yaro2709>
 * @info ***
 * @link https://github.com/Yaro2709/New-Star
 * @Basis 2Moons: XG-Project v2.8.0
 * @Basis New-Star: 2Moons v1.8.0
 */

class ShowScreensPage extends AbstractLoginPage
{
	public static $requireModule = 0;

	function __construct() 
	{
		parent::__construct();
	}
	
	function show() 
	{
		global $LNG;

		$screenshots	= array();
		$directoryIterator = new DirectoryIterator('./assets/images/login/screens/');

		$universeSelect	= array();
		
		foreach(Universe::availableUniverses() as $uniId)
		{
			$config = Config::get($uniId);
			$universeSelect[$uniId]	= $config->uni_name.($config->game_disable == 0 ? $LNG['uni_closed'] : '');
		}
		
        foreach ($directoryIterator as $fileInfo)
		{
			/** @var $fileInfo DirectoryIterator */
			if (!$fileInfo->isFile())
			{
				continue;
            }			
			
			$thumbnail = './assets/images/login/screens/'.$fileInfo->getFilename();
			if(file_exists('./assets/images/login/screens/thumbnails/'.$fileInfo->getFilename()))
			{
				$thumbnail = './assets/images/login/screens/thumbnails/'.$fileInfo->getFilename();
			}
			
			$screenshots[]	= array(
				'path' 		=> './assets/images/login/screens/'.$fileInfo->getFilename(),
				'thumbnail' => $thumbnail,
			);
		}
		
		$this->assign(array(
			'screenshots' => $screenshots,
			'universeSelect'		=> $universeSelect,
			'loginInfo'	  => sprintf($LNG['loginInfo'], '<a href="index.php?page=rules">'.$LNG['nav_rules'].'</a>')
		));

		$this->display('page.screens.default.tpl');
	}
}
