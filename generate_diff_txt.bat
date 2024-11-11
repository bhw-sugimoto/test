@echo off
setlocal

:: 引数として渡されたパラメータを取得
set REPO=%1
set FILE=%2
set SHA=%3

:: 出力先ディレクトリ（絶対パスを指定）
set output_dir=%USERPROFILE%\Desktop\GitDiffs

:: 差分を保存するファイル名を設定
set diff_file=%output_dir%\diff_%SHA%.txt

:: リポジトリに移動して差分を取得
git -C %REPO% diff %SHA^ %SHA% -- %FILE% > %diff_file%

:: 結果を表示
if exist %diff_file% (
    echo Diff saved to %diff_file%
) else (
    echo Error occurred while generating diff.
)

endlocal
