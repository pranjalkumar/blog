<?php
require_once 'core/init.php';
$user= new User();
if(!$user->isLoggedIn())
{   Redirect::to('login.php');

}
else {

    echo "<h3>Post your blog here</h3>";
    if (Input::exists('post')) {
        if (Token::check(Input::get('token'))) {
            $validate = new Validate();
            $validation = $validate->check($_POST, array(
                'title' => array('required' => true,
                    'min' => 7,
                    'max' => 50),
                'body' => array('required' => true,
                    'min' => 100,
                    'max' => 10000)
            ));
            if ($validate->passed()) {
                try {
                    $db = DB::getInstance();

                    $name = $user->data()->username;
                    $date = date("Y/m/d");
                    $blog = $db->insert('blog', array(
                        'title' => Input::get('title'),
                        'author' => $name,
                        'date' => $date,
                        'body' => Input::get('body')

                    ));
                } catch (Exception $e) {
                    die($e->getMessage());
                }
                echo "<script>alert('You have successfully posted your blog');</script>";
                Redirect::to('index.php');

            } else {
                foreach ($validate->errors() as $error) {
                    echo $error . "<br>";
                }

            }
        }
    }
        require_once 'blogpostveiw.php';

}

?>