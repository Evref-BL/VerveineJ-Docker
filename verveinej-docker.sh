#!/bin/bash
JAVA_XMX_OPTION=${JAVA_XMX:--Xmx2G}
java $JAVA_XMX_OPTION -jar /VerveineJ.jar $@ -autocp /dependency .
