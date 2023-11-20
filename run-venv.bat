@echo off

:: Check for Python or Python3 executable
where python >nul 2>&1 || where python3 >nul 2>&1 || (
    echo Python is not installed. Please install Python and try again: https://www.python.org/downloads/
    exit /b 1
)

:: Check if virtual environment already exists
if not exist env (
    :: Create a virtual environment
    python -m venv env
    if %errorlevel% neq 0 (
        echo Failed to create a virtual environment.
        exit /b 1
    )
)

:: Activate the virtual environment (adjust based on your shell)
call env\Scripts\activate.bat

:: Install dependencies from requirements.txt
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo Failed to install dependencies.
    exit /b 1
)

echo Virtual environment is ready, and dependencies are installed.

:: Keep the console window open
cmd /k
