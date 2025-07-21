# Intellix Connector

The Intelligent Indexing Connector integrates advanced document indexing capabilities into workflow orchestration. Designed specifically for environments where Axon Ivy is combined with DocuWare to manage document-based business processes, this connector allows you to extract keywords efficiently and easily. This connector:

- is based on the [Intelligent Indexing](https://start.docuware.com/docuware-intelligent-indexing) component of DocuWare.
- recognizes the content of documents such as invoices without prior training.
- includes a customizable starter kit to help you quickly integrate it into your Axon Ivy processes.
- is available exclusively for scenarios where DocuWare is integrated with Axon Ivy to orchestrate document-based workflows and is not offered as a stand-alone service.


## Demo

1. Upload any document as PDF   
    ![upload](images/uploadLocalFile.png)   
2. Show detected fields   
    ![fields](images/detectedFields.png)

## Setup

1. Order an Intellix Instance via <a href="mailto:info@axonivy.com">info@axonivy.com</a>
2. Copy the `intellixConnector` block from the `axonivy-intellix-connetor/config/variables.yaml` into a project within your workspaces:
3. Set your custom variable value to `host`, `username`, `password` and `msName` with the copied `variables.yaml`

> [!NOTE]
> The variable path `intellix-connector` is renamed to `intellixConnector` from 13.