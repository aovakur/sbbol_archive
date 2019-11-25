@echo off
setlocal enabledelayedexpansion 
set now=%DATE: =0% %TIME: =0%
 
set d=%date:~0,2%
set m=%date:~3,2%
set y=%date:~6,4%
 
if %d:~0,1%==0 set d=%d:~1%
if %m:~0,1%==0 set m=%m:~1%
 
set /a feb=y%%4
if %feb%==0 (set feb=29) else (set feb=28)
 
set /a tok=m-1
if %tok%==0 set tok=12
for /f "tokens=%tok%" %%i in ("31 %feb% 31 30 31 30 31 31 30 31 30 31") do (
   set /a d-=1
    if !d!==0 (
        set d=%%i
        set m=%tok%
        if !m!==12 set /a y-=1
    )
)
 
set d=0%d%
set m=0%m%
set yesterday=%y%_%m:~-2%_%d:~-2%
 
echo %yesterday%


for /f "tokens=1-7 delims=/-:., " %%a in ( "%now%" ) do (
    set now=%%c%%b%%a
)

rem log_ConnectUPSH

"C:\Program Files\7-Zip\7z.exe" a -ssw -mx9 -r0 C:\ARCHIVE\log_ConnectUPSH\connectUPSH_%yesterday% C:\SBBOL_20180216\log_ConnectUPSH\connectUPSH_%yesterday%.txt 
del C:\SBBOL_20180216\log_ConnectUPSH\connectUPSH_%yesterday%.txt
for /L %%i in (0,1,100) do if exist C:\SBBOL_20180216\log_ConnectUPSH\connectUPSH_%yesterday%.%%i.txt ("C:\Program Files\7-Zip\7z.exe" a -ssw -mx7 -r0 C:\ARCHIVE\log_ConnectUPSH\connectUPSH_%yesterday%.%%i C:\SBBOL_20180216\log_ConnectUPSH\connectUPSH_%yesterday%.%%i.txt)
for /L %%i in (0,1,100) do if exist C:\SBBOL_20180216\log_ConnectUPSH\connectUPSH_%yesterday%.%%i.txt (del C:\SBBOL_20180216\log_ConnectUPSH\connectUPSH_%yesterday%.%%i.txt)

rem log_DataToReturn

"C:\Program Files\7-Zip\7z.exe" a -ssw -mx9 -r0 C:\ARCHIVE\log_DataToReturn\dataToReturn_%yesterday% C:\SBBOL_20180216\log_DataToReturn\dataToReturn_%yesterday%.txt 
del C:\SBBOL_20180216\log_DataToReturn\dataToReturn_%yesterday%.txt
for /L %%i in (0,1,100) do if exist C:\SBBOL_20180216\log_DataToReturn\dataToReturn_%yesterday%.%%i.txt ("C:\Program Files\7-Zip\7z.exe" a -ssw -mx7 -r0 C:\ARCHIVE\log_dataToReturn\log_DataToReturn_%yesterday%.%%i C:\SBBOL_20180216\log_DataToReturn\dataToReturn_%yesterday%.%%i.txt)
for /L %%i in (0,1,100) do if exist C:\SBBOL_20180216\log_DataToReturn\dataToReturn_%yesterday%.%%i.txt (del C:\SBBOL_20180216\log_DataToReturn\dataToReturn_%yesterday%.%%i.txt)

rem log_Exceptions

"C:\Program Files\7-Zip\7z.exe" a -ssw -mx9 -r0 C:\ARCHIVE\log_Exceptions\error_%yesterday% C:\SBBOL_20180216\log_Exceptions\error_%yesterday%.txt
del C:\SBBOL_20180216\log_Exceptions\error_%yesterday%.txt
for /L %%i in (0,1,100) do if exist C:\SBBOL_20180216\log_Exceptions\error_%yesterday%.%%i.txt ("C:\Program Files\7-Zip\7z.exe" a -ssw -mx7 -r0 C:\ARCHIVE\log_Exceptions\error_%yesterday%.%%i C:\SBBOL_20180216\log_Exceptions\error_%yesterday%.%%i.txt)
for /L %%i in (0,1,100) do if exist C:\SBBOL_20180216\log_Exceptions\error_%yesterday%.%%i.txt (del C:\SBBOL_20180216\log_Exceptions\error_%yesterday%.%%i.txt)


rem log_IncomingData

"C:\Program Files\7-Zip\7z.exe" a -ssw -mx9 -r0 C:\ARCHIVE\log_IncomingData\incommingData_%yesterday% C:\SBBOL_20180216\log_IncomingData\incommingData_%yesterday%.txt
del C:\SBBOL_20180216\log_IncomingData\incommingData_%yesterday%.txt
for /L %%i in (0,1,100) do if exist C:\SBBOL_20180216\log_IncomingData\incommingData_%yesterday%.%%i.txt ("C:\Program Files\7-Zip\7z.exe" a -ssw -mx7 -r0 C:\ARCHIVE\log_IncomingData\incommingData_%yesterday%.%%i C:\SBBOL_20180216\log_IncomingData\incommingData_%yesterday%.%%i.txt)
for /L %%i in (0,1,100) do if exist C:\SBBOL_20180216\log_IncomingData\incommingData_%yesterday%.%%i.txt (del C:\SBBOL_20180216\log_IncomingData\incommingData_%yesterday%.%%i.txt)


rem log_SendedToSbbol

"C:\Program Files\7-Zip\7z.exe" a -ssw -mx9 -r0 C:\ARCHIVE\log_SendedToSbbol\SendedToSbbol_%yesterday% C:\SBBOL_20180216\log_SendedToSbbol\SendedToSbbol_%yesterday%.txt
del C:\SBBOL_20180216\log_SendedToSbbol\SendedToSbbol_%yesterday%.txt
for /L %%i in (0,1,100) do if exist C:\SBBOL_20180216\log_SendedToSbbol\SendedToSbbol_%yesterday%.%%i.txt ("C:\Program Files\7-Zip\7z.exe" a -ssw -mx7 -r0 C:\ARCHIVE\log_SendedToSbbol\SendedToSbbol_%yesterday%.%%i C:\SBBOL_20180216\log_SendedToSbbol\SendedToSbbol_%yesterday%.%%i.txt)
for /L %%i in (0,1,100) do if exist C:\SBBOL_20180216\log_SendedToSbbol\SendedToSbbol_%yesterday%.%%i.txt (del C:\SBBOL_20180216\log_SendedToSbbol\SendedToSbbol_%yesterday%.%%i.txt)