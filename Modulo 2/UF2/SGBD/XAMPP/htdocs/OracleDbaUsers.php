<html>
    <body>
        <h1>Consulta a "dba_users"</h1>
        <table border="1">
            <tr>
                <th>user_id</th>
                <th>user_name</th>
			</tr>
			<?php
				try {
					$conn = oci_connect('SYSTEM', 'Oracle$2024', 'ROBERTO');
					if (!$conn) {
						$e = oci_error();
						trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
					}
					// Prepare the statement
					$stid = oci_parse($conn, 'SELECT owner, table_name FROM all_tables ORDER BY 2');
					if (!$stid) {
						$e = oci_error($conn);
						trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
					}
					
					// Perform the logic of the query
					$r = oci_execute($stid);
					if (!$r) {
						$e = oci_error($stid);
						trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
					}
					
					// Fetch the results of the query
					while ($row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS)) {
						print "<tr>\n";
						foreach ($row as $item) {
							print "    <td>" . ($item !== null ? htmlentities($item, ENT_QUOTES) : "&nbsp;") . "</td>\n";
						}
						print "</tr>\n";
					}
					oci_free_statement($stid);
					oci_close($conn);
					} catch(PDOException $e) {
					echo "Error: " . $e->getMessage();
				}
			?>
		</table>
	</body>
</html> 