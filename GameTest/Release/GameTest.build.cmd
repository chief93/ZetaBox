set PATH=C:\D\dmd2\windows\\bin;C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\\\bin;%PATH%
dmd -release -X -Xf"Release\GameTest.json" -deps="Release\GameTest.dep" -c -of"Release\GameTest.obj" main.d
if errorlevel 1 goto reportError

set LIB="C:\D\dmd2\windows\bin\..\lib"
echo. > Release\GameTest.build.lnkarg
echo "Release\GameTest.obj","Release\GameTest.exe","Release\GameTest.map",user32.lib+ >> Release\GameTest.build.lnkarg
echo kernel32.lib/NOMAP/NOI >> Release\GameTest.build.lnkarg

"C:\Program Files (x86)\VisualD\pipedmd.exe" -deps Release\GameTest.lnkdep C:\D\dmd2\windows\bin\link.exe @Release\GameTest.build.lnkarg
if errorlevel 1 goto reportError
if not exist "Release\GameTest.exe" (echo "Release\GameTest.exe" not created! && goto reportError)

goto noError

:reportError
echo Building Release\GameTest.exe failed!

:noError
