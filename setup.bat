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

@REM Prompt before deleting the setup folder
set /p DELCONFIRM=Do you want to delete the setup folder? (y/n):
if /i "%DELCONFIRM%"=="y" (
    cd ..
    rmdir /s /q "vscode-setup"
    echo Setup folder deleted.
) else (
    echo Setup folder retained.
)

pause
