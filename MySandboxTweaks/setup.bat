@echo off
:: انتظر 3 ثواني لتأكيد تحميل سطح المكتب
timeout /t 3 /nobreak >nul

:: 1. استيراد ملف الريجستري
if exist "C:\SandboxFiles\tweaks.reg" (
    reg import "C:\SandboxFiles\tweaks.reg"
)

:: 2. فرض إيقاف الأخبار والاهتمامات عبر السياسات والريجستري الفوري
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 0 /f >nul

:: 3. إخفاء مربع البحث
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f >nul

:: 4. إيقاف الأنيميشن والمؤثرات مباشرة عبر user32 API
powershell -Command "$fx = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects'; Set-ItemProperty -Path $fx -Name 'VisualFXSetting' -Value 3; Get-ChildItem -Path $fx | ForEach-Object { if ($_.PSChildName -eq 'FontSmoothing') { Set-ItemProperty -Path $_.PSPath -Name 'DefaultValue' -Value 1 } else { Set-ItemProperty -Path $_.PSPath -Name 'DefaultValue' -Value 0 } }"
powershell -Command "$code = '[DllImport(\"user32.dll\")] public static extern bool SystemParametersInfo(uint uAction, uint uParam, ref int lpvParam, uint fuWinIni);'; $type = Add-Type -MemberDefinition $code -Name 'Win32API' -Namespace 'Win32' -PassThru; $type::SystemParametersInfo(0x0049, 0, [ref]0, 3); $type::SystemParametersInfo(0x0025, 0, [ref]0, 3)"

:: 5. تغيير الخلفية
if exist "C:\SandboxFiles\bg.jpg" (
    powershell -Command "Add-Type -TypeDefinition 'using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\", CharSet = CharSet.Auto)] public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20, 0, 'C:\SandboxFiles\bg.jpg', 3)"
)

:: 6. نقل ملفات سطح المكتب الخاصة بـ DesktopItems فقط
if exist "C:\SandboxFiles\DesktopItems" (
    xcopy "C:\SandboxFiles\DesktopItems\*.*" "C:\Users\WDAGUtilityAccount\Desktop\" /Y /I /E >nul
)

:: 7. التأكد من عدم ظهور مجلد AutoRun بالخطأ على سطح المكتب
if exist "C:\Users\WDAGUtilityAccount\Desktop\AutoRun" (
    rmdir /s /q "C:\Users\WDAGUtilityAccount\Desktop\AutoRun" >nul
)

:: 8. إعادة تشغيل explorer لتطبيق كافة التغييرات وإغلاق الأخبار فوراً
taskkill /f /im explorer.exe >nul
timeout /t 1 /nobreak >nul
start explorer.exe

:: 9. تجهيز وتشغيل محتويات AutoRun من مسار محلي (لتجنب منع تشغيل ملفات الشبكة)
set "LocalAutoRun=C:\Users\WDAGUtilityAccount\AppData\Local\Temp\AutoRun"

if exist "C:\SandboxFiles\AutoRun" (
    :: إنشاء المجلد المحلي ونسخ جميع الملفات إليه
    if not exist "%LocalAutoRun%" mkdir "%LocalAutoRun%"
    xcopy "C:\SandboxFiles\AutoRun\*" "%LocalAutoRun%\" /Y /I /E >nul

    timeout /t 2 /nobreak >nul
    for %%f in ("%LocalAutoRun%\*") do (
        if not exist "%%f\" (
            if /i "%%~xf"==".bat" (
                start cmd /k "cd /d \"%%~dpf\" && \"%%f\""
            ) else if /i "%%~xf"==".cmd" (
                start cmd /k "cd /d \"%%~dpf\" && \"%%f\""
            ) else if /i "%%~xf"==".ps1" (
                start powershell -ExecutionPolicy Bypass -WindowStyle Normal -NoExit -File "%%f"
            ) else (
                start "" "%%f"
            )
        )
    )
)