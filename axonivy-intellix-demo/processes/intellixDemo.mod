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
io0 @GridStep f6 '' #zField
io0 @PushWFArc f7 '' #zField
io0 @GridStep f5 '' #zField
io0 @CallSub f3 '' #zField
io0 @PushWFArc f4 '' #zField
io0 @PushWFArc f8 '' #zField
io0 @StartRequest f9 '' #zField
io0 @UserDialog f10 '' #zField
io0 @PushWFArc f11 '' #zField
io0 @PushWFArc f12 '' #zField
io0 @UserDialog f13 '' #zField
io0 @PushWFArc f14 '' #zField
io0 @PushWFArc f2 '' #zField
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
io0 f0 81 49 30 30 -63 20 #rect
io0 f1 369 369 30 30 0 15 #rect
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
io0 f5 actionTable 'out=in;
' #txt
io0 f5 actionCode 'import com.docuware.dev._public.services.intellix.Field;

StringBuilder sb = new StringBuilder();
for(Field field : in.indexed.indexData.getField()){
  sb.append(field.getName())
    .append("=")
    .append(field.getValue().get(0).getText())
    .append("\n");
}
ivy.log.info("got fields:"+sb.toString());' #txt
io0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>log recoginzed
fields</name>
    </language>
</elementInfo>
' #txt
io0 f5 320 170 128 44 -42 -15 #rect
io0 f3 processCall intellix:call(java.io.File) #txt
io0 f3 requestActionDecl '<java.io.File file> param;' #txt
io0 f3 requestMappingAction 'param.file=in.file.getJavaFile();
' #txt
io0 f3 responseMappingAction 'out=in;
out.indexed.indexData=result.indexData;
' #txt
io0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>intellix</name>
    </language>
</elementInfo>
' #txt
io0 f3 328 42 112 44 -19 -7 #rect
io0 f4 280 64 328 64 #arcP
io0 f8 384 86 384 170 #arcP
io0 f9 outLink uploadInvoice.ivp #txt
io0 f9 inParamDecl '<> param;' #txt
io0 f9 requestEnabled true #txt
io0 f9 triggerEnabled false #txt
io0 f9 callSignature uploadInvoice() #txt
io0 f9 caseData businessCase.attach=true #txt
io0 f9 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>uploadInvoice.ivp</name>
    </language>
</elementInfo>
' #txt
io0 f9 @C|.responsibility Everybody #txt
io0 f9 81 177 30 30 -52 15 #rect
io0 f10 dialogId com.axonivy.connector.intellix.demo.DocUploader #txt
io0 f10 startMethod start() #txt
io0 f10 requestActionDecl '<> param;' #txt
io0 f10 responseMappingAction 'out=in;
out.file=result.file;
' #txt
io0 f10 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>DocUploader</name>
    </language>
</elementInfo>
' #txt
io0 f10 168 170 112 44 -40 -7 #rect
io0 f11 111 192 168 192 #arcP
io0 f12 224 170 384 86 #arcP
io0 f13 dialogId com.axonivy.connector.intellix.demo.InvoiceViewer #txt
io0 f13 startMethod start(com.axonivy.connector.intellix.demo.Data) #txt
io0 f13 requestActionDecl '<com.axonivy.connector.intellix.demo.Data invoice> param;' #txt
io0 f13 requestMappingAction 'param.invoice=in;
' #txt
io0 f13 responseMappingAction 'out=in;
' #txt
io0 f13 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>DocumentViewer</name>
    </language>
</elementInfo>
' #txt
io0 f13 328 266 112 44 -52 -7 #rect
io0 f14 384 214 384 266 #arcP
io0 f2 384 310 384 369 #arcP
>Proto io0 .type com.axonivy.connector.intellix.demo.Data #txt
>Proto io0 .processKind NORMAL #txt
>Proto io0 0 0 32 24 18 0 #rect
>Proto io0 @|BIcon #fIcon
io0 f0 mainOut f7 tail #connect
io0 f7 head f6 mainIn #connect
io0 f6 mainOut f4 tail #connect
io0 f4 head f3 mainIn #connect
io0 f3 mainOut f8 tail #connect
io0 f8 head f5 mainIn #connect
io0 f9 mainOut f11 tail #connect
io0 f11 head f10 mainIn #connect
io0 f10 mainOut f12 tail #connect
io0 f12 head f3 mainIn #connect
io0 f5 mainOut f14 tail #connect
io0 f14 head f13 mainIn #connect
io0 f13 mainOut f2 tail #connect
io0 f2 head f1 mainIn #connect
