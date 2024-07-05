<html>
	<body>
		<h1>Datos de los estudiantes</h1>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>Nombre</th>
			</tr>
			<?php
				try{
					$myPDO = new PDO('sqlite:c:\sqlite\students');
					$result = $myPDO->query("SELECT * FROM students");
					foreach($result as $row)
					{
						echo "<tr>";
							echo "<td>".$row["stu_Id"]."</td>";
							echo "<td>".$row["stu_name"]."</td>";
						echo "</tr>";
					}
					}catch(PDOException $e){
						echo "ERROR: ". ~$e->getMessage();
				}
			?>
		</table>
	</body>
</html>