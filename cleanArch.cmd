@echo off


:: this variable keep errors that probabely produce through this script
:: this is empty at first!
set errMsg=

set projectName=%1
:: if projectName be null raise error!
if [%projectName%]==[] (
	set errMsg="Project name can't be null"
	goto ERROR
)

:: define valid endpoint layer list
set validEndpointList[0]=webapi
set validEndpointList[1]=mvc
set validEndpointList[2]=react

set createEndPointFlag=t
set endPointTmplt=%2
if [%endPointTmplt%]==[] set createEndPointFlag=f
:: validation for valid endpoint template needed!


:: define solution directoriy variables
set commonSolutionDir="Src\Common"
set coreSolutionDir="Src\Core"
set infrastructureSolutionDir="Src\Infrastructures"

set presentationSolutionDir="Src\Presentation"

::create solution
dotnet new sln -n %projectName%

:: create domain layer and added to solution
dotnet new classlib -n %projectName%.Domain
dotnet sln %projectName%.sln add %projectName%.Domain -s %coreSolutionDir%

:: create application layer and added to solution
dotnet new classlib -n %projectName%.Application
dotnet sln %projectName%.sln add %projectName%.Application -s %coreSolutionDir%

:: create persistence layer and added to solution
dotnet new classlib -n %projectName%.Persistence
dotnet sln %projectName%.sln add %projectName%.Persistence -s %infrastructureSolutionDir%

:: create infrastructure layer and added to solution
dotnet new classlib -n %projectName%.Infrastructure
dotnet sln %projectName%.sln add %projectName%.Infrastructure -s %infrastructureSolutionDir%

:: create common layer and added to solution
dotnet new classlib -n %projectName%.Common
dotnet sln %projectName%.sln add %projectName%.Common -s %commonSolutionDir%

:: create endpoint layer and added to solution
if %createEndPointFlag%==t (
	dotnet new %endPointTmplt% -n %projectName%.Endpoint.%endPointTmplt%
	dotnet sln %projectName%.sln add %projectName%.Endpoint.%endPointTmplt% -s %presentationSolutionDir%
)

goto END

:ERROR
color 04
if [%errMsg%]==[] ( echo "Error, sth went wrong!" ) else ( echo %errMsg% )
color 07

:END
echo "project created successfully"