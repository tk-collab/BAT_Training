# BAT_Training
Create BAT file for both learning one and practical task.

## 1. 目的  
社内ITサポートや運用保守などで利用されるBATファイルを練習するとともに実タスクでも重宝するサンプルファイルを作成する。
## 2. 成果物  
### (i). PC起動時及びオンデマンドで実行できる環境セットアップBAT(StartUpSet.bat)
"設定>StartUp"では実現できない特定タブ、新規ウィンドウの立ち上げなど。  
<メモ>：/MAXで画面最大化等。
### (ii). タスクスケジューラー管理のDownloadフォルダの古いファイル自動削除(TidyUpDownloadFolder.bat)  
90日以上前のファイルを"一次退避"に移動し、さらにその中の270日以上前のファイルのファイルを削除
### (iii). Ping失敗に伴うWiresharkによるパケットキャプチャー自動処理
何か接続不具合があったときにバッチを実行するだけでping失敗の場合.pcapngファイルを取得する。
