@echo off
setlocal

:: コミット引数の確認
if "%~2"=="" (
    echo Usage: %0 <commit1> <commit2>
    exit /b 1
)

:: 引数からコミットハッシュを取得
set commit1=%1
set commit2=%2

:: 出力ファイルの名前設定
set patchfile=%commit1%_to_%commit2%.patch
set zipfile=%commit1%_to_%commit2%.zip

:: 差分の出力
echo Generating diff between %commit1% and %commit2%...
git diff %commit1% %commit2% > %patchfile%

:: 差分をZIPに圧縮
echo Compressing patch file into ZIP...
powershell -Command "Compress-Archive -Path '%patchfile%' -DestinationPath '%zipfile%'"

:: 結果表示
if exist %zipfile% (
    echo Diff successfully saved and compressed to %zipfile%
) else (
    echo Error occurred during compression.
)

:: 終了
endlocal
