[Ivy]
181662ECBD4C4BD8 9.3.1 #module
>Proto >Proto Collection #zClass
Ds0 DocUploaderProcess Big #zClass
Ds0 RD #cInfo
Ds0 #process
Ds0 @AnnotationInP-0n ai ai #zField
Ds0 @TextInP .type .type #zField
Ds0 @TextInP .processKind .processKind #zField
Ds0 @TextInP .xml .xml #zField
Ds0 @TextInP .responsibility .responsibility #zField
Ds0 @UdInit f0 '' #zField
Ds0 @UdProcessEnd f1 '' #zField
Ds0 @PushWFArc f2 '' #zField
Ds0 @UdEvent f3 '' #zField
Ds0 @UdExitEnd f4 '' #zField
Ds0 @PushWFArc f5 '' #zField
Ds0 @GridStep f16 '' #zField
Ds0 @UdEvent f13 '' #zField
Ds0 @UdProcessEnd f14 '' #zField
Ds0 @PushWFArc f17 '' #zField
Ds0 @PushWFArc f6 '' #zField
>Proto Ds0 Ds0 DocUploaderProcess #zField
Ds0 f0 guid 181662ECBD94F944 #txt
Ds0 f0 method start() #txt
Ds0 f0 inParameterDecl '<> param;' #txt
Ds0 f0 outParameterDecl '<File file> result;' #txt
Ds0 f0 outParameterMapAction 'result.file=in.ivyFile;
' #txt
Ds0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start()</name>
    </language>
</elementInfo>
' #txt
Ds0 f0 83 51 26 26 -20 15 #rect
Ds0 f1 211 51 26 26 0 12 #rect
Ds0 f2 109 64 211 64 #arcP
Ds0 f3 guid 181662ECBDEE9EF1 #txt
Ds0 f3 actionTable 'out=in;
' #txt
Ds0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Ds0 f3 83 147 26 26 -16 15 #rect
Ds0 f4 211 147 26 26 0 12 #rect
Ds0 f5 109 160 211 160 #arcP
Ds0 f16 actionTable 'out=in;
out.showContent=false;
' #txt
Ds0 f16 actionCode 'in.filePath = in.ivyFile.getAbsolutePath();' #txt
Ds0 f16 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>set file content and name</name>
        <nameStyle>25,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Ds0 f16 192 218 144 44 -69 -8 #rect
Ds0 f16 -1|-1|-9671572 #nodeStyle
Ds0 f13 guid 181663EB6213B834 #txt
Ds0 f13 actionTable 'out=in;
' #txt
Ds0 f13 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>fileUpload</name>
    </language>
</elementInfo>
' #txt
Ds0 f13 91 227 26 26 -28 12 #rect
Ds0 f13 -1|-1|-9671572 #nodeStyle
Ds0 f14 411 227 26 26 0 12 #rect
Ds0 f14 -1|-1|-9671572 #nodeStyle
Ds0 f17 expr out #txt
Ds0 f17 117 240 192 240 #arcP
Ds0 f6 expr out #txt
Ds0 f6 264 218 224 173 #arcP
>Proto Ds0 .type com.axonivy.connector.intellix.demo.DocUploader.DocUploaderData #txt
>Proto Ds0 .processKind HTML_DIALOG #txt
>Proto Ds0 -8 -8 16 16 16 26 #rect
Ds0 f0 mainOut f2 tail #connect
Ds0 f2 head f1 mainIn #connect
Ds0 f3 mainOut f5 tail #connect
Ds0 f5 head f4 mainIn #connect
Ds0 f13 mainOut f17 tail #connect
Ds0 f17 head f16 mainIn #connect
Ds0 f16 mainOut f6 tail #connect
Ds0 f6 head f4 mainIn #connect
