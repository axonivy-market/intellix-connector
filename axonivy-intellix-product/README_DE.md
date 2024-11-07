# Intelligent Indexing

Mit diesem Konnektor für DocuWare Intelligent Indexing kannst du effizient und einfach in jedem Geschäftsprozess Schlagwörter in deinen Dokumenten extrahieren. Dieser Konnektor:


- basiert auf der [Intelligent Indexing](https://start.docuware.com/docuware-intelligent-indexing)-Komponente von DocuWare.
- erkennt den Inhalt von Dokumenten wie Rechnungen ohne vorheriges Training.
- erfordert einen zusätzlichen, kostenpflichtigen Lizenzschlüssel.
- enthält ein anpassbares Starterkit, das dir hilft, es schnell in deine Axon Ivy-Prozesse zu integrieren.

## Demo

1. Lade ein beliebiges Dokument als PDF hoch   
    ![hochladen](images/uploadLocalFile.png)   
3. Zeige die erkannten Felder an   
    ![felder](images/detectedFields.png)

## Einrichtung

1. Bestelle eine Intellix-Instanz über <a href="mailto:info@axonivy.com">info@axonivy.com</a>
2. Kopiere den Block `intellix-connector` aus der Datei `axonivy-intellix-connector/config/variables.yaml` in ein Projekt innerhalb deiner Arbeitsbereiche.
3. Setze deinen benutzerdefinierten Variablenwert für `host`, `username`, `password` und `msName` in der kopierten `variables.yaml`.
