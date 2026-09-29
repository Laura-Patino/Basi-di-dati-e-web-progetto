<html>
	<head>
		<title>Inserimento dati</title>
		<link rel="stylesheet" type="text/css" href="form.css">
	</head>
	<script>
		function myfunction() {
		  document.getElementById("idata").click();
		};
	</script>
<body>
<p class="form">
<?php
	if(isset($_POST['idata']) and $_POST['idata']=='Inserimento Impiegato') //INSERIMENTO REPARTO
    {
         print("<table>");
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
        print("<tr><th>C.F.</th><td><input type=\"text\" name=\"cf\" required maxlength=\"16\" pattern=\[A-Z]{6}[0-9]{10}\"></td></tr>");  //required pattern=\"[0-9]{6,10}\"  title=\"Sono ammesse solo digit\"
        print("<tr><th>nome</th><td><input type=\"text\" name=\"nome\" required></td</tr>");
        print("<tr><th>cognome</th><td><input type=\"text\" name=\"cognome\" required></td</tr>");
        print("<tr><th>telefono</th><td><input type=\"text\" name=\"telefono\" maxlength=\"10\" pattern=\"[0-9]{10}\" title=\"Sono ammesse solo digit\"></td</tr>");
        print("<tr><th>email</th><td><input type=\"email\" name=\"email\"></td</tr>");
        print("<tr><th>via</th><td><input type=\"text\" name=\"via\"></td</tr>");
        print("<tr><th>nciv</th><td><input type=\"text\" name=\"nciv\"></td</tr>");
        print("<tr><th>Data assunzione</th><td><input type=\"date\" name=\"dataassunzione\"></td></tr>");
		print("<tr><th>Mansione</th><td><input type=\"text\" name=\"mansione\"></td></tr>");
        print("<tr><th>Reparto</th><td>");
        $conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			$query2="SELECT DISTINCT nome FROM reparto";
			$result2 =  pg_query($conn, $query2);
			if (!$result2) {
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			} else {
				print("<select name=\"reparto\" onchange=\"myfunction();\" required>");
				while ($row = pg_fetch_array($result2)) {
					print("<option value=\"".htmlspecialchars($row["nome"])."\">");
					echo $row["nome"];
					print("</option>");					
				};
			};
		};
		print("</td</tr>");
		print("<tr><th>Supermercato</th><td>");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			$query3="SELECT DISTINCT supermercato FROM reparto "; //GROUP BY supermercato
			$result3 =  pg_query($conn, $query3);
			if (!$result3) {
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			} else {
				print("<select name=\"supermercato\" onchange=\"myfunction();\" required>");
				while ($row = pg_fetch_array($result3)) {
					print("<option value=\"".htmlspecialchars($row["supermercato"])."\">");
					echo $row["supermercato"];
					print("</option>");					
				};
			};
		};
		print("</td</tr>");
        print("<tr><th>Livello</th><td><input type=\"text\" name=\"livello\" pattern=\"[1-3]{1}\" required></td</tr>");

		print("<tr><td><input type=\"submit\" name=\"idata\" value=\"Invia\"></td></tr>");
        print("</form>");
        print("</table>");    
    }
    else if( isset($_POST['idata']) and $_POST['idata']=='Invia')
    {
        $conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			$codfiscale=isset($_POST['cf'])?$_POST['cf']:'';
			$nome=isset($_POST['nome'])?$_POST['nome']:'';
			$cognome= isset($_POST['cognome'])?$_POST['cognome']:'';
			$telefono= isset($_POST['telefono'])?$_POST['telefono']:'0';
			$email=isset($_POST['email'])?$_POST['email']:'';
			$via= isset($_POST['via'])?$_POST['via']:'';
			$nciv= isset($_POST['nciv'])?$_POST['nciv']:0;
			$dataassunzione= isset($_POST['dataassunzione'])?$_POST['dataassunzione']:'';
			$mansione = isset($_POST['mansione'])?$_POST['mansione']:'';
			$reparto = isset($_POST['reparto'])?$_POST['reparto']:'';
			$supermercato = isset($_POST['supermercato'])?$_POST['supermercato']:'';
			$livello = isset($_POST['livello'])?$_POST['livello']:1;
			
			if ($mansione =='responsabile'){
				print("<form type=\"submit\" action=\"insert_responsabile.php\" method=\"GET\">");
				print("<label>Per l'inserimento di un responsabile qui:</label>");
				print("<input type=\"submit\" value=\"Inserimento Responsabile\">");
				print("</form>");
			}else {
				$query="INSERT INTO impiegato (cf, nome, cognome, telefono, email, via, nciv, dataassunzione, mansione, reparto, supermercato, livello) VALUES ('$codfiscale','$nome', '$cognome', '$telefono', '$email', '$via', '$nciv', '$dataassunzione', '$mansione', '$reparto', '$supermercato', '$livello')";
				$result = pg_query($conn,$query);
				if ($result){
					echo "Inserimento avvenuto con successo<br>";
				}else{
						echo "Si è verificato un errore.<br/>";
						echo pg_last_error($conn);
						//exit();
				}
				print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
				print("<input type=\"submit\" name=\"idata\" value=\"Inserimento Impiegato\">");
				print("</form>");    
			}
		}
    }
    else
    {
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
		print("<input type=\"submit\" name=\"idata\" value=\"Inserimento Impiegato\">");
	    print("</form>");  
		print("<form type=\"submit\" action=\"principale.php\" method=\"GET\">");
		print("<input type=\"submit\" value=\"Home\">");
		print("</form>");
    }
	    
?>

	</p>
</body>
</html>