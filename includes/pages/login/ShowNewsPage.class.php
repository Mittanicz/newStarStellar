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

class ShowNewsPage extends AbstractLoginPage
{
    public static $requireModule = 0;

    function __construct()
    {
        parent::__construct();
    }
    
    function show() 
    {
        global $LNG;

        $sql = "SELECT id, date, title, text, user FROM %%NEWS%% ORDER BY id DESC;";
        $newsResult = Database::get()->select($sql);

        $newsId   	= HTTP::_GP('id', 0);
        $page		= HTTP::_GP('side', 1);
        $newsSolo	= "";
        $db	= Database::get();

        $NewsCount = $db->select($sql, array(
            ':top_news' => 0
        ));

        $newsList	= array();

        foreach(Universe::availableUniverses() as $uniId)
        {
            $config = Config::get($uniId);
            $universeSelect[$uniId]	= $config->uni_name.($config->game_disable == 0 ? $LNG['uni_closed'] : '');
        }
        
        foreach ($newsResult as $newsRow)
        {
            $newsList[]	= array(
                'id'    => $newsRow['id'],
                'title' => $newsRow['title'],
                'from' 	=> sprintf($LNG['news_from'], _date($LNG['php_tdformat'], $newsRow['date']), $newsRow['user']),
                'text' 	=> makebr($newsRow['text']),
            );
        }
        
        $maxPage	= max(1, ceil(count($NewsCount) / 7));
        $page		= max(1, min($page, $maxPage));
        $sqlLimit	= (($page - 1) * 7).", ".(7 - 1);

        if($newsId == 0){
            $sql = "SELECT id, date, title, text, user FROM %%NEWS%% ORDER BY id DESC;";
            $News		= $db->select($sql, array(
                ':top_news' 	=> 0,
                ':offset'       => (($page - 1) * 7),
                ':limit'        => 7
            ));
            foreach($News as $NewsRow){
            $NewsList[]	= array(
                    'id' => $NewsRow['id'],
                    'title' => $NewsRow['title'],
                    'text' => $NewsRow['text'],
                    'from' 	=> sprintf($LNG['news_from'], _date($LNG['php_tdformat'], $NewsRow['date']), $NewsRow['user']),
                    'date' 	=> _date($LNG['php_tdformat'], $NewsRow['date'], 1),
                );		
            }
        }else{
            $sql = 'SELECT * FROM %%NEWS%% WHERE id = :id;';
            $News = $db->selectSingle($sql, array(
                ':id' => $newsId
            ));	
            $i = 1;
            $sql = "SELECT id, date, title, text, user FROM %%NEWS%% ORDER BY id DESC;";
            
            $newsSolo = array(
                'id' => $News['id'],
                'title' => $News['title'],
                'text' => $News['text'],
                'from' => sprintf($LNG['news_from'], _date($LNG['php_tdformat'], $News['date']), $News['user']),
                'date' => _date($LNG['php_tdformat'], $News['date'], 1),
            );		
        }		
        
        $this->assign(array(
            'newsList' => $newsList,
            'newsSolo' => $newsSolo,
            'universeSelect' => $universeSelect,
            'loginInfo'	=> sprintf($LNG['loginInfo'], '<a class="link" href="index.php?page=rules">'.$LNG['nav_rules'].'</a>')
        ));
        
        if($newsId == 0){
            $this->display('page.news.default.tpl');
        }else{
            $this->display('page.news.details.tpl');	
        }
    }
}