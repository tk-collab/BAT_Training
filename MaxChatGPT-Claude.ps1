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