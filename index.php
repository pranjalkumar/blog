<?php


require_once 'core/init.php';

if(Session::exists('home')) {
    echo '<p>' . Session::flash('home'). '</p>';
}

$user = new User(); //Current

if($user->isLoggedIn()) {
?>

    <p>Hello, <a href="profile.php?user=<?php echo escape($user->data()->username);?>"><?php echo escape($user->data()->username); ?></p>

    <ul>
        <li><a href="update.php">Update Profile</a></li>
        <li><a href="changepassword.php">Change Password</a></li>
        <li><a href="logout.php">Log out</a></li>
    </ul>
<?php
//
//    if($user->hasPermission('admin')) {
//        echo '<p>You are a Administrator!</p>';
//    }

} else {
    echo '<p>You need to <a href="login.php">login</a> or <a href="register.php">register.</a> to post the blog</p>';
}
?>
<?php
$db=DB::getInstance();
$data=$db->query("select * from blog;");
$count=$data->count();

$i=0;

while($i<$count) {
    $id=$data->results()[$i]->id;    ?>
    <h1>
        <a href="blog.php?id=<?php echo $id;?>" target="_blank"><?php echo $data->results()[$i]->title;?></a>
    </h1>
    <span><?php echo escape($data->results()[$i]->date);?></span>
    <span><?php echo escape($data->results()[$i]->author);?></span>
    <p><?php $text=$data->results()[$i]->body; echo substr($text,0,strpos($text,'.',500));?></p>
    <?php echo '<a href="blog.php?id='.$id.'" target="_blank">Read More</a>';?>
    <?php
$i=$i+1;}
    ?>
<?php
include_once 'subscribe.php';

?>
<a href="blogpost.php">Post your blog</a>