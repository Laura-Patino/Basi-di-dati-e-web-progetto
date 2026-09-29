<html>
	<head>
		<title>View data</title>
		<link rel="stylesheet" type="text/css" href="form.css">
	</head>
<body>
<script>
function myfunction() {
  document.getElementById("vdata").click();
};
</script>
	<p class="form">
<?php
	
	if(!isset($_POST['vdata'])){ 
   	$conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
	if (!$conn){
		echo 'Connessione al database fallita.';
		exit();
		//die('Connessione al database fallita.');
	} else {
			//echo "Connessione riuscita."."<br/>";
			$query2="SELECT numerotessera FROM cliente";
			$result2 =  pg_query($conn, $query2);
			if (!$result2) {
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			} else {
					print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
					print("<select name=\"cliente\" onchange=\"myfunction();\">");
					while ($row = pg_fetch_array($result2)) {
						print("<option value=\"".htmlspecialchars($row["numerotessera"])."\">");
						echo $row["numerotessera"];
						print("</option>");					
					};
					print("<input id=\"vdata\" type=\"submit\" name=\"vdata\" value=\"View Data\">");
					print("</form>");    

			};
	};
	};

    if(isset($_POST['vdata']) and !empty($_POST['vdata']) and !empty($_POST['cliente'])) //ho passato anche le informazioni del cliente
		//visualizzo le info del cliente selezionato.
    {
		//print(var_dump($_POST));
    	$conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");		
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			//echo "Connessione riuscita."."<br/>";
			$query2="SELECT numerotessera FROM Cliente";
			$result2 =  pg_query($conn, $query2);
			if (!$result2) {
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			} else {
				print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
				print("<select name=\"cliente\" onchange=\"myfunction();\">"); //simula la pressione del tasto vdata
				while ($row = pg_fetch_array($result2)) {
					if($row["numerotessera"]==$_POST['cliente']){
						print("<option value=\"".htmlspecialchars($row["numerotessera"])."\" selected=\"selected\">");
					}else{
						print("<option value=\"".htmlspecialchars($row["numerotessera"])."\">");
					};
					
					echo $row["numerotessera"];
					print("</option>");					
				};
				print("<input id=\"vdata\" style=\"display:none\" type=\"submit\" name=\"vdata\" value=\"View Data\">");
				print("</form>");    
				
				$selected=$_POST['cliente'];
				$query="SELECT data, punti, associazione FROM Cliente JOIN donazassociazione d ON  d.donatore = numerotessera where numerotessera='".$selected."';";
				$result =  pg_query($conn, $query);
				if (!$result) {
					echo "Si è verificato un errore.<br/>";
					echo pg_last_error($conn);
					exit();
				} else {
					echo '<br><p>Donazioni Associazioni:</p><table>
					<tr>
					<th>Data</th>
					<th>Punti</td>
					<th>Destinatario</th>
					</tr>';
					while ($row = pg_fetch_array($result)) {
						echo '<tr>
						<td>'. $row['data'].'</td>
						<td>'. $row['punti'].'</td>
						<td>'. $row['associazione'].'</td>         		
						</tr>';
					};
					echo '</table>';
				};
				$selected2=$_POST['cliente'];
				$query2="SELECT data, punti, beneficiario FROM Cliente JOIN donazcliente d ON  d.donatore = numerotessera where numerotessera='".$selected2."';";
				$result2 =  pg_query($conn, $query2);
				if (!$result2) {
					echo "Si è verificato un errore.<br/>";
					echo pg_last_error($conn);
					exit();
				} else {
					echo '<br><p>Donazioni Clienti:</p><table>
					<tr>
					<th>Data</th>
					<th>Punti</td>
					<th>Befericiario</th>
					</tr>';
					while ($row = pg_fetch_array($result2)) {
						echo '<tr>
						<td>'. $row['data'].'</td>
						<td>'. $row['punti'].'</td>
						<td>'. $row['beneficiario'].'</td>         		
						</tr>';
					};
					echo '</table>';
				};
			};
		};		

    };
   
?>
	</p>
</body>
</html>