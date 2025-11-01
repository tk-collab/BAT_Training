# ================================
# 自動パケットキャプチャスクリプト
# ================================
# 1. 日付付きフォルダを作成
# 2. tsharkで一定時間キャプチャ
# 3. ログをzip化して保存
# ================================

$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$saveDir = "$env:USERPROFILE\OneDrive\ドキュメント\ITハンズオン\BAT_Training\$timestamp"
New-Item -ItemType Directory -Force -Path $saveDir | Out-Null

# キャプチャ時間（秒）
$duration = 60

# ネットワークインターフェース番号の確認
# tshark -D で一覧を出せる（例：1）
$interface = 5

$TsharkPath = "C:\Program Files\Wireshark\tshark.exe"  # tshark.exeの絶対パス

Write-Host "Starting capture for $duration seconds..."
Start-Process -FilePath $TsharkPath -ArgumentList "-i $interface -a duration:$duration -w `"$saveDir\capture.pcapng`"" -Wait

# 圧縮
$zipFile = "$saveDir.zip"
Compress-Archive -Path $saveDir -DestinationPath $zipFile

# 元フォルダ削除
Remove-Item -Recurse -Force $saveDir

Write-Host "Capture saved to $zipFile"