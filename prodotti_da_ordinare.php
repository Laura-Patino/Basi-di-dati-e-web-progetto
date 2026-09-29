<html>
	<head>
		<title>Prodotti da ordinare</title>
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
		if (!$result2) {
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
			print("<input id=\"vdata\" type=\"submit\" name=\"vdata\" value=\"View Data\">");
			print("</form>"); 
			print("<form type=\"submit\" action=\"principale.php\" method=\"GET\">");
			print("<input type=\"submit\" value=\"Home\">");
			print("</form>");
			
		};
	};
	};

    if(isset($_POST['vdata']) and !empty($_POST['vdata']) and !empty($_POST['reparto']) ) {
		
    	$conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");		
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			//echo "Connessione riuscita."."<br/>";
			$query2="SELECT DISTINCT nome FROM Reparto order by nome";
			$result2 =  pg_query($conn, $query2);
			if (!$result2) {
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
				print("<input id=\"vdata\" type=\"submit\" name=\"vdata\" value=\"View Data\">");
				print("</form>");					
			};
						
			$selected=$_POST['reparto'];
			$query="SELECT DISTINCT p.nome, o.tempoConsegna
					FROM Ordine o JOIN Rifornimento r ON o.codiceOrdine = r.ordine JOIN Prodotto p ON r.prodotto = p.codiceInterno
					WHERE reparto = '".$selected."' AND soglia > p.quantità - (SELECT SUM(a.quantità)
																				FROM Acquisto a JOIN Prodotto p1 ON prodotto = p1.codiceInterno
																				WHERE p1.codiceInterno = p.codiceInterno) ;";
			$result =  pg_query($conn, $query);
			if (!$result) {
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			} else {
				echo '<br><table>
				<tr>
				<th>Prodotto</th>
				<th>Tempo Consegna</th>
				</tr>';
				while ($row = pg_fetch_array($result)) {
					echo '<tr>
					<td>'. $row['nome'].'</td>
					<td>'. $row['tempoconsegna'].'</td>          		
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