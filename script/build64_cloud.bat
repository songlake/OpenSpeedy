@echo off
echo =================================
echo Build 64 bit Qt5.15 static library
echo =================================

REM 初始化 Visual Studio 环境
echo Initializing Visual Studio 2022 64-bit environment...
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

REM 设置路径变量
set SCRIPT_DIR=%~dp0
set SOURCE_DIR=%SCRIPT_DIR%..\
set BUILD_DIR=%SOURCE_DIR%build
set QT_DIR=%QT_DIR%
set QT_QMAKE_EXECUTABLE=%QT_DIR%\bin\qmake.exe

REM 获取 Qt 安装前缀
for /f "delims=" %%i in ('"%QT_QMAKE_EXECUTABLE%" -query QT_INSTALL_PREFIX') do set QT_INSTALL_PREFIX=%%i
echo QMake Executable: "%QT_QMAKE_EXECUTABLE%"
echo Qt Install Prefix: "%QT_INSTALL_PREFIX%"

REM 配置并生成项目
cmake ^
  -DQT_QMAKE_EXECUTABLE:FILEPATH="%QT_QMAKE_EXECUTABLE%" ^
  -DCMAKE_PREFIX_PATH="%QT_INSTALL_PREFIX%" ^
  -DCMAKE_BUILD_TYPE=Release ^
  -S "%SOURCE_DIR%" ^
  -B "%BUILD_DIR%"

REM 编译项目
cmake --build "%BUILD_DIR%" --config Release
