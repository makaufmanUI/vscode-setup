@REM  Applies settings, keybindings, snippets and extensions
@REM  to a test environment, located at %USERPROFILE%\vscode-test


@echo off
set TEST_DIR=%USERPROFILE%\vscode-test

echo Creating test directory: %TEST_DIR%
mkdir "%TEST_DIR%" 2>nul

echo Applying VSCode settings...
mkdir "%TEST_DIR%\User" 2>nul
copy settings.json "%TEST_DIR%\User\" /Y
copy keybindings.json "%TEST_DIR%\User\" /Y

echo Copying snippets...
xcopy /E /I /Y snippets "%TEST_DIR%\User\snippets"

echo Installing extensions (simulated)...
for /f %%e in (extensions.list) do (
    echo Simulating installation of %%e...
)

echo Test setup complete! Check the %TEST_DIR% directory.

@REM @REM Prompt before deleting the setup folder
@REM set /p DELCONFIRM=Do you want to delete the setup folder? (y/n):
@REM if /i "%DELCONFIRM%"=="y" (
@REM     cd ..
@REM     rmdir /s /q "vscode-setup"
@REM     echo Test setup folder deleted.
@REM ) else (
@REM     echo Test setup folder retained.
@REM )

pause
