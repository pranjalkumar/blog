<?php
echo "<span>Popular post</span><br>";
$popular=$db->query("select * from blog order by veiwcount desc;");
echo "<a href='blog.php?id=".$popular->results()[0]->id."' target='_blank'>". $popular->results()[0]->title."</a><br>";
echo "<a href='blog.php?id=".$popular->results()[1]->id."' target='_blank'>". $popular->results()[1]->title."</a>";

?>