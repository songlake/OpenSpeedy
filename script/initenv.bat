@echo off
REM ===== Visual Studio 环境 =====
set VC_TOOLS_32BIT="C:\Program Files\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars32.bat"
set VC_TOOLS_64BIT="C:\Program Files\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

REM ===== 构建输出目录 =====
set BUILD_DIR_32BIT="%~dp0..\build\CMAKE-32bit-Release"
set BUILD_DIR_64BIT="%~dp0..\build\CMAKE-64bit-Release"

REM ===== Qt 目录（假设已用 aqtinstall 安装）=====
REM 32 位 Qt
set QT_QMAKE_EXECUTABLE_32BIT="C:\Qt\5.15.2\msvc2019\bin\qmake.exe"
set QT_DIR_32BIT="C:\Qt\5.15.2\msvc2019"

REM 64 位 Qt
set QT_QMAKE_EXECUTABLE_64BIT="C:\Qt\5.15.2\msvc2019_64\bin\qmake.exe"
set QT_DIR_64BIT="C:\Qt\5.15.2\msvc2019_64"

REM ===== 将 Qt bin 添加到 PATH（方便直接运行 qmake / uic / rcc）=====
set PATH=%QT_DIR_32BIT%\bin;%QT_DIR_64BIT%\bin;%PATH%

REM ===== 提示当前使用的 Qt 路径 =====
echo [InitEnv] 32-bit Qt: %QT_QMAKE_EXECUTABLE_32BIT%
echo [InitEnv] 64-bit Qt: %QT_QMAKE_EXECUTABLE_64BIT%
