SET OPTIONS=%~1

ECHO Using options: %OPTIONS%

RMDIR /S /Q dist

pipenv run pyinstaller ^
    --hidden-import=eventlet.hubs.epolls ^
    --hidden-import=eventlet.hubs.kqueue ^
    --hidden-import=eventlet.hubs.selects ^
    --hidden-import=zmq ^
    --hidden-import=dns ^
    --hidden-import=dns.dnssec ^
    --hidden-import=dns.e164 ^
    --hidden-import=dns.hash ^
    --hidden-import=dns.namedict ^
    --hidden-import=dns.tsigkeyring ^
    --hidden-import=dns.update ^
    --hidden-import=dns.version ^
    --hidden-import=dns.zone ^
    --hidden-import=engineio.async_drivers ^
    --hidden-import=engineio.async_drivers.eventlet ^
    --hidden-import=engineio.server ^
    --hidden-import=flaskwebgui ^
    --add-data "EDScoutWebUI\templates;templates" ^
    --add-data "EDScoutWebUI\static;static" ^
    %OPTIONS% ^
    EDScoutWebUI\EDScout.py 
