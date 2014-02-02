set PATH=C:\Program Files\Microsoft SDKs\Windows\v7.0A\\bin;%PATH%
"D:\dev\denv\visuald\pipedmd.exe" dmd -lib -release -X -Xf"Release\Primitives.json" -deps="Release\Primitives.dep" -of"Release\Primitives.lib" -map "Release\Primitives.map" -L/NOMAP
if errorlevel 1 goto reportError
if not exist "Release\Primitives.lib" (echo "Release\Primitives.lib" not created! && goto reportError)

goto noError

:reportError
echo Building Release\Primitives.lib failed!

:noError
