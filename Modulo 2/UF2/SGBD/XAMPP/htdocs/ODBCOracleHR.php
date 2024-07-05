<?php
    $user = "HR"; 
    $password = "HR";
    $dsn = "Oracle21c"; //Replace with the exact name of your Oracle OBDC driver
	
    $ODBCConnection = odbc_connect($dsn, $user, $password);
    
    if ($ODBCConnection) {
        echo "Connection established.";
		} else {
        echo "Connection failed: " . odbc_errormsg();
	}
	$SQLQuery = "SELECT * FROM HR.regions";
	$RecordSet = odbc_exec($ODBCConnection, $SQLQuery);
	$result = odbc_result_all($RecordSet, "border=1");  
	odbc_close($ODBCConnection); 
?> 