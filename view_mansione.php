<html>
	<head>
		<title>View Mansione</title>
		<link rel="stylesheet" type="text/css" href="form.css">
	</head>
<body>

	<p class="form">
<?php
	
	if(!isset($_POST['vdata'])or $_POST['vdata']=='Back'){
   	$conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
	if (!$conn){
		echo 'Connessione al database fallita.';
		exit();
		//die('Connessione al database fallita.');
	} else {
		//echo "Connessione riuscita."."<br/>";
		$query2="SELECT DISTINCT nome FROM Reparto order by nome";
		$result2 =  pg_query($conn, $query2);
		$query3="SELECT indirizzo FROM Supermercato order by indirizzo";
		$result3 = pg_query($conn, $query3);
		if ((!$result2) || (!$result3)){
			echo "Si è verificato un errore.<br/>";
			echo pg_last_error($conn);
			exit();
		}else{
			print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
			print("<select name=\"reparto\">");
			while ($row = pg_fetch_array($result2)) {
				print("<option value=\"".htmlspecialchars($row["nome"])."\">");
				echo $row["nome"];
				print("</option>");	
			};
			print("</select>");
			
			print("<select name=\"indirizzo\">");
			while ($row = pg_fetch_array($result3)) {
				print("<option value=\"".htmlspecialchars($row["indirizzo"])."\">");
				echo $row["indirizzo"];
				print("</option>");	
			};
						  
			print("<input id=\"vdata\" type=\"submit\" name=\"vdata\" value=\"View Data\">");
			print("</form>"); 
			print("<form type=\"submit\" action=\"principale.php\" method=\"GET\">");
			print("<input type=\"submit\" value=\"Home\">");
			print("</form>");
			
		};
	};
	};

    if(isset($_POST['vdata']) and !empty($_POST['vdata']) and !empty($_POST['reparto']) and !empty($_POST['indirizzo'])) {
		
    	$conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");		
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			//echo "Connessione riuscita."."<br/>";
			$query2="SELECT DISTINCT nome FROM Reparto order by nome";
			$result2 =  pg_query($conn, $query2);
			$query3="SELECT indirizzo FROM Supermercato order by indirizzo";
			$result3 = pg_query($conn, $query3);
			if ((!$result2) || (!$result3)) {
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			} else {
				print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
				print("<select name=\"reparto\">");
				while ($row = pg_fetch_array($result2)) {
					if($row["nome"]==$_POST['reparto']){
						print("<option value=\"".htmlspecialchars($row["nome"])."\" selected=\"selected\">");
					}else{
						print("<option value=\"".htmlspecialchars($row["nome"])."\">");
					};
							
					echo $row["nome"];
					print("</option>");					
				};
						
				print("</select>");
						
				print("<select name=\"indirizzo\">");
				while ($row = pg_fetch_array($result3)) {
					if($row["indirizzo"]==$_POST['indirizzo']){
						print("<option value=\"".htmlspecialchars($row["indirizzo"])."\" selected=\"selected1\">");
					}else{
						print("<option value=\"".htmlspecialchars($row["indirizzo"])."\">");
					};
					echo $row["indirizzo"];
					print("</option>");
				};
								
				print("<input id=\"vdata\" type=\"submit\" name=\"vdata\" value=\"View Data\">");	
				print("</form>");					
			};
						
			$selected=$_POST['reparto'];
			$selected1=$_POST['indirizzo'];
			$query="SELECT * FROM Impiegato where reparto='".$selected."' and supermercato='".$selected1."' order by mansione;";
			$result =  pg_query($conn, $query);
			if (!$result) {
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			} else {
				echo '<br><table>
				<tr>
				<th>Mansione</th>
				<th>cf</th>
				<th>Nome</td>
				<th>Cognome</th>
				<th>Telefono</th>
				<th>Email</th>
				<th>Via</th>
				<th>nCiv</th>
				<th>dataAssunzione</th>
				<th>Reparto</th>
				<th>Supermercato</th>
				<th>Livello</th>
				</tr>';
				while ($row = pg_fetch_array($result)) {
					echo '<tr>
					<td>'. $row['mansione'].'</td>
					<td>'. $row['cf'].'</td>
					<td>'. $row['nome'].'</td>
					<td>'. $row['cognome'].'</td>
					<td>'. $row['telefono'].'</td>          
					<td>'. $row['email'].'</td>
					<td>'. $row['via'].'</td>
					<td>'. $row['nciv'].'</td>
					<td>'. $row['dataassunzione'].'</td>
					<td>'. $row['reparto'].'</td>
					<td>'. $row['supermercato'].'</td>
					<td>'. $row['livello'].'</td>           		
					</tr>';
				};
				echo '</table>';
							
			};
						
			print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
			print("<input type=\"submit\" name=\"vdata\" value=\"Back\">");
			print("<input id=\"vdata\" style=\"display:none\" type=\"submit\" name=\"vdata\" value=\"View Data\">");
			print("</form>");
	
		};
	};	

    
   
?>
	</p>
</body>
</html>
