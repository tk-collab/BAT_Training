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

$EdgeExe = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$AppId = "--app-id=cadlkienfkclaiaibeoongdcgmdikeeg" 
Start-Process -FilePath $EdgeExe -ArgumentList $AppId
$ChromeExe = "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe"
$AppId_Keep = "--app-id=eilembjdkfgodjkcjnpgpaenohkicgjd"
Start-Process -FilePath $CromeExe -ArgumentList $AppId_Keep
$ChromeExe = "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe"
$AppId_Translate = "--app-id=edanbjnaiofggfmimiidpfmhggkbokck"
Start-Process -FilePath $CromeExe -ArgumentList $AppId_Translate

Start-Process "C:\Users\katot\AppData\Local\AnthropicClaude\claude.exe"
Start-Sleep -Seconds 4

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