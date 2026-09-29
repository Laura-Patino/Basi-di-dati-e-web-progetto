<html>
	<head>
		<title>Inserimento dati</title>
		<link rel="stylesheet" type="text/css" href="form.css">
	</head>
<body>
<p class="form">
<?php
    if(isset($_POST['idata']) and $_POST['idata']=='Visualizza')
    {
    	$conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			//echo "Connessione riuscita."."<br/>";
		$query="SELECT * FROM reparto";
    	$result =  pg_query($conn, $query);
		echo '<table>
        		<tr>
         			<th>Nome</th>
         			<th>Supermercato</th>
					<th>Resposabile</th>
        		</tr>';

		while($array=pg_fetch_assoc($result))
		{
		  		echo '<tr>
            		<td>'. $array['nome'].'</td>
            		<td>'. $array['supermercato'].'</td>
					<td>'. $array['cfresponsabile'].'</td>
          		</tr>';
		}
		echo '</table>';
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
		echo "<input type=\"submit\" name=\"back\" value=\"Back\" class=\"button\">";
		echo "</form>";

		}
	}
    else if(isset($_POST['idata']) and $_POST['idata']=='Inserimento Reparto') //INSERIMENTO REPARTO
    {
         print("<table>");
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
        print("<tr><th>Nome</th><td><input type=\"text\" name=\"nome\" required></td></tr>");  //required pattern=\"[0-9]{6,10}\"  title=\"Sono ammesse solo digit\"
        print("<tr><th>supermercato</th><td><input type=\"text\" name=\"supermercato\" required></td</tr>");
        print("<tr><td><input type=\"submit\" name=\"idata\" value=\"Send\"></td></tr>");
        print("</form>");
        print("</table>");
		
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
		echo "<input type=\"submit\" name=\"back\" value=\"Back\" class=\"button\">";
		echo "</form>";
    }
    else if( isset($_POST['idata']) and $_POST['idata']=='Send')
    {
        $conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
		$nome=isset($_POST['nome'])?$_POST['nome']:'';
        $supermercato=isset($_POST['supermercato'])?$_POST['supermercato']:'';
        
    	$query="INSERT INTO reparto (nome, supermercato) VALUES ('$nome','$supermercato')";
        $result = pg_query($conn,$query);
        if ($result){
			echo "Inserimento avvenuto con successo<br>";
        }else{
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				//exit();
		}
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
	    print("<input type=\"submit\" name=\"idata\" value=\"Visualizza\">");
	    print("<input type=\"submit\" name=\"idata\" value=\"Insert\">");
	    print("</form>");    
		}
    }
    else
    {
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
	    print("<input type=\"submit\" name=\"idata\" value=\"Visualizza\">");
	    print("<input type=\"submit\" name=\"idata\" value=\"Inserimento Reparto\">");
	    print("</form>");    
		print("<form type=\"submit\" action=\"principale.php\" method=\"GET\">");
		print("<input type=\"submit\" value=\"Home\">");
		print("</form>");
    }
	    
?>

	</p>
</body>
</html>