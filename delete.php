<html>
	<head>
		<title>Delete Reparto e Impiegato</title>
		<link rel="stylesheet" type="text/css" href="form.css">
	</head>
<body>
	<p class="form">
<?php

    if(isset($_POST['ddata']) and $_POST['ddata']=='Delete Reparto')  
    {
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
						  
					print("<input id=\"vdata\" type=\"submit\" name=\"deletev\" value=\"Delete.\">");
					print ("<input type=\"submit\" name=\"back\" value=\"Back\" class=\"button\">");

					print("</form>");  
			};
		};
	}
    else if( isset($_POST['deletev']) and isset($_POST['deletev']) )
    {
		$nome=isset($_POST['reparto'])?$_POST['reparto']:'';
		$supermercato= isset($_POST['indirizzo'])?$_POST['indirizzo']:'';
		echo $nome;
		echo $supermercato;
    	$conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			//echo "Connessione riuscita."."<br/>";
			
		//ALTER TABLE impiegato ADD FOREIGN KEY(reparto, supermercato) REFERENCES reparto(nome, supermercato) ON DELETE CASCADE
		$query="DELETE FROM reparto WHERE nome='".$nome."' AND supermercato='".$supermercato."';";
        $result = pg_query($query);
		if ($result){
			//$cmdtuples = pg_affected_rows($result);
			echo "Cancellazione avvenuta con successo<br>";
        }else{
			echo "Si è verificato un errore.<br/>";
			echo pg_last_error($conn);
			//exit();
		}
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
	    print("<input type=\"submit\" name=\"ddata\" value=\"Delete Reparto\">");
	    print("</form>");   
		echo "</form>";
		
		}
	}
	else if(isset($_POST['ddata']) and $_POST['ddata']=='Delete Impiegato')  //IMPIEGATO
    {
    	$conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			//echo "Connessione riuscita."."<br/>";
			$query="SELECT * FROM Impiegato";
			$result =  pg_query($conn, $query);
			echo '<table>
					<tr>
						<th>CF</th>
						<th>Nome</td>
						<th>Cognome</th>
						<th>Telefono</th>
						<th>Email</th>
						<th>Via</th>
						<th>Nciv</th>
						<th>Data assunzione</th>
						<th>Mansione</th>
						<th>Reparto<th>
						<th>Supermercato</th>
						<th>Livello</th>
					</tr>';
			print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
			while($array=pg_fetch_assoc($result))
			{
					echo '<tr>
						<td>'. $array['cf'].'</td>
						<td>'. $array['nome'].'</td>
						<td>'. $array['cognome'].'</td>
						<td>'. $array['telefono'].'</td>          
						<td>'. $array['email'].'</td>
						<td>'. $array['via'].'</td> 
						<td>'. $array['nciv'].'</td> 
						<td>'. $array['dataassunzione'].'</td> 
						<td>'. $array['mansione'].'</td> 
						<td>'. $array['reparto'].'</td> 
						<td>'. $array['supermercato'].'</td> 
						<td>'. $array['livello'].'</td> 

						<td><input type="radio" name="deletei" value='.$array['cf'].' required></td>         		
					</tr>';
			}
			echo '</table>';
			echo "<input type=\"submit\" name=\"delete\" value=\"Delete\" class=\"button\">";
			echo "</form>";
			
			print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
			print ("<input type=\"submit\" name=\"back\" value=\"Back\" class=\"button\">");
			print ("</form>");
		}
	}
    else if( isset($_POST['deletei']) and isset($_POST['deletei']) )
    {
    	$conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			//echo "Connessione riuscita."."<br/>";
		$query="DELETE FROM impiegato WHERE cf='".$_POST['deletei']."';";
        $result = pg_query($query);
		if ($result){
			//$cmdtuples = pg_affected_rows($result);
			echo "Cancellazione avvenuta con successo<br>";
        }else{
			echo "Si è verificato un errore.<br/>";
			echo pg_last_error($conn);
			//exit();
		}
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
	    print("<input type=\"submit\" name=\"ddata\" value=\"Delete Impiegato\">");
	    print("</form>");   
		}
	}
    else
    {
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
	    print("<input type=\"submit\" name=\"ddata\" value=\"Delete Reparto\">");
		print("<input type=\"submit\" name=\"ddata\" value=\"Delete Impiegato\">");
	    print("</form>");    
		print("<form type=\"submit\" action=\"principale.php\" method=\"GET\">");
		print("<input type=\"submit\" value=\"Home\">");
		print("</form>");
    }

?>
	</p>
</body>
</html>