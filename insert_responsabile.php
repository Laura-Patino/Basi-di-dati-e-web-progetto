<html>
	<head>
		<title>Insert Responsabile</title>
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
	if(!isset($_POST['udata']) or $_POST['udata']=='Back'){
    	$conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			//echo "Connessione riuscita."."<br/>";
			$query2="SELECT DISTINCT nome FROM Reparto WHERE cfresponsabile is null order by nome";
			$result2 =  pg_query($conn, $query2);
			$query3="SELECT DISTINCT supermercato FROM reparto WHERE cfresponsabile is null order by supermercato";
			$result3 = pg_query($conn, $query3);
			if ((!$result2) || (!$result3)){
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			} else {
					print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
						print("<select name=\"reparto\">");
						while ($row = pg_fetch_array($result2)) {
							print("<option value=\"".htmlspecialchars($row["nome"])."\">");
							echo $row["nome"];
							print("</option>");	
						};
						print("</select>");
		
						
						print("<select name=\"indirizzo\" onchange=\"myfunction();\">");
						while ($row = pg_fetch_array($result3)) {
							print("<option value=\"".htmlspecialchars($row["supermercato"])."\">");
							echo $row["supermercato"];
							print("</option>");	
						};
					print("<input id=\"udata\" type=\"submit\" name=\"udata\" value=\"Update\">");
					print("</form>"); 
					
					print("<form type=\"submit\" action=\"principale.php\" method=\"GET\">");
					print("<input type=\"submit\" value=\"Home\">");
					print("</form>");
			};
		};
	}
	else if(isset($_POST['udata']) and $_POST['udata']=='Update' and !empty($_POST['reparto']) and !empty($_POST['indirizzo']))  //visualizzo i dati del reparto da modficare
    {
		$selected=$_POST['reparto'];
		$selected1=$_POST['indirizzo'];
        $conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			//echo "Connessione riuscita."."<br/>";

			$query="SELECT * FROM reparto where nome='".$selected."' AND supermercato='".$selected1."'";
			//echo $query;
			$result =  pg_query($conn, $query);
			$array=pg_fetch_assoc($result);
			print("<table>");
			print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
			print("<tr><th>Nome</th><td><input type=\"text\" name=\"nome\" value='".$array['nome']."' required readonly></td></tr>");
			print("<tr><th>Supermercato</th><td><input type=\"text\" name=\"supermercato\" value='".$array['supermercato']."' required readonly></td</tr>");
			print("<tr><th>CF Responsabile</th><td>");
        
			$query5="select i.nome, i.cognome, i.cf FROM impiegato i JOIN reparto r on i.supermercato = r.supermercato AND i.reparto = r.nome WHERE mansione != 'responsabile' and r.nome='".$selected."' AND r.supermercato='".$selected1."'";
			$result5 =  pg_query($conn, $query5);
			if (!$result5) {
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			} else {
				print("<select name=\"responsabile\">");
				while ($row = pg_fetch_array($result5)) {
					print("<option value=\"".htmlspecialchars($row[2])."\">");
					echo $row[0]."- ".$row[1];
					print("</option>");	
				};
			};
			print("<tr><td><input type=\"submit\" name=\"udata\" value=\"Send\"></td></tr>"); //INVIO DATI
			print("<tr><td><input type=\"submit\" name=\"udata\" value=\"Back\"></td></tr>"); 
			print("</form>");
			print("</table>"); 
		};
		      
	}
	else if(isset($_POST['udata']) and $_POST['udata']=='Send' )  //DOPO UPDATE
    {
		$nome=isset($_POST['nome'])?$_POST['nome']:'';
        $supermercato=isset($_POST['supermercato'])?$_POST['supermercato']:'';
		$responsabile=isset($_POST['responsabile'])?$_POST['responsabile']:'';
		
        $conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			$query1="UPDATE reparto set cfresponsabile='".$responsabile."' WHERE nome= '".$nome."' AND supermercato='".$supermercato."'; UPDATE impiegato SET mansione ='responsabile' WHERE cf='".$responsabile."'";
			$result = pg_query($conn,$query1);
			if ($result){
				//header('location:index.php?insert=Ok insert');
				echo "Inserimento avvenuto con successo<br>";
			}else{
			   // header('location:index.php?insert=Error insert record');
					echo "Si è verificato un errore.<br/>";
					echo pg_last_error($conn);
					//exit();
			}
			print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
			print("<input type=\"submit\" name=\"udata\" value=\"Back\">");
			//print("<input type=\"submit\" name=\"udata\" value=\"Update\">");
			print("</form>");    
		}
    }
	else
    {
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
	    print("<input type=\"submit\" name=\"udata\" value=\"Back\">");
	    print("</form>");    
		
    }
?>
		</p>
</body>
</html>