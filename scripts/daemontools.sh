#!/bin/sh
yum -y install gcc

mkdir -p /package
chmod 1755 /package
cd /package
wget http://cr.yp.to/daemontools/daemontools-0.76.tar.gz
tar xvzf daemontools-0.76.tar.gz
cd admin/daemontools-0.76/
patch -p 1 <<EOF
diff -ur daemontools-0.76.old/src/error.h daemontools-0.76/src/error.h
--- daemontools-0.76.old/src/error.h	2001-07-12 11:49:49.000000000 -0500
+++ daemontools-0.76/src/error.h	2003-01-09 21:52:01.000000000 -0600
@@ -3,7 +3,7 @@
 #ifndef ERROR_H
 #define ERROR_H
 
-extern int errno;
+#include <errno.h>
 
 extern int error_intr;
 extern int error_nomem;
EOF
./package/install 

