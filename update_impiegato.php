<html>
	<head>
		<title>Update Impiegato</title>
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
		$query2="SELECT cf, nome, cognome FROM Impiegato order by cognome, nome";
		$result2 =  pg_query($conn, $query2);
		if (!$result2) {
			echo "Si è verificato un errore.<br/>";
			echo pg_last_error($conn);
			exit();
		} else {
			print("<form  action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
			print("<select name=\"impiegato\" onchange=\"myfunction();\">");
			while ($row = pg_fetch_array($result2)) {
				print("<option value=\"".htmlspecialchars($row["cf"])."\">");
				echo $row["nome"]." ".$row["cognome"];
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
			$query="SELECT * FROM Impiegato";
			$result =  pg_query($conn, $query);
			echo '<table>
        		<tr>
         			<th>Codice Fiscale</th>
         			<th>Nome</th>
					<th>Cognome</th>
					<th>Telefono</th>
					<th>Email</th>
					<th>Via</th>
					<th>nCiv</th>
					<th>Data Assunzione</th>
					<th>Mansione</th>
					<th>Reparto</th>
					<th>Supermercato</th>
					<th>Livello</th>
        		</tr>';

			while($array=pg_fetch_assoc($result)){
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
          		</tr>';
			};
		};
		echo '</table>';
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
		echo "<input type=\"submit\" name=\"back\" value=\"Back\" class=\"button\">";
		echo "</form>";
	} else if(isset($_POST['udata']) and $_POST['udata']=='Update'){
		
        $conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			//echo "Connessione riuscita."."<br/>";
			$query="SELECT * FROM Impiegato where cf='".$_POST['impiegato']."'";
			$result =  pg_query($conn, $query);
			$array=pg_fetch_assoc($result);
			print("<table>");
			print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
			print("<tr><th>Codice Fiscale</th><td><input type=\"text\" name=\"cf\" value='".$array['cf']."'  required readonly></td></tr>");
			print("<tr><th>Nome</th><td><input type=\"text\" name=\"nome\" value='".$array['nome']."' ></td</tr>");
			print("<tr><th>Cognome</th><td><input type=\"text\" name=\"cognome\" value='".$array['cognome']."' ></td</tr>");
			print("<tr><th>Telefono</th><td><input type=\"text\" name=\"telefono\" value='".$array['telefono']."' maxlength=\"10\" pattern=\"[0-9]{6,10}\" title=\"Sono ammesse solo digit\"  ></td</tr>");
			print("<tr><th>Email</th><td><input type=\"text\" name=\"email\" value='".$array['email']."' ></td</tr>");
			print("<tr><th>Via</th><td><input type=\"text\" name=\"via\" value='".$array['via']."' ></td></tr>");
			print("<tr><th>Numero Civico</th><td><input type=\"text\" name=\"nciv\" value='".$array['nciv']."' ></td></tr>");
			print("<tr><th>Data Assunzione</th><td><input type=\"text\" name=\"dataAssunzione\" value='".$array['dataassunzione']."' ></td></tr>");
			print("<tr><th>Mansione</th><td><input type=\"text\" name=\"mansione\" value='".$array['mansione']."' ></td></tr>");
			print("<tr><th>Reparto</th><td><input type=\"text\" name=\"reparto\" value='".$array['reparto']."' ></td></tr>");
			print("<tr><th>Supermercato</th><td><input type=\"text\" name=\"supermercato\" value='".$array['supermercato']."' ></td></tr>");
			print("<tr><th>Livello</th><td><input type=\"text\" name=\"livello\" value='".$array['livello']."' ></td></tr>");
			print("<tr><td><input type=\"submit\" name=\"udata\" value=\"Send\"></td></tr>");
			print "<tr><td><input type=\"submit\" name=\"back\" value=\"Back\" class=\"button\"></td></tr>";
			print("</form>");
			print("</table>");       
		}
    } else if( isset($_POST['udata']) and $_POST['udata']=='Send') {   
	
        $conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			$cf=isset($_POST['cf'])?$_POST['cf']:'';
			$nome=isset($_POST['nome'])?$_POST['nome']:'';		
			$cognome=isset($_POST['cognome'])?$_POST['cognome']:'';
			$tel=isset($_POST['telefono'])?$_POST['telefono']:0;
			$email=isset($_POST['email'])?$_POST['email']:'';
			$via=isset($_POST['via'])?$_POST['via']:'';
			$nciv=(isset($_POST['nciv'])and is_numeric($_POST['nciv']))?$_POST['nciv']:0;
			$dataAssunzione=isset($_POST['dataAssunzione'])?$_POST['dataAssunzione']:'';
			$mansione=isset($_POST['mansione'])?$_POST['mansione']:'';
			$reparto=isset($_POST['reparto'])?$_POST['reparto']:'';
			$supermercato=isset($_POST['supermercato'])?$_POST['supermercato']:'';
			$livello=(isset($_POST['livello'])and is_numeric($_POST['livello']))?$_POST['livello']:0;
			$query="update Impiegato set  nome = '$nome', cognome='$cognome', telefono = '$tel', email = '$email', via='$via', nCiv=$nciv, dataAssunzione = '$dataAssunzione', mansione='$mansione', supermercato='$supermercato', livello='$livello' WHERE cf = '$cf'";
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
    } else  {
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