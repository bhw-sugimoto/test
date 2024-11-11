@echo off
:: 引数として2つのコミットSHAを受け取る
set SHA1=%1
set SHA2=%2

:: 出力先ディレクトリをデスクトップに設定
set OUTPUT_DIR=%USERPROFILE%\Desktop\export_diff
set OUTPUT_FILE=%OUTPUT_DIR%\diff_output.txt

:: 出力先ディレクトリが存在しない場合は作成
if not exist "%OUTPUT_DIR%" (
    mkdir "%OUTPUT_DIR%"
)

:: 現在のGitリポジトリに移動
pushd %~dp0

:: git diffコマンドで差分を取得してファイルに出力
git diff %SHA1% %SHA2% > "%OUTPUT_FILE%"

:: 結果を表示
echo 差分がファイルに出力されました: %OUTPUT_FILE%

:: リポジトリのルートディレクトリに戻る
popd

pause
