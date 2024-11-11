@echo off
setlocal

:: 引数が正しく渡されているか確認
if "%SHA%"=="" (
    echo Error: SHA is empty
    exit /b
)
if "%FILE%"=="" (
    echo Error: FILE is empty
    exit /b
)

:: 出力ファイルが正しいディレクトリに作成されるか確認
set OUTPUT_DIR=%USERPROFILE%\Desktop
set DIFF_FILE=%OUTPUT_DIR%\diff_%SHA%.txt

:: Gitコマンド実行
git diff "%SHA%^" "%SHA%" -- "%FILE%" > "%DIFF_FILE%"

:: 結果の確認
if exist "%DIFF_FILE%" (
    echo Diff saved to "%DIFF_FILE%"
) else (
    echo Error occurred while generating diff.
)

endlocal
