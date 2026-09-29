# Basi-di-dati-e-web-progetto
Progetto riguardante la creazione di una base di dati di un supermercato. Tecnologie utilizzate: PHP, HTML, CSS, PostgreSQL, XAMPP, Visual Studio Code.

## Svolgimento del progetto
- Si è partiti dalla lettura delle richieste del progetto, per passare alla progettazione concettuale con il primo modello dello schema ER specificando le entità, le associazioni, gerarchie, identificatori esterni ed interni, attributi multi-valore e composti. 
- Si prosegue con la stesura del modello logico, andando a ristrutturare il modello ER, mantenendo i vincoli di dominio. Il modello relazionale è visibile nella cartella *schema ER*.
- Scrittura del codice SQL per creare e modificare le tabelle e infine inserimento dei dati per il funzionamento del progetto su Postgres.
- Progettazione del sito web, nella cartella *flusso del sito* è possibile visualizzare il flusso del sito web e quale query è possibile utilizzare in ogni singola pagina.
 
# Premessa 
Si vogliono gestire le varie sedi di un supermercato, gestendo i loro rispettivi orari, i reparti presenti nella sede. In ogni sede sono assunti degli impiegati dei quali si vogliono salvare i dati personali, lo stipendio e i turni di lavoro. Per ogni reparto vogliamo conoscere i prodotti esposti, e se a loro volto sono prodotti composti da altri ingredienti venduti dal supermercato.
Considerare che il supermercato possiede un catalogo dove è possibile vincere dei premi tramite lo scalo dei punti accumulati dai clienti.
Dei clienti salviamo i dati personali e di domicilio e salviamo lo storico degli acquisti.
Inoltre, si tiene conto dei rifornimenti dei prodotti acquistati da dei fornitori per gestire lo stock del supermercato.
