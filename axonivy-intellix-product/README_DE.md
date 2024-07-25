# Intelligent Document Processing mit Axon Ivy

Der **Axon Ivy IDP (Intelligent Document Processing) Konnektor** extrahiert effizient und einfach spezifische Werte aus deinen Dokumenten.

Dieser Konnektor:
- Basiert auf der [Intelligent Indexing](https://start.docuware.com/docuware-intelligent-indexing Komponente von DocuWare.
- Erkennt den Inhalt von Dokumenten - beispielsweise den Rechnungsbetrag in Rechnungen - ohne vorheriges Training.
- Benötigt einen zusätzlichen, kostenpflichtigen Lizenzschlüssel.
- Stellt Open-Source-Code bereit, der dich dabei unterstützt, diese Funktion schnell in deine Axon Ivy Prozesse zu integrieren und anzupassen


## Demo

1. Upload any document as PDF ![upload](images/uploadLocalFile.png)
2. Show detected fields ![fields](images/detectedFields.png)

## Setup

1. Order an intellix instance via <a href="mailto:info@axonivy.com">info@axonivy.com</a>
2. Copy the `intellix-connector` block from the `axonivy-intellix-connetor/config/variables.yaml` into a project within your workspaces:
3. set your custom variable value to `host`, `username`, `password` and `msName` with the copied `variables.yaml`


