<?php
    $myPDO = new PDO('sqlite:C:\SQLite\students');
	$result = $myPDO->query("SELECT * FROM students");
	foreach($result as $row)
    {
        print $row['stu_name'] . "\n";
    }
?>