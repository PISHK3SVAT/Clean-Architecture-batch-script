# Clean-Architecture-batch-script
a batch script for creating clean architecture for you're asp.net core projects
## Very first example
```
cleanArch.cmd First mvc
```
After run above command you're project directory is changing this way:

![project directry after run above command](https://github.com/PISHK3SVAT/Clean-Architecture-batch-script/assets/51032328/a1a1f2d9-d2b8-458d-8e2f-86e4d3940404)

If you open the solution by visual studio, you're Solution Explorer contains these files:

![solution explorer after script is done](https://github.com/PISHK3SVAT/Clean-Architecture-batch-script/assets/51032328/adcef2d5-5604-4c81-a647-402af904c9cc)

## Overview
This scripts takes 2 args:
* Project Name
* Endpoint Template (optional)

As you see above, first argument specifies you're solution name and also this is a prefix off all other class library name.
The second argument as the name suggests, specifies the endpoint template that is match to dotnet template list, means that you can pass any of short name template of dotnet cli here.
you can see them by this command:
```
dotnet new list
```
![dotnet new list](https://github.com/PISHK3SVAT/Clean-Architecture-batch-script/assets/51032328/018350cb-9124-4cdb-ac87-5767d72e0eb5)

So you can pass each of the second column,as the second argument.

If you don't pass anything as the second argument, clean architecture will created but without endpoint or presentation layer,
so you can create that manualy later.
