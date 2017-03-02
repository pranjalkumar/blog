<?php
require_once 'core/init.php';

if(Input::exists('get'))
{   $user= new User();
    $id=Input::get('id');
    $db=DB::getInstance();
    $data=$db->query("select * from blog where id=".$id.";");
    $count=$data->count();

    $i=0;
    while($i<$count) {
        include_once 'blogveiw.php';
        $i=$i+1;}
            if($user->isLoggedIn())
        {
            include_once 'commentpost.php';
        }
        else{
            echo "You need to log in to post comment";
        }
        $comment=$db->query("select * from comment where blogid=".$id.";");
        $commentcount=$comment->count();
        $j=0;

        if($commentcount<1)
        {
            echo "<p>Sorry, no comment to display!</p>";
        }
        else
        {   echo $commentcount." commnent<br>";
            while($j<$commentcount)
            {   echo "<img src=images/".$comment->results()[$j]->imgurl." alt= profile pic height=30 width=30>";
                echo "<p>".$comment->results()[$j]->user."</p><p>".$comment->results()[$j]->date."</p>";

                echo "<p>".$comment->results()[$j]->text."</p>";
                $j++;
            }

        }

    include_once 'subscribe.php';
    include_once 'veiwcount.php';
    include_once 'popularpost.php';


}
else
{
    echo '<script>window.location.href="index.php"</script>';
}



?>