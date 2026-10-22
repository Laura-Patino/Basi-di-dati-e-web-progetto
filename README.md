# Basi-di-dati-e-web-progetto
Progetto riguardante la creazione di una base di dati di un supermercato. Il progetto è stato svolto utilizzando le seguenti tecnologie: PHP, HTML, CSS, PostgreSQL, XAMPP, Visual Studio Code.

# Svolgimento del progetto
- Si è partiti dalla lettura delle richieste del progetto, per passare alla progettazione concettuale con il primo modello dello schema ER specificando le entità, le associazioni, gerarchie, identificatori esterni ed interni, attributi multi-valore e composti. Si prosegue con la normalizzazione dello schema.
- Si prosegue con la stesura del modello logico, andando a ristrutturare il modello ER, mantenendo i vincoli di dominio. Il modello relazionale è visibile nella cartella *schema ER*.
- Scrittura del codice SQL per creare e modificare le tabelle e infine inserimento dei dati per il funzionamento del progetto su Postgres.
- Progettazione del sito web, nella cartella *flusso del sito* è possibile visualizzare il flusso del sito web e quale query è possibile utilizzare in ogni singola pagina.
 
# Premessa 
Si vogliono gestire le varie sedi di un supermercato, gestendo i loro rispettivi orari, i reparti presenti nella sede. In ogni sede sono assunti degli impiegati, dei quali si vogliono salvare i dati personali, lo stipendio e i turni di lavoro. Ogni reparto ha un responsabile. Per ogni reparto vogliamo conoscere i prodotti esposti, e se a loro volto sono prodotti composti da altri ingredienti venduti presso lo stesso supermercato.
Gestione punti e premi: il supermercato possiede un catalogo dei premi, i clienti possono richiedere dei premi tramite lo scalo dei punti accumulati dai clienti.
Dei clienti salviamo i dati personali e di domicilio e salviamo lo storico degli acquisti.
Inoltre, si tiene conto dei rifornimenti dei prodotti acquistati da dei fornitori per gestire lo stock del supermercato.

## Operazioni implementate
- Inserimento impiegato: aggiunta di un nuovo impiegato presso un punto vendita specifico
- Inserimento reparto: creazione di un nuovo reparto presso un punto vendita
- Inserimento responsabile: nomina di un solo responsabile per reparto
- Prodotti da ordinare: quanto un prodotto presso il punto vendita raggiunge una quantità vicina allo 0, si richiede di effettuare un ordine presso dei fornitori
- Prodotti preparati: lista degli ingredienti che compongono  un certo prodotto
- Update Impiegato & reparto: aggiornamento dei dati
- vendite: elenco delle vendite avvenute presso un punto vendita
- view impiegato & mansione & turni: visualizzazione delle informazioni dei singoli impiegati, delle mansioni a loro assegnati e dei loro turni
