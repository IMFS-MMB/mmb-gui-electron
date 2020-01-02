!macro customInit
  ${If} ${FileExists} "$INSTDIR\Uninstall mmb-electron.exe"
    ExecShellWait /INVOKEIDLIST open "$INSTDIR\Uninstall mmb-electron.exe" "/currentuser /S"
  ${EndIf}
!macroend

!macro customInstall
  File "${BUILD_RESOURCES_DIR}\octave-installer.exe"
  File "${BUILD_RESOURCES_DIR}\dynare-installer.exe"

  ExecShellWait /INVOKEIDLIST open "$INSTDIR\octave-installer.exe" "/S"
  ExecShellWait /INVOKEIDLIST open "$INSTDIR\dynare-installer.exe" "/S"
!macroend
