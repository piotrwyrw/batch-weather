@echo off

set bw_ver=1.0
echo BatchWeather by ShortyPing, piotrwyrw version v%bw_ver%
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

goto init

:err_no_node
echo NodeJS was not found on this system, but is required to run this script.
exit

:err_no_cities
echo The file 'cities.txt' was not found. Please create it, then run the script again.
exit

:init

:: Check if nodeJS is installed on the system
where node
if %errorlevel% neq 0 goto err_no_node

:: Check if the file cities.txt exists
if not exist cities.txt (
    goto err_no_cities
)

:: Read the file line by line and issue API calls through the Node script
for /f "tokens=*" %%s in (cities.txt) do (
    
    echo -- Weather in %%s --

)