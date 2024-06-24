@echo off
setlocal enabledelayedexpansion
echo Cleaning build assets...
rmdir /S /Q "%cd%\build\flutter_assets\assets\audio"
echo Build assets cleaned.

echo running app on Debug mode ...
flutter run -d windows -v .\test\test_air_wall.dart