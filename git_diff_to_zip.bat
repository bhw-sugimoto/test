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

:: 差分ファイル名を設定（.txt形式）
set diff_file=%commit1%_to_%commit2%.txt

:: 差分を取得してテキストファイルに保存
echo Generating diff between %commit1% and %commit2%...
git diff %commit1% %commit2% > %diff_file%

:: 結果表示
if exist %diff_file% (
    echo Diff successfully saved to %diff_file%
) else (
    echo Error occurred while generating diff.
)

:: 終了
endlocal
