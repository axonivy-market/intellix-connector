[Ivy]
1816266FC8F333CC 9.3.1 #module
>Proto >Proto Collection #zClass
io0 intellixDemo Big #zClass
io0 B #cInfo
io0 #process
io0 @AnnotationInP-0n ai ai #zField
io0 @TextInP .type .type #zField
io0 @TextInP .processKind .processKind #zField
io0 @TextInP .xml .xml #zField
io0 @TextInP .responsibility .responsibility #zField
io0 @StartRequest f0 '' #zField
io0 @EndTask f1 '' #zField
io0 @RestClientCall f3 '' #zField
io0 @PushWFArc f2 '' #zField
io0 @GridStep f6 '' #zField
io0 @PushWFArc f7 '' #zField
io0 @PushWFArc f4 '' #zField
>Proto io0 io0 intellixDemo #zField
io0 f0 outLink uploadSampleInvoice.ivp #txt
io0 f0 inParamDecl '<> param;' #txt
io0 f0 requestEnabled true #txt
io0 f0 triggerEnabled false #txt
io0 f0 callSignature uploadSampleInvoice() #txt
io0 f0 caseData businessCase.attach=true #txt
io0 f0 @CG|tags demo #txt
io0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>uploadSampleInvoice.ivp</name>
    </language>
</elementInfo>
' #txt
io0 f0 @C|.responsibility Everybody #txt
io0 f0 81 49 30 30 -25 17 #rect
io0 f1 497 49 30 30 0 15 #rect
io0 f3 clientId a3fb2ba0-71ab-49a6-82fe-bb0c202b38bd #txt
io0 f3 path documents #txt
io0 f3 queryParams 'extract=true;
' #txt
io0 f3 templateParams 'host=;
' #txt
io0 f3 headers 'Accept=application/json;
' #txt
io0 f3 method POST #txt
io0 f3 bodyInputType FORM #txt
io0 f3 bodyMediaType multipart/form-data #txt
io0 f3 bodyForm 'file=in.file;
msName="Default_axonivy";
' #txt
io0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>send invoice
</name>
    </language>
</elementInfo>
' #txt
io0 f3 328 42 112 44 -39 -15 #rect
io0 f2 440 64 497 64 #arcP
io0 f6 actionTable 'out=in;
' #txt
io0 f6 actionCode 'import com.axonivy.connector.intellix.FileLoaderUtil;
out.file = FileLoaderUtil.loadFromWebContent("sample/rechnung.pdf");' #txt
io0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>load sample
invoice</name>
    </language>
</elementInfo>
' #txt
io0 f6 168 42 112 44 -38 -15 #rect
io0 f7 111 64 168 64 #arcP
io0 f4 280 64 328 64 #arcP
>Proto io0 .type com.axonivy.connector.intellix.demo.Data #txt
>Proto io0 .processKind NORMAL #txt
>Proto io0 0 0 32 24 18 0 #rect
>Proto io0 @|BIcon #fIcon
io0 f3 mainOut f2 tail #connect
io0 f2 head f1 mainIn #connect
io0 f0 mainOut f7 tail #connect
io0 f7 head f6 mainIn #connect
io0 f6 mainOut f4 tail #connect
io0 f4 head f3 mainIn #connect
