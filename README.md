# Password-Generator

Welcome to the PowerShell Password Generator Module repository! This module allows you to create secure and customizable passwords directly from your PowerShell environment.
Features

- Customizable Length: Set the total length of the password.
- Flexible Composition: Specify the number of uppercase letters, lowercase letters, digits, and special characters.
- Security: Option to return the password as a SecureString for secure handling.
- Simplicity: Easy to use and integrate into your existing PowerShell scripts.

Installation

Clone this repository to your local machine:

    git clone https://github.com/PorteBannana/Password-Generator.git

Copy the module folder to the PowerShell modules directory. If the directory does not exist, it will be created:

    $modulePath = "$HOME\Documents\PowerShell\Modules\Password-Generator"
    if (-Not (Test-Path -Path $modulePath)) {
        New-Item -ItemType Directory -Path $modulePath -Force
    }
    Copy-Item -Path ".\Password-Generator\*" -Destination $modulePath -Recurse -Force

Usage

To use the password generator, import the module into your PowerShell session and call the New-Password function with the desired parameters.
Examples
Basic Usage

Generate a password with default settings:
    
    # Import the module
    Import-Module Password-Generator
    
    # Generate a password with default settings
    $password = New-Password
    
    # Display the password
    Write-Output $password

Customized Password

Generate a password with customized settings:

    # Import the module
    Import-Module Password-Generator
    
    # Generate a password with customized settings
    $password = New-Password -Length 16 -Uppercase 4 -Digits 3 -SpecialCharacters 3 -SecureString $true
    
    # Display the password
    Write-Output $password

Parameters

- Length: Total length of the password (default: 24).
- Uppercase: Number of uppercase letters (default: 2).
- Digits: Number of digits (default: 2).
- SpecialCharacters: Number of special characters (default: 2).
- SecureString: Returns the password as a SecureString if $true (default: $false).

Contributions

Contributions are welcome! If you have suggestions for improvements or bug fixes, feel free to open an issue or submit a pull request.
