@echo off
rem Lets make the colors festive-y
color 24

set counter=0
goto :main

:findIndex

set "index=0"

:findIndexLoop
if defined data[%index%] (
    set /a "index+=1"
    goto :findIndexLoop
)

exit /b 0

:processDepth
set prevDepth=-1
set index=0
call :findIndex

set /a "index-=1"
for /l %%i in (0,1,%index%) do (
    set /a depth=data[%%i]
    if !depth! GTR !prevDepth! (
        if !prevDepth! EQU -1 (
            echo "!depth! (N/A)"
        ) else (
            set /a "counter+=1"
            echo !depth! (increased^)
        )
    ) else (
        echo !depth! (decreased^)
    )
    
    set prevDepth=!depth!
)

exit /b 0

:main
rem This allows us to process variables in "realtime" in for loops
setlocal EnableDelayedExpansion
set counter=0
set data=
set depthData=
set index=0
for /f "tokens=*" %%d in (input.txt) do (
    set data[!index!]=%%d
    set depthData[!index!]=%%d
    set /a index=!index!+1
)
call :processDepth

echo The depth increased %counter% times

set index=0
call :findIndex

set data=
set /a "index-=2"
for /l %%i in (0,1,%index%) do (
    set /a d1=%%i
    set /a d2=%%i+1
    set /a d3=%%i+2
    echo !d1! !d2! !d3!
    set /a "depth=depthData[!d1!]+depthData[!d2!]+depthData[!d3!]"
    echo !depth!
    set /a data[%%i]=!depth!
)

set counter=0
call :processDepth

echo The 3 sum depth increased %counter% times