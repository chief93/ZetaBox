set PATH=C:\Program Files\Microsoft SDKs\Windows\v7.0A\\bin;%PATH%
"D:\dev\denv\visuald\pipedmd.exe" dmd -lib -release -X -Xf"Release\Core.json" -deps="Release\Core.dep" -of"Release\Core.lib" -map "Release\Core.map" -L/NOMAP GameObject.d Positioning.d
if errorlevel 1 goto reportError
if not exist "Release\Core.lib" (echo "Release\Core.lib" not created! && goto reportError)

goto noError

:reportError
echo Building Release\Core.lib failed!

:noError
