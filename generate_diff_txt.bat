@echo off
setlocal

:: 引数として渡されたパラメータを取得
set REPO=%1
set FILE=%2
set SHA=%3

:: 差分を保存するファイル名を設定
set diff_file=%REPO%\diff_%SHA%.txt

:: 差分を取得してテキストファイルに保存
git -C %REPO% diff %SHA^ %SHA% -- %FILE% > %diff_file%

:: 結果を表示
if exist %diff_file% (
    echo Diff saved to %diff_file%
) else (
    echo Error occurred while generating diff.
)

endlocal
