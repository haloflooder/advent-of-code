@echo off
rem Lets make the colors festive-y
color 24

rem This allows us to use variables in a for loop. I don't know WHY this is. Apparentely because the entire for loop is a single command supposedly.
setlocal EnableDelayedExpansion

set counter=0
set prevDepth=-1

for /f "tokens=*" %%d in (input.txt) do (
    if %%d GTR !prevDepth! (
        if !prevDepth! EQU -1 (
            echo "%%d (N/A)"
        ) else (
            set /a counter=!counter!+1
            echo %%d (increased^)
        )
    ) else (
        echo %%d (decreased^)
    )
    
    set prevDepth=%%d
)
echo The depth increased %counter% times