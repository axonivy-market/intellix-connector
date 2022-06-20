[Ivy]
18166227E0841472 9.3.1 #module
>Proto >Proto Collection #zClass
ix0 intellix Big #zClass
ix0 B #cInfo
ix0 #process
ix0 @AnnotationInP-0n ai ai #zField
ix0 @TextInP .type .type #zField
ix0 @TextInP .processKind .processKind #zField
ix0 @TextInP .xml .xml #zField
ix0 @TextInP .responsibility .responsibility #zField
ix0 @StartSub f0 '' #zField
ix0 @EndSub f1 '' #zField
ix0 @RestClientCall f3 '' #zField
ix0 @PushWFArc f4 '' #zField
ix0 @PushWFArc f2 '' #zField
>Proto ix0 ix0 intellix #zField
ix0 f0 inParamDecl '<java.io.File file> param;' #txt
ix0 f0 inParamInfo 'file.description=The file (PDF) to process' #txt
ix0 f0 inParamTable 'out.file=param.file;
' #txt
ix0 f0 outParamDecl '<com.docuware.dev._public.services.intellix.IndexData indexData> result;' #txt
ix0 f0 outParamInfo 'indexData.description=Identified fields from the given file' #txt
ix0 f0 outParamTable 'result.indexData=in.indexData;
' #txt
ix0 f0 callSignature call(java.io.File) #txt
ix0 f0 @CG|tags connector #txt
ix0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>identify(File)</name>
    </language>
</elementInfo>
' #txt
ix0 f0 81 49 30 30 -26 17 #rect
ix0 f0 res:/webContent/logos/intellix.png?small #fDecoratorIcon
ix0 f1 337 49 30 30 0 15 #rect
ix0 f3 clientId a3fb2ba0-71ab-49a6-82fe-bb0c202b38bd #txt
ix0 f3 path documents #txt
ix0 f3 queryParams 'extract=true;
' #txt
ix0 f3 templateParams 'host=;
' #txt
ix0 f3 method POST #txt
ix0 f3 bodyInputType FORM #txt
ix0 f3 bodyMediaType multipart/form-data #txt
ix0 f3 bodyForm 'file=in.file;
msName=ivy.var.get("intellix-connector.msName");
' #txt
ix0 f3 resultType com.docuware.dev._public.services.intellix.FeedbackMessage #txt
ix0 f3 responseMapping 'out.indexData=result.indexData;;
' #txt
ix0 f3 responseCode 'ivy.log.info("recognized field count: "+result.indexData.getField().size());' #txt
ix0 f3 clientErrorCode ivy:error:rest:client #txt
ix0 f3 statusErrorCode ivy:error:rest:client #txt
ix0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>intellix</name>
    </language>
</elementInfo>
' #txt
ix0 f3 168 42 112 44 -19 -7 #rect
ix0 f4 111 64 168 64 #arcP
ix0 f2 280 64 337 64 #arcP
>Proto ix0 .type com.axonivy.connector.intellix.intellixData #txt
>Proto ix0 .processKind CALLABLE_SUB #txt
>Proto ix0 0 0 32 24 18 0 #rect
>Proto ix0 @|BIcon #fIcon
ix0 f0 mainOut f4 tail #connect
ix0 f4 head f3 mainIn #connect
ix0 f3 mainOut f2 tail #connect
ix0 f2 head f1 mainIn #connect
