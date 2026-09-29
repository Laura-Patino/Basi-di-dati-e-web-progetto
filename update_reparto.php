<html>
	<head>
		<title>Update Reparto</title>
		<link rel="stylesheet" type="text/css" href="form.css">
	</head>
<body>
<script>
	function myfunction() {
	document.getElementById("udata").click(); 
	};
</script>
<p class="form">
<?php
	if(!isset($_POST['udata'])){	
   	$conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
	if (!$conn){
		echo 'Connessione al database fallita.';
		exit();
		//die('Connessione al database fallita.');
	} else {
		//echo "Connessione riuscita."."<br/>";
		$query2="SELECT DISTINCT nome FROM Reparto order by nome";
		$result2 =  pg_query($conn, $query2);
		$query4="SELECT indirizzo FROM Supermercato order by indirizzo";
		$result4 = pg_query($conn, $query4);
		if ((!$result2) || (!$result4)){
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
			while ($row = pg_fetch_array($result4)) {
				print("<option value=\"".htmlspecialchars($row["indirizzo"])."\">");
				echo $row["indirizzo"];
				print("</option>");	
			};

			print("<input id=\"udata\" type=\"submit\" name=\"udata\" value=\"Update\">");
			print("</form>");  
		};
	};
	};

    if(isset($_POST['udata']) and $_POST['udata']=='View') {
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

			while($array=pg_fetch_assoc($result)) {
				echo '<tr>
            		<td>'. $array['nome'].'</td>
            		<td>'. $array['supermercato'].'</td>
					<td>'. $array['cfresponsabile'].'</td>
          		</tr>';
			};
		};
		echo '</table>';
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
		echo "<input type=\"submit\" name=\"back\" value=\"Back\" class=\"button\">";
		echo "</form>";
		
	} else if(isset($_POST['udata']) and $_POST['udata']=='Update') {
			
        $conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			//echo "Connessione riuscita."."<br/>";
			$query="SELECT * FROM Reparto where nome='".$_POST['reparto']."' and supermercato = '".$_POST['indirizzo']."'";
			$query3="SELECT * FROM Impiegato where reparto = '".$_POST['reparto']."' and supermercato = '".$_POST['indirizzo']."' and mansione != 'responsabile' "; 
			$result =  pg_query($conn, $query);
			$righe = pg_num_rows($result);
			$array = pg_fetch_assoc($result);
			$result3 = pg_query($conn, $query3);
			if ($righe==0) {
				echo "Non c'è nessun reparto associato a quel supermercato";
				print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
				print("<input type=\"submit\" name=\"back\" value=\"Back\">");
				print("</form>"); 
			} else {
				print("<table>");
				print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
				print("<tr><th>Nome</th><td><input type=\"text\" name=\"nome\" value='".$array['nome']."' required readonly></td></tr>");
				print("<tr><th>Supermercato</th><td><input type=\"text\" name=\"supermercato\" value='".$array['supermercato']."'  required readonly></td></tr>");
				print("<tr><th>Codice Fiscale Responsabile</th><td><select name=\"cfResponsabile\">" );
				while ($row = pg_fetch_assoc($result3)) {
					print("<option value=\"".htmlspecialchars($row["cf"])."\">");
					echo $row["cf"];
					print("</option>");					
				};
				print("</td</tr>");
				print("<tr><td><input type=\"submit\" name=\"udata\" value=\"Send\"></td></tr>");
				print "<tr><td><input type=\"submit\" name=\"back\" value=\"Back\" class=\"button\"></td></tr>";
				print("</form>");
				print("</table>");       
			}
		}
	} else if( isset($_POST['udata']) and $_POST['udata']=='Send') {   
        $conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			$nome=isset($_POST['nome'])?$_POST['nome']:'';
			$supermercato=isset($_POST['supermercato'])?$_POST['supermercato']:'';		
			$cfResponsabile=isset($_POST['cfResponsabile'])?$_POST['cfResponsabile']:'';
			$query="update Reparto set cfresponsabile = '$cfResponsabile' WHERE nome = '$nome' and supermercato = '$supermercato'; UPDATE Impiegato SET mansione = 'responsabile' WHERE cf='$cfResponsabile'" ;
			$result = pg_query($conn,$query);
			if ($result){
				echo "Inserimento avvenuto con successo<br>";
			}else{
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				//exit();
			}
			print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
			print("<input type=\"submit\" name=\"udata\" value=\"View\">");
			print("</form>");    
		}
    } else {
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
	    print("<input type=\"submit\" name=\"udata\" value=\"View\">");
	    print("</form>");  
		print("<form type=\"submit\" action=\"principale.php\" method=\"GET\">");
		print("<input type=\"submit\" value=\"Home\">");
		print("</form>");


    };
	    
?>

	</p>
</body>
</html>