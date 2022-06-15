[Ivy]
181666A7D6D4BAF2 9.3.1 #module
>Proto >Proto Collection #zClass
Is0 InvoiceViewerProcess Big #zClass
Is0 RD #cInfo
Is0 #process
Is0 @AnnotationInP-0n ai ai #zField
Is0 @TextInP .type .type #zField
Is0 @TextInP .processKind .processKind #zField
Is0 @TextInP .xml .xml #zField
Is0 @TextInP .responsibility .responsibility #zField
Is0 @UdInit f0 '' #zField
Is0 @UdProcessEnd f1 '' #zField
Is0 @UdEvent f3 '' #zField
Is0 @UdExitEnd f4 '' #zField
Is0 @PushWFArc f5 '' #zField
Is0 @GridStep f6 '' #zField
Is0 @PushWFArc f7 '' #zField
Is0 @PushWFArc f2 '' #zField
>Proto Is0 Is0 InvoiceViewerProcess #zField
Is0 f0 guid 181666A7DB2C0238 #txt
Is0 f0 method start(com.axonivy.connector.intellix.demo.Data) #txt
Is0 f0 inParameterDecl '<com.axonivy.connector.intellix.demo.Data invoice> param;' #txt
Is0 f0 inParameterMapAction 'out.invoice=param.invoice;
' #txt
Is0 f0 outParameterDecl '<> result;' #txt
Is0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start(Data)</name>
    </language>
</elementInfo>
' #txt
Is0 f0 83 51 26 26 -35 15 #rect
Is0 f1 339 51 26 26 0 12 #rect
Is0 f3 guid 181666A7DE7E5EFB #txt
Is0 f3 actionTable 'out=in;
' #txt
Is0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Is0 f3 83 147 26 26 -16 15 #rect
Is0 f4 211 147 26 26 0 12 #rect
Is0 f5 109 160 211 160 #arcP
Is0 f6 actionTable 'out=in;
' #txt
Is0 f6 168 42 112 44 0 -7 #rect
Is0 f7 109 64 168 64 #arcP
Is0 f2 280 64 339 64 #arcP
>Proto Is0 .type com.axonivy.connector.intellix.demo.InvoiceViewer.InvoiceViewerData #txt
>Proto Is0 .processKind HTML_DIALOG #txt
>Proto Is0 -8 -8 16 16 16 26 #rect
Is0 f3 mainOut f5 tail #connect
Is0 f5 head f4 mainIn #connect
Is0 f0 mainOut f7 tail #connect
Is0 f7 head f6 mainIn #connect
Is0 f6 mainOut f2 tail #connect
Is0 f2 head f1 mainIn #connect
