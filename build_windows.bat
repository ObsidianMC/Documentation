cd _obsidian
dotnet build
xcopy .\Obsidian.API\bin\Debug\net6.0\ ..\src\ /e /y
cd ../
docfx --serve
break