<html>
	<body>
		<h1>Datos de los estudiantes</h1>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>Nombre</th>
			</tr>
			<?php
				$servername = "localhost";
				$username = "root";
				$password = "";
				$dbname = "test";
				
				// Create connection
				$conn = mysqli_connect($servername, $username, $password, $dbname);
				// Check connection
				if (!$conn) {
					die("Connection failed: " . mysqli_connect_error());
				}
				
				$sql = "SELECT * FROM estudiantes";
				$result = mysqli_query($conn, $sql);
				
				if (mysqli_num_rows($result) > 0) {
					// output data of each row
					while($row = mysqli_fetch_assoc($result)) {
						echo "<tr>";
							echo "<td>".$row["id_estudiante"]."</td>";
							echo "<td>".$row["nombre_estudiante"]."</td>";
						echo "</tr>";
						}
					} else {
						echo "0 results";
				}
				mysqli_close($conn);
			?>
		</table>
	</body>
</html>