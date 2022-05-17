#!/bin/sh
VERSION=v0.8.7

case "$(uname -s)" in

   Darwin)
     echo 'Mac OS X'
     wget -qcO /tmp/upterm https://github.com/corvofeng/upterm/releases/download/${VERSION}/upterm_darwin_amd64
     ;;

   Linux)
     echo 'Linux'
     wget -qcO /tmp/upterm https://github.com/corvofeng/upterm/releases/download/${VERSION}/upterm_linux_amd64
     ;;

   CYGWIN*|MINGW32*|MSYS*|MINGW*)
     echo 'MS Windows'
     echo "upterm doesn't support windows"
     exit 0
     ;;

   # Add here more strings to compare
   # See correspondence table at the bottom of this answer

   *)
     echo 'Other OS' 
     ;;
esac

chmod +x /tmp/upterm
/tmp/upterm host --vscode --verify-host-key=false --server $UPTERMD_SERVER bash
