!macro customInit
  ${If} ${FileExists} "$INSTDIR\Uninstall mmb-electron.exe"
    ExecShellWait \INVOKEIDLIST open "$INSTDIR\Uninstall mmb-electron.exe" "/currentuser /S"
  ${EndIf}
!macroend
