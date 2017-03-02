<h1>
    <?php echo $data->results()[$i]->title;?>
</h1>
<span><?php echo escape($data->results()[$i]->date);?></span>
<span><?php echo escape($data->results()[$i]->author);?></span>
<p><?php $text=$data->results()[$i]->body; echo substr($text,0);?></p>