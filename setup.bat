@REM  Applies settings, keybindings, snippets and extensions
@REM  to the user environment, located at %APPDATA%\Code\User


@echo off
set VSCODE_USER_DIR=%APPDATA%\Code\User

echo Applying VSCode settings...
mkdir "%VSCODE_USER_DIR%" 2>nul
copy settings.json "%VSCODE_USER_DIR%" /Y
copy keybindings.json "%VSCODE_USER_DIR%" /Y

echo Copying snippets...
xcopy /E /I /Y snippets "%VSCODE_USER_DIR%\snippets"

echo Installing extensions...
for /f %%e in (extensions.list) do (
    echo Installing %%e...
    code --install-extension %%e
)

echo VSCode setup applied successfully!

@REM @REM Prompt before deleting the setup folder
@REM set /p DELCONFIRM=Do you want to delete the setup folder? (y/n):
@REM if /i "%DELCONFIRM%"=="y" (
@REM     cd ..
@REM     rmdir /s /q "vscode-setup"
@REM     echo Setup folder deleted.
@REM ) else (
@REM     echo Setup folder retained.
@REM )

pause
