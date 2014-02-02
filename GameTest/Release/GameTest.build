set PATH=C:\Program Files\Microsoft SDKs\Windows\v7.0A\\bin;%PATH%
dmd -release -X -Xf"Release\GameTest.json" -deps="Release\GameTest.dep" -c -of"Release\GameTest.obj" main.d
if errorlevel 1 goto reportError

set LIB=
echo. > Release\GameTest.build.lnkarg
echo "Release\GameTest.obj","Release\GameTest.exe","Release\GameTest.map",user32.lib+ >> Release\GameTest.build.lnkarg
echo kernel32.lib/NOMAP/NOI >> Release\GameTest.build.lnkarg

"D:\dev\denv\visuald\pipedmd.exe" -deps Release\GameTest.lnkdep link.exe @Release\GameTest.build.lnkarg
if errorlevel 1 goto reportError
if not exist "Release\GameTest.exe" (echo "Release\GameTest.exe" not created! && goto reportError)

goto noError

:reportError
echo Building Release\GameTest.exe failed!

:noError
