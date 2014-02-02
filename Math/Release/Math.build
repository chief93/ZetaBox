set PATH=C:\Program Files\Microsoft SDKs\Windows\v7.0A\\bin;%PATH%
"D:\dev\denv\visuald\pipedmd.exe" dmd -lib -release -X -Xf"Release\Math.json" -deps="Release\Math.dep" -of"Release\Math.lib" -map "Release\Math.map" -L/NOMAP lib.d
if errorlevel 1 goto reportError
if not exist "Release\Math.lib" (echo "Release\Math.lib" not created! && goto reportError)

goto noError

:reportError
echo Building Release\Math.lib failed!

:noError
