
format PE64 GUI
entry start

include 'win64a.inc'

section '.text' code readable executable

start:
        sub rsp, 8

main:
        invoke MessageBoxA, NULL, msgtext, title, MB_OK

exit:
        invoke ExitProcess, 0

section '.data' data readable writeable

title   db "Win64AsmTest", 0
msgtext db "Hello! This is a test.", 0x0D, 0x0A
        db 0x0D, 0x0A
        db "This example contains an embedded manifest", 0x0D, 0x0A
        db "that enables visual styles.", 0

section '.idata' import data readable writeable

library kernel, 'KERNEL32.DLL',\
        user,   'USER32.DLL'

import  kernel,\
        ExitProcess, 'ExitProcess'

import  user,\
        MessageBoxA, 'MessageBoxA'

section '.rsrc' resource data readable

directory RT_MANIFEST, manifest

resource manifest, 1, LANG_NEUTRAL, manifestfile

resdata manifestfile
        file 'manifest.xml'
endres