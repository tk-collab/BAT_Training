<#
Start-Process "C:\Program Files\WindowsApps\OpenAI.ChatGPT-Desktop_1.2025.258.0_x64__2p2nqsd0c76g0\app\ChatGPT.exe"
Start-Sleep -Seconds 2

Add-Type @"
using System;
using System.Runtime.InteropServices;

public class Win {
    [DllImport("user32.dll")]
    public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);

    [DllImport("user32.dll")]
    public static extern bool SetForegroundWindow(IntPtr hWnd);
}
"@

$proc = Get-Process | Where-Object { $_.ProcessName -like 'ChatGPT*' -and $_.MainWindowHandle -ne 0 }
if ($proc) {
    [Win]::SetForegroundWindow($proc.MainWindowHandle)
    [Win]::ShowWindowAsync($proc.MainWindowHandle, 3)  # 3 = SW_MAXIMIZE
}
#>
# $PwaShortcutPath = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge_proxy.exe"  --profile-directory=Default --app-id=cadlkienfkclaiaibeoongdcgmdikeeg --app-url=https://chatgpt.com/ --app-run-on-os-login-mode=windowed --app-launch-source=19
# Start-Process -FilePath $PwaShortcutPath

# $EdgeExe = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
# $AppId = "--app-id=cadlkienfkclaiaibeoongdcgmdikeeg" 
# Start-Process -FilePath $EdgeExe -ArgumentList $AppId -WindowStyle Maximized

# # 1. 変数定義
# $EdgeExe = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
# $AppId_ChatGpt = "--app-id=cadlkienfkclaiaibeoongdcgmdikeeg" # ここは実際のChatGPT PWAのApp IDに置き換えてください
# $PwaWindowTitle = "ChatGPT"                # PWAの正確なウィンドウタイトルに置き換えてください

# # 2. PWAを通常起動
# # WindowStyleを付けずに起動します
# Start-Process -FilePath $EdgeExe -ArgumentList $AppId_ChatGpt

# # 3. 最大化を確実にするための処理

# # Edge PWAが完全に起動するまで待機（3秒推奨、環境により調整）
# Start-Sleep -Seconds 5

# # WScript.Shellオブジェクトを作成し、ウィンドウを操作する
# $WShell = New-Object -ComObject WScript.Shell

# # ウィンドウタイトルでPWAをアクティブにする
# # 成功すれば $true が返る。アクティブ化できないとSendKeysは失敗します。
# if ($WShell.AppActivate($PwaWindowTitle)) {
#     Write-Host "ウィンドウをアクティブ化しました: $PwaWindowTitle"

#     # ウィンドウを最大化するキー操作を送信
#     # Alt+Space (システムメニューを開く) -> X (最大化)
#     # Windowsの標準的なショートカットキーで最大化を強制します。
#     $WShell.SendKeys("% x")
#     Write-Host "最大化コマンドを送信しました。"
# } else {
#     Write-Warning "ウィンドウタイトル '$PwaWindowTitle' が見つかりませんでした。タイトルが正確か確認してください。"
# }

# =======================================================
# 1. 起動と待機 (ChatGPT PWA用)
# =======================================================
$EdgeExe = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" 
# ?? 実際のApp IDに置き換えてください ??
$AppId_ChatGpt = "--app-id=cadlkienfkclaiaibeoongdcgmdikeeg" 

# 起動引数はシンプルな形式に戻します
Start-Process -FilePath $EdgeExe -ArgumentList $AppId_ChatGpt
Start-Sleep -Seconds 7 # 待機時間

# =======================================================
# 2. Win32 APIの定義
# =======================================================
# ShowWindowAsync (最大化) と SetForegroundWindow (最前面化) のAPIを読み込む
Add-Type @"
using System;
using System.Runtime.InteropServices;

public class Win {
    [DllImport("user32.dll")]
    public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);

    [DllImport("user32.dll")]
    public static extern bool SetForegroundWindow(IntPtr hWnd);
}
"@

# =======================================================
# 3. 強制最大化実行
# =======================================================
$PwaWindowTitle = "ChatGPT" 
# msedgeプロセスの中から、タイトルに 'ChatGPT' を含むものを探す
$proc = Get-Process | Where-Object { 
    $_.ProcessName -like 'msedge*' -and 
    $_.MainWindowHandle -ne 0 -and 
    $_.MainWindowTitle -like "*$PwaWindowTitle*"
}

if ($proc) {
    # 複数見つかった場合は最初のウィンドウを最大化
    $TargetProc = $proc | Select-Object -First 1
    
    # 1. 最前面に移動 (アクティブ化)
    [Win]::SetForegroundWindow($TargetProc.MainWindowHandle) 
    # 2. 最大化を強制 (3 = SW_MAXIMIZE)
    [Win]::ShowWindowAsync($TargetProc.MainWindowHandle, 3)
    Write-Host "ChatGPT PWAを強制最大化しました。"
} else {
    Write-Warning "ChatGPT PWAのウィンドウが見つかりませんでした。タイトルと待機時間を確認してください。"
}

# # =======================================================
# # 1. 変数の定義 (Edge PWA用)
# # =======================================================

# # Edgeの実行ファイルパス
# $EdgeExe = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge_proxy.exe" 

# # ?? 実際のApp IDに置き換えてください ??
# $AppId_ChatGpt = "--app-id=cadlkienfkclaiaibeoongdcgmdikeeg"

# # ?? 手動で確認した正確なウィンドウタイトルに置き換えてください ??
# $PwaWindowTitle = "ChatGPT" 

# # =======================================================
# # 2. Edge PWAを起動（引数を単一文字列で結合）
# # =======================================================

# Write-Host "ChatGPT PWAを起動中..."

# # 1. ArgumentListに App ID, 強制サイズ, 最大化指示 の3つを渡す
# Start-Process -FilePath $EdgeExe -ArgumentList $AppId_ChatGpt

# # PWAの起動を待つ時間
# $WaitTime = 5 # 5秒に延長して試すことを推奨

# # =======================================================
# # 強制最大化処理（タスクバー操作に切り替え）
# # =======================================================
# $WaitTime = 7 # 待機時間を7秒に延長して試してください

# Write-Host "起動まで $WaitTime 秒待機します..."
# Start-Sleep -Seconds $WaitTime

# # WScript.Shellオブジェクトを作成
# $WShell = New-Object -ComObject WScript.Shell

# # ? PWAのタイトルで検索（あいまい検索）
# $PwaWindowTitle = "ChatGPT" # 既に成功しているタイトルを使用

# $EdgeProcesses = Get-Process -Name msedge | Where-Object { $_.MainWindowTitle -like "*$PwaWindowTitle*" }

# if ($EdgeProcesses) {
#     Write-Host "PWAのプロセスを認識しました。"
    
#     foreach ($P in $EdgeProcesses) {
#         # 1. 強制的にウィンドウをアクティブ化し、最前面に持ってくる
#         $P.WaitForInputIdle() | Out-Null # プロセスがアイドル状態になるのを待つ
        
#         # Win32 APIを使わずに、WScript.Shellで強制的にアクティブ化を試行
#         # 警告が出なかったため、このタイトルでアクティブ化できるはず
#         if ($WShell.AppActivate($PwaWindowTitle)) {
#             Write-Host "ウィンドウをアクティブ化しました。"
            
#             # 2. Alt + Space, X (最大化) のキーを送信
#             # これが失敗していたため、キー送信を確実にするために再試行
#             $WShell.SendKeys("% x")
#             Write-Host "最大化コマンドを送信しました。"
#         } else {
#              Write-Warning "アクティブ化に失敗しましたが、プロセスは存在します。"
#         }
#     }
# } else {
#     Write-Warning "指定されたPWAウィンドウが見つかりませんでした。"
# }

$ChromeExe = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$AppId_Keep = "--app-id=eilembjdkfgodjkcjnpgpaenohkicgjd"
Start-Process -FilePath $ChromeExe -ArgumentList $AppId_Keep -WindowStyle Maximized
$AppId_Translate = "--app-id=edanbjnaiofggfmimiidpfmhggkbokck"
Start-Process -FilePath $ChromeExe -ArgumentList $AppId_Translate -WindowStyle Maximized

Start-Process "C:\Users\katot\AppData\Local\AnthropicClaude\claude.exe"
Start-Sleep -Seconds 5

Add-Type @"
using System;
using System.Runtime.InteropServices;

public class Win {
    [DllImport("user32.dll")]
    public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);

    [DllImport("user32.dll")]
    public static extern bool SetForegroundWindow(IntPtr hWnd);
}
"@

$proc = Get-Process | Where-Object { $_.ProcessName -like 'claude*' -and $_.MainWindowHandle -ne 0 }
if ($proc) {
    [Win]::SetForegroundWindow($proc.MainWindowHandle)
    [Win]::ShowWindowAsync($proc.MainWindowHandle, 3)  # 3 = SW_MAXIMIZE
}

# $proc = Get-Process | Where-Object { $_.ProcessName -like 'ChatGPT*' -and $_.MainWindowHandle -ne 0 }
# if ($proc) {
#     [Win]::SetForegroundWindow($proc.MainWindowHandle)
#     [Win]::ShowWindowAsync($proc.MainWindowHandle, 3)  # 3 = SW_MAXIMIZE
# }