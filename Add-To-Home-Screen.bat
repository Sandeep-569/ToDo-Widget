@echo off
setlocal
echo Creating Todo Widget shortcut on your Desktop (Home Screen)...

set SCRIPT="%TEMP%\CreateShortcut.vbs"
set DESKTOP=%USERPROFILE%\Desktop
set TARGET=msedge.exe
set HTMLPATH=file:///%~dp0index.html
set HTMLPATH=%HTMLPATH:\=/%

echo Set oWS = WScript.CreateObject("WScript.Shell") > %SCRIPT%
echo sLinkFile = "%DESKTOP%\Todo Widget.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%TARGET%" >> %SCRIPT%
echo oLink.Arguments = "--app=""%HTMLPATH%""" >> %SCRIPT%
echo oLink.Description = "Todo Widget - Sunset Purple" >> %SCRIPT%
echo oLink.WorkingDirectory = "%~dp0" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript //nologo %SCRIPT%
del %SCRIPT%

echo.
echo [DONE] "Todo Widget" shortcut has been created on your Desktop!
echo You can now double-click the icon on your Home Screen to open your standalone widget.
echo.
pause
