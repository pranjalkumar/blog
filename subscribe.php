<?php
require_once 'core/init.php';
if(Input::exists('post')) {
    if (Token::check(Input::get('token'))) {
        $mail = Input::get('email');
        $validate = new Validate();
        $validation = $validate->check($_POST, array(
            'email' => array(
                'name' => 'email',
                'required' => 'true',
                'min' => 4,
                'max' => 20
            )
        ));
        if ($validate->passed()) {
            try {
                $check = $db->get('subscribe', array('email', '=', $mail));
                $total = $check->count();
                if ($total < 1) {
                    $subscribe = $db->insert('subscribe', array(
                        'email' => Input::get('email'),
                    ));
                } else {
                    echo "<script>alert('You are already subscribed');</script>";
                }
            } catch (Exception $e) {
                echo $e->getMessage();
            }
        } else {
            foreach ($validate->errors() as $error) {
                echo $error . "<br>";
            }
        }
    }
}
?>
<form action="<?php echo $_SERVER['REQUEST_URI'];?>" method="post">
    <label for="email">Subuscribe for Newsletter</label>
    <input type="email" id="email" name="email" placeholder="Enter your email">
    <input type="hidden" name="token" value="<?php echo Token::generate(); ?>">
    <button type="submit">Subscribe</button>
</form>