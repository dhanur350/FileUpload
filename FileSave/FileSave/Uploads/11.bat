@ECHO OFF
:IE10HACK
REG ADD "HKLM\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer" /v Version /t REG_SZ /d "9.10.9200.16384" /f
REG ADD "HKLM\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer" /v svcVersion /t REG_SZ /d "10.0.9200.16384" /f
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer" /v Version /t REG_SZ /d "9.10.9200.16384" /f
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer" /v svcVersion /t REG_SZ /d "10.0.9200.16384" /f
GOTO EXIT
 
:REVERTIE
REG DELETE "HKLM\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer" /v svcVersion
REG DELETE "HKLM\SOFTWARE\Microsoft\Internet Explorer" /v svcVersion
REG ADD "HKLM\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer" /v Version /t REG_SZ /d "8.0.7601.17514" /f
REG ADD "HKLM\SOFTWARE\Microsoft\Internet Explorer" /v Version /t REG_SZ /d "8.0.7601.17514" /f
GOTO EXIT
 
:EXIT