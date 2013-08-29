@echo off
set backupDir=%~dp0
set dbServer=localhost
set dbName=itembasedmodules

REM http://www.howtogeek.com/50295/backup-your-sql-server-database-from-the-command-line/
SqlCmd -E -S %dbServer% -Q "BACKUP DATABASE %dbName% TO DISK='%backupDir%\%dbName%.bak' WITH FORMAT"
zip %dbName%.bak.zip %dbName%.bak
