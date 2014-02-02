set PATH=C:\D\dmd2\windows\\bin;C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\\\bin;%PATH%
"C:\Program Files (x86)\VisualD\pipedmd.exe" dmd -lib -release -X -Xf"Release\Math.json" -deps="Release\Math.dep" -of"Release\Math.lib" -map "Release\Math.map" -L/NOMAP Point.d
if errorlevel 1 goto reportError
if not exist "Release\Math.lib" (echo "Release\Math.lib" not created! && goto reportError)

goto noError

:reportError
echo Building Release\Math.lib failed!

:noError
