<?php

if (Input::exists('post')) {
             echo "yes";
            $validate = new Validate();
            $validation = $validate->check($_POST, array(
                'comment' => array('required' => true,
                    'max' => 500)
            ));
            if($validate->passed()) {
                try{
                $comment = Input::get('comment');
                $db = DB::getInstance();
                $name = $user->data()->username;
                $date = date("Y/m/d");
                $blogid = $id;

                $commentpost = $db->insert('comment', array(
                    'text'=>$comment,
                    'user'=>$name,
                    'date'=>$date,
                    'blogid'=>$blogid
                ));
            }catch (Exception $e)
                {die($e->getMessage());}

              Redirect::to('blog.php?id='.$id);
            }

            else {
                foreach ($validate->errors() as $error) {
                    echo $error . "<br>";
                }

            }
        }


?>
<form action="<?php echo $_SERVER['REQUEST_URI']?>" method="post">
    <lable for="comment">
       Commnent :
    </lable>
    <textarea id="comment" name="comment" rows="10" cols="70" placeholder="Enter your comment here">

    </textarea>
     <button type="submit">Post your comment</button>
</form>