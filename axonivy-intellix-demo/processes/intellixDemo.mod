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
io0 @PushWFArc f4 '' #zField
io0 @PushWFArc f2 '' #zField
>Proto io0 io0 intellixDemo #zField
io0 f0 outLink start.ivp #txt
io0 f0 inParamDecl '<> param;' #txt
io0 f0 requestEnabled true #txt
io0 f0 triggerEnabled false #txt
io0 f0 callSignature start() #txt
io0 f0 caseData businessCase.attach=true #txt
io0 f0 @CG|tags demo #txt
io0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start.ivp</name>
    </language>
</elementInfo>
' #txt
io0 f0 @C|.responsibility Everybody #txt
io0 f0 81 49 30 30 -25 17 #rect
io0 f1 337 49 30 30 0 15 #rect
io0 f3 168 42 112 44 0 -7 #rect
io0 f4 111 64 168 64 #arcP
io0 f2 280 64 337 64 #arcP
>Proto io0 .type com.axonivy.connector.intellix.demo.Data #txt
>Proto io0 .processKind NORMAL #txt
>Proto io0 0 0 32 24 18 0 #rect
>Proto io0 @|BIcon #fIcon
io0 f0 mainOut f4 tail #connect
io0 f4 head f3 mainIn #connect
io0 f3 mainOut f2 tail #connect
io0 f2 head f1 mainIn #connect
