<html>
	<head>
		<title>Prodotti Preparati</title>
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
			$query2="SELECT DISTINCT indirizzo FROM Supermercato order by indirizzo";
			$result2 =  pg_query($conn, $query2);
			if (!$result2){
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			}else{
				print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
				print("<select name=\"indirizzo\">");
				while ($row = pg_fetch_array($result2)) {
					print("<option value=\"".htmlspecialchars($row["indirizzo"])."\">");
					echo $row["indirizzo"];
					print("</option>");	
				};
				print("</select>");
						  

			
			print("<input id=\"vdata\" type=\"submit\" name=\"vdata\" value=\"View Data\">");
			print("</form>");  
			print("<form type=\"submit\" action=\"principale.php\" method=\"GET\">");
		print("<input type=\"submit\" value=\"Home\">");
		print("</form>");
	};
	};
	} else if(isset($_POST['vdata']) and !empty($_POST['vdata']) and !empty($_POST['indirizzo'])) {
		//print(var_dump($_POST));
    	$conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");		
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			//echo "Connessione riuscita."."<br/>";
			$selected=$_POST['indirizzo'];
			$query3="SELECT nome, codiceinterno FROM Prodotto where supermercato = '".$selected."' ";
			$result3 =  pg_query($conn, $query3);
			if (!$result3) {
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			} else {
						print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
						print("<select name=\"prodotto\">");
						while ($row = pg_fetch_array($result3)) {
							print("<option value=\"".htmlspecialchars($row["codiceinterno"])."\">");
							echo $row["nome"];
						print("</option>");	
							};
							
								
						
						
						print("</select>");
						print("<input id=\"vdata\" type=\"submit\" name=\"vdata\" value=\"View Data\">");
						print("</form>");
						
						};
		};
		} else if (isset($_POST['vdata']) and !empty($_POST['vdata']) and !empty($_POST['prodotto']))  {
				
				$conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");		
				if (!$conn){
				echo 'Connessione al database fallita.';
				exit();
				//die('Connessione al database fallita.');
			} else {
			//echo "Connessione riuscita."."<br/>";
			
			$selected1=$_POST['prodotto'];
			$query="SELECT DISTINCT p.nome, a1.prodottoComponente 
					FROM Assemblato AS a1 JOIN Assemblato AS a2 ON a1.prodottoComponente = a2.prodottoComposto JOIN Prodotto AS p ON a1.prodottoComposto = p.codiceInterno 
					WHERE a1.prodottoComposto = '".$selected1."' and a2.prodottoComposto = a1.prodottoComponente";
			$result =  pg_query($conn, $query);
			$righe = pg_num_rows($result);
			if (!$result) {
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			} else {
				if ($righe == 0) {
					echo "Non è un prodotto assemblato";
					
				} else {
				echo "È un prodotto composto da:<br\>";
							while ($row = pg_fetch_array($result)) {
								echo '<ul>
								
								<li>'. $row['prodottocomponente'].'</li>
								         		
								</ul>';
							};
						
				
			};
			print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
			print("<input type=\"submit\" name=\"vdata\" value=\"Back\">");
			print("</form>");
			
			}			
		};
		};
		
	
	
	  
   
?>
	</p>
</body>
</html>