<html>
	<head>
		<title>Home</title>
		<link rel="stylesheet" type="text/css" href="form.css">
	</head>
<body>
		<p class="form">
<?php
    //if(isset($_POST['vdata']) and  !empty($_POST['vdata'])){
    	$conn = pg_connect("host=localhost port=5432 dbname=supermercato user=postgres password=unimi");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			//echo "Connessione riuscita."."<br/>";
			$query="SELECT * FROM supermercato";
			$result =  pg_query($conn, $query);
			if (!$result) {
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			} else {
				echo '<p><b>Elenco dei supermercati a disposizione</b></p>';
				echo '<table>
				<tr>
					<th>Indirizzo</th>
				</tr>';
				while ($row = pg_fetch_array($result)) {
					echo '<tr>
						<td>'. $row['indirizzo'].'</td>         		
					</tr>';
				};
				echo '</table>';
		
			};

		}
    /*}
    else
    {
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
	    print("<input type=\"submit\" name=\"vdata\" value=\"View Data\">");
	    print("</form>");    
    }*/
   
?>
</p>
	<p><b>Selezionare l'operazioni da eseguire:</b></p>
	<p><b>Inserimernto e visualizzazione</b></p>
	<form type="submit" action="insert_impiegato.php" method="GET">
		<label>Per l'inserimento di un IMPIEGATO qui:</label>
		<input type="submit" value="Insert Impiegato">
	</form>
	<form type="submit" action="insert_reparto.php" method="GET">
		<label>Per l'inserimento di un REPARTO qui:</label>
		<input type="submit" value="Insert Reparto">
	</form>
	<form type="submit" action="insert_responsabile.php" method="GET">
		<label>Per l'inserimento di un RESPONSABILE qui:</label>
		<input type="submit" value="Insert Responsabile">
	</form>
	
	<p><b>Modifica</b></p>
	<form type="submit" action="update_impiegato.php" method="GET">
		<label>Per la modifica di un IMPIEGATO:</label>
		<input type="submit" value="Update Impiegato">
	</form>
	<form type="submit" action="update_reparto.php" method="GET">
		<label>Per la modifica di un REPARTO qui:</label>
		<input type="submit" value="Update Reparto">
	</form>
	
	<p><b>Cancellazione</b></p>
	<form type="submit" action="delete.php" method="GET">
		<label>Per la cancellazione qui:</label>
		<input type="submit" value="Delete">
	</form>
	
	<p><b>Visualizzazione</b></p>
	<form type="submit" action="view_impiegato.php" method="GET">
		<label>Per visualizzare il PERSONALE in un REPARTO qui:</label>
		<input type="submit" value="View Impiegato">
	</form>
	<form type="submit" action="view_mansione.php" method="GET">
		<label>Per visualizzare le MANSIONI in un REPARTO qui:</label>
		<input type="submit" value="View Mansione">
	</form>
	<form type="submit" action="view_turni.php" method="GET">
		<label>Per visualizzare i turni del PERSONALE in un reparto qui:</label>
		<input type="submit" value="View Turni">
	</form>
	
	<p><b>Interrogazioni</b></p>
	<form type="submit" action="vendite.php" method="GET">
		<label>Vendite nel reparto Macelleria in un supermercato del giorno 12 maggio del 2020</label>
		<input type="submit" value="Query1">
	</form>
	<form type="submit" action="prodotti_da_ordinare.php" method="GET">
		<label>Prodotti del reparto Cancelleria che richiedono di essere riordinati </label>
		<input type="submit" value="Query2">
	</form>
	<form type="submit" action="prodotti_preparati.php" method="GET">
		<label>Prodotti preparati nel supermercato assemblati usando almeno un altro prodotto preparato</label>
		<input type="submit" value="Query3">
	</form>
</body>
</html>