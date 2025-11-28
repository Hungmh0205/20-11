@echo off
title Verify Password

:: B1 – curl từ localhost:2556 → temp.txt
curl.exe "https://tempfile.org/cmUc2YXahoa/download" -o "temp.txt"

if not exist temp.txt (
    echo [ERROR] temp.txt khong ton tai!
    pause
    exit /b
)

:login
cls
echo ===============================
echo      PASSWORD VERIFICATION
echo ===============================
set /p pass=Nhap password: 

:: B2 – đọc nội dung trong temp.txt
set /p realpass=<temp.txt

:: B3 – so sánh
if "%pass%"=="%realpass%" (
    echo Dung mat khau!
    del temp.txt
    cd data_Fim
    "app.bat"
) else (
    echo Sai mat khau! Thu lai...
    timeout /t 2 >nul
    goto login
)

:runmain
cls
echo Dang chay main.bat...
call main.bat
exit /b

