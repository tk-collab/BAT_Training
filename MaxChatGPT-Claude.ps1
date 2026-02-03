# # =======================================================
# # 1. 起動と待機 (ChatGPT PWA用)
# # =======================================================
# $EdgeExe = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" 
# # ?? 実際のApp IDに置き換えてください ??
# $AppId_ChatGpt = "--app-id=cadlkienfkclaiaibeoongdcgmdikeeg" 

# # 起動引数はシンプルな形式に戻します
# Start-Process -FilePath $EdgeExe -ArgumentList $AppId_ChatGpt
# Start-Sleep -Seconds 7 # 待機時間

# # =======================================================
# # 2. Win32 APIの定義
# # =======================================================
# # ShowWindowAsync (最大化) と SetForegroundWindow (最前面化) のAPIを読み込む
# Add-Type @"
# using System;
# using System.Runtime.InteropServices;

# public class Win {
#     [DllImport("user32.dll")]
#     public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);

#     [DllImport("user32.dll")]
#     public static extern bool SetForegroundWindow(IntPtr hWnd);
# }
# "@

# # =======================================================
# # 3. 強制最大化実行
# # =======================================================
# $PwaWindowTitle = "ChatGPT" 
# # msedgeプロセスの中から、タイトルに 'ChatGPT' を含むものを探す
# $proc = Get-Process | Where-Object { 
#     $_.ProcessName -like 'msedge*' -and 
#     $_.MainWindowHandle -ne 0 -and 
#     $_.MainWindowTitle -like "*$PwaWindowTitle*"
# }

# if ($proc) {
#     # 複数見つかった場合は最初のウィンドウを最大化
#     $TargetProc = $proc | Select-Object -First 1
    
#     # 1. 最前面に移動 (アクティブ化)
#     [Win]::SetForegroundWindow($TargetProc.MainWindowHandle) 
#     # 2. 最大化を強制 (3 = SW_MAXIMIZE)
#     [Win]::ShowWindowAsync($TargetProc.MainWindowHandle, 3)
#     Write-Host "ChatGPT PWAを強制最大化しました。"
# } else {
#     Write-Warning "ChatGPT PWAのウィンドウが見つかりませんでした。タイトルと待機時間を確認してください。"
# }

$ChromeExe = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$AppId_Keep = "--app-id=eilembjdkfgodjkcjnpgpaenohkicgjd"
Start-Process -FilePath $ChromeExe -ArgumentList $AppId_Keep -WindowStyle Maximized
# $AppId_Translate = "--app-id=edanbjnaiofggfmimiidpfmhggkbokck"
# Start-Process -FilePath $ChromeExe -ArgumentList $AppId_Translate -WindowStyle Maximized

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