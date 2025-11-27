RequestExecutionLevel user

Name "[NOMBRE_DEL_JUEGO]"
OutFile "[NOMBRE_INSTALADOR_EXE]"
InstallDir "$DESKTOP\[NOMBRE_CARPETA_JUEGO]"
ShowInstDetails hide 

!include "MUI2.nsh"
!include "..\Contrib\Language Files\Spanish.nsh"

!define MUI_FINISHPAGE_RUN
!define MUI_FINISHPAGE_RUN_TEXT "Ejecutar [NOMBRE_DEL_JUEGO]"
!define MUI_FINISHPAGE_RUN_COMMAND "$INSTDIR\[ARCHIVO_PRINCIPAL_EXE]"

LangString MUI_TEXT_WELCOME_INFO_TITLE ${LANG_SPANISH} "Bienvenido a la Instalación de ${NAME}"
LangString MUI_TEXT_FINISH_INFO_TITLE ${LANG_SPANISH} "Instalación Completada"
LangString MUI_TEXT_WELCOME_INFO_TEXT ${LANG_SPANISH} "Esta guía le ayudará a instalar ${NAME} en su equipo. Se recomienda cerrar todas las demás aplicaciones antes de continuar."

!define MUI_ABORTWARNING

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "[ARCHIVO_LICENCIA]"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

!insertmacro MUI_LANGUAGE "Spanish" 

Section "Instalación Principal" SecInstall
    SetShellVarContext current
    SetOutPath "$INSTDIR" 

    WriteUninstaller "$INSTDIR\Uninstaller.exe"
    
    ; PARA TUS ARCHIVOS DE GDEVELOP, USA ESTO:
    ; File /r "[CARPETA_ARCHIVOS_BUILD]\*"
    File "[ARCHIVO_PRINCIPAL_EXE]" 
    
    CreateShortCut "$DESKTOP\[NOMBRE_DEL_JUEGO].lnk" "$INSTDIR\[ARCHIVO_PRINCIPAL_EXE]" 
    
    CreateDirectory "$LOCALAPPDATA\[NOMBRE_CARPETA_JUEGO]\Saves"
SectionEnd

Section Uninstall
    SetShellVarContext current 
    
    Delete "$DESKTOP\[NOMBRE_DEL_JUEGO].lnk"
    Delete "$INSTDIR\Uninstaller.exe"
    
    ; ELIMINA TODOS TUS ARCHIVOS PRINCIPALES
    Delete "$INSTDIR\[ARCHIVO_PRINCIPAL_EXE]"
    
    RMDir "$INSTDIR"
    RMDir /r "$LOCALAPPDATA\[NOMBRE_CARPETA_JUEGO]" 
SectionEnd