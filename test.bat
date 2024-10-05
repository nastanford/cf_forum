@echo off
echo Creating ColdFusion project structure...

@REM mkdir Application_Root
@REM cd Application_Root

@echo off
echo Creating Application.cfc file...

(
echo component{
echo.
echo   this.name = "Application Name";
echo   this.applicationTimeout = createTimeSpan( 30, 0, 0, 0 ^);
echo   this.sessionStorage = true;
echo   this.sessionTimeout = createTimeSpan( 0, 0, 60, 0 ^);
echo   this.datasource = "Datasource Name";
echo.
echo   function onApplicationStart^(^)^{^}
echo   function onApplicationEnd^( struct applicationScope ^) ^{^}
echo.
echo   function onSessionStart^(^) ^{^}
echo   function onSessionEnd^( struct sessionScope, struct applicationScope ^) ^{^}
echo.
echo   function onRequestStart^( string targetPage ^) ^{^}
echo   function onRequest^( string targetPage ^) ^{
echo     include arguments.targetPage;
echo   ^}
echo   function onRequestEnd^(^) ^{^}
echo   function onCFCRequest^( cfcname, method, struct args^) ^{ 
echo         return;
echo   ^} 
echo.
echo   function onError^( any Exception, string EventName ^) ^{^}
echo   function onAbort^( required string targetPage ^) ^{^} 
echo   function onMissingTemplate^( required string targetPage ^) ^{^}
echo.
echo ^}
) > Application.cfc

echo Application.cfc file created successfully.

echo. > index.cfm
echo. > README.md
(
echo. 
echo /node_modules
echo /logs
echo /uploads
) > .gitignore

echo Creating Folder Structure.

mkdir admin
mkdir assets
mkdir assets/css
mkdir assets/js
mkdir classes 
mkdir classes/examples
echo. classes/examples/bean.cfc
echo. classes/examples/dao.cfc
echo. classes/examples/service.cfc
mkdir documentation
echo. > documentation/erd.md 
mkdir includes
echo. > header.cfm
echo. > footer.cfm
echo. > navbar.cfm
mkdir logs
mkdir sql
mkdir pwtests
mkdir tests
mkdir uploads
mkdir views

echo Folder structure created successfully!

