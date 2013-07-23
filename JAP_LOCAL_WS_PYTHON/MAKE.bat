set SEVENZIP_HOME="C:\Program Files\7-Zip"
set PYINSTALLER_HOME="C:\pyinstaller-SNAPSHOT"
set JAP_LOCAL_WS_PYTHON_VERSION=3.0.0-SNAPSHOT-3
set JAP_LOCAL_WS_PYTHON_WINDOWS_VERSION=3.0.0-SNAPSHOT-3
if exist MAKE rmdir MAKE /s /q
mkdir MAKE
cd MAKE
rem JAP_LOCAL_WS_PYTHON
mkdir JAP_LOCAL_WS_PYTHON-%JAP_LOCAL_WS_PYTHON_VERSION%
cd JAP_LOCAL_WS_PYTHON-%JAP_LOCAL_WS_PYTHON_VERSION%
copy ..\..\JAP_LOCAL_WS.bat JAP_LOCAL_WS.bat
copy ..\..\JAP_LOCAL_WS.json JAP_LOCAL_WS.json
copy ..\..\JAP_LOCAL_WS.py JAP_LOCAL_WS.py
copy ..\..\CA.pem CA.pem
copy ..\..\CA_DEFAULT.pem CA_DEFAULT.pem
copy ..\..\H.txt H.txt
copy ..\..\README.txt README.txt
mkdir JAP
cd JAP
copy ..\..\..\JAP\__init__.py __init__.py
copy ..\..\..\JAP\JAP_LOCAL.py JAP_LOCAL.py
copy ..\..\..\JAP\JAP_LOCAL_WS.py JAP_LOCAL_WS.py
cd ..
cd ..
%SEVENZIP_HOME%\7z.exe a -tzip JAP_LOCAL_WS_PYTHON-%JAP_LOCAL_WS_PYTHON_VERSION%.zip JAP_LOCAL_WS_PYTHON-%JAP_LOCAL_WS_PYTHON_VERSION%
rem JAP_LOCAL_WS_PYTHON_WINDOWS
mkdir PYINSTALLER
cd PYINSTALLER
python %PYINSTALLER_HOME%\pyinstaller.py -c -F ..\JAP_LOCAL_WS_PYTHON-%JAP_LOCAL_WS_PYTHON_VERSION%\JAP_LOCAL_WS.py
cd ..
mkdir JAP_LOCAL_WS_PYTHON_WINDOWS-%JAP_LOCAL_WS_PYTHON_WINDOWS_VERSION%
cd JAP_LOCAL_WS_PYTHON_WINDOWS-%JAP_LOCAL_WS_PYTHON_WINDOWS_VERSION%
copy ..\PYINSTALLER\dist\JAP_LOCAL_WS.exe JAP_LOCAL_WS.exe
copy ..\..\JAP_LOCAL_WS_PYTHON_WINDOWS\JAP_LOCAL_WS.bat JAP_LOCAL_WS.bat
copy ..\..\JAP_LOCAL_WS_PYTHON_WINDOWS\README.txt README.txt
copy ..\..\JAP_LOCAL_WS.json JAP_LOCAL_WS.json
copy ..\..\CA.pem CA.pem
copy ..\..\CA_DEFAULT.pem CA_DEFAULT.pem
copy ..\..\H.txt H.txt
cd ..
%SEVENZIP_HOME%\7z.exe a -tzip JAP_LOCAL_WS_PYTHON_WINDOWS-%JAP_LOCAL_WS_PYTHON_WINDOWS_VERSION%.zip JAP_LOCAL_WS_PYTHON_WINDOWS-%JAP_LOCAL_WS_PYTHON_WINDOWS_VERSION%
cd ..