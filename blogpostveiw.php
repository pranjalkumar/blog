<?php
require_once 'core/init.php';
?>


<form action="<?php echo $_SERVER['REQUEST_URI']?>" method='post'>
    <label for='title'> Enter the Title</label>
    <input type='text' id="title" name='title' placeholder='Title of your blog'>
    <label for='body'> Enter the blog</label>
    <textarea name='body' id="body" rows='100' cols='100' placeholder='Enter your blog here'>
        </textarea>
    <input type="hidden" name="token" value="<?php echo Token::generate(); ?>">
    <button type="submit">Post My Blog</button>
</form>