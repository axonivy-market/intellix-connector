# Intellix Connector

Der Intelligent Indexing Connector integriert erweiterte Funktionen zur
Dokumentenindizierung in die Workflow-Orchestrierung. Dieser Connector wurde
speziell für Umgebungen entwickelt, in denen Axon Ivy mit DocuWare kombiniert
wird, um dokumentbasierte Geschäftsprozesse zu verwalten. Mit ihm können Sie
Schlüsselwörter effizient und einfach extrahieren. Dieser Connector:

- basiert auf der Komponente [Intelligente
  Indizierung](https://start.docuware.com/docuware-intelligent-indexing) von
  DocuWare.
- erkennt den Inhalt von Dokumenten wie Rechnungen ohne vorheriges Training.
- Enthält ein anpassbares Starter-Kit, mit dem Sie es schnell in Ihre Axon
  Ivy-Prozesse integrieren können.
- ist ausschließlich für Szenarien verfügbar, in denen DocuWare in Axon Ivy
  integriert ist, um dokumentbasierte Workflows zu orchestrieren, und wird nicht
  als eigenständiger Dienst angeboten.

## Demo

1. Laden Sie jedes Dokument als PDF hoch.\
   ![upload](images/uploadLocalFile.png)
2. Erkannte Felder anzeigen\
   ![Felder](images/detectedFields.png)

## Setup

1. Bestellen Sie eine Intellix-Instanz über
   <a href="mailto:info@axonivy.com">info@axonivy.com</a>
2. Kopieren Sie den Block „ `intellixConnector` ” aus der Datei „
   `axonivy-intellix-connetor/config/variables.yaml` ” in ein Projekt innerhalb
   Ihrer Arbeitsbereiche:
3. Setzen Sie Ihren benutzerdefinierten Variablenwert auf `host`, `username`,
   `password` und `msName` mit den kopierten `variables.yaml`

> [!HINWEIS] Der variable Pfad `intellix-connector` wurde ab Version 13 in
> `intellixConnector` umbenannt.
