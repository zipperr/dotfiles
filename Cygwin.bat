@if(0)==(0) echo off
:: URL: http://bit.ly/cyginst
:: 最終更新: 2017年4月21日 5:58:42
setlocal

REM --- 編集するところ(ここから↓) ---
set CYG_NAME=Cygwin
set CYG_BITS=32
::set CYG_CATS=Archive,Python
set CYG_PKGS=gcc,gcc-core,gcc-g++,gcc-ada,binutils,git,make,wget,zsh,vim,ruby,php,python2,perl,lua
set DT_ICONS=1
REM --- 編集するところ(ここまで↑) ---

REM --- デバッグ/カスタマイズ(ここから↓) ---
set CYG_DEBUG=0
set CYG_SITE=http://mirrors.kernel.org/sourceware/cygwin/
set CYG_LANG=ja
set CYG_FONT=MS Gothic
set CYG_FONT_HEIGHT=12
REM --- デバッグ/カスタマイズ(ここまで↑) ---

cscript.exe //nologo //E:JScript "%~f0"
call cyginst.bat SUBPROC
endlocal
pause
exit /b
goto :EOF
@end
var fso = new ActiveXObject("Scripting.FileSystemObject");
var SCRIPT_CURRENT_DIR = fso.getParentFolderName(WScript.ScriptFullName);
var url = "https://raw.githubusercontent.com/cyginst/cyginst-v1/master/cyginst.bat";
var fileName = SCRIPT_CURRENT_DIR + "\\cyginst.bat";
try {
  downloadFile(url, fileName);
} catch (e) {
  WScript.Echo("cyginst.bat をダウンロードできませんでした");
}
WScript.Quit();
function downloadFile(url, fileName) {
  var StreamTypeEnum  = { adTypeBinary: 1, adTypeText: 2 };
  var SaveOptionsEnum = { adSaveCreateNotExist: 1, adSaveCreateOverWrite: 2 };
  var http = WScript.CreateObject("MSXML2.XMLHTTP");
  var strm = WScript.CreateObject("ADODB.Stream");
  http.Open("GET", url, false);
  http.Send();
  strm.Type = StreamTypeEnum.adTypeBinary;
  strm.Open();
  strm.Write(http.responseBody);
  strm.SaveToFile(fileName, SaveOptionsEnum.adSaveCreateOverWrite);
}
