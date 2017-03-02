<?php

$veiw=$db->query("update blog set veiwcount=veiwcount+1 where id=".$id);
$veiwcount=$db->query("select * from blog where id=".$id.";");
echo $veiwcount->results()[0]->veiwcount." views <br>";
?>