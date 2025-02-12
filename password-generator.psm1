# Generateur de Mots de Passe

function New-Password {
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$false)][int]$Length=24,
        [Parameter(Mandatory=$false)][int]$Uppercase=2,
        [Parameter(Mandatory=$false)][int]$Digits=2,
        [Parameter(Mandatory=$false)][int]$SpecialCharacters=2,
        [Parameter(Mandatory=$false)][bool]$SecureString=$false
    )
    Begin {
        $Lowercase = $Length - $SpecialCharacters - $Uppercase - $Digits
        $ArrayLowerCharacters = @('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')
        $ArrayUpperCharacters = @('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
        $ArraySpecialCharacters = @('_','*','$','%','#','?','!','-')
    }
    Process {
        [string]$NewPassword = $ArrayLowerCharacters | Get-Random -Count $Lowercase
        $NewPassword += 0..9 | Get-Random -Count $Digits
        $NewPassword += $ArrayUpperCharacters | Get-Random -Count $Uppercase
        $NewPassword += $ArraySpecialCharacters | Get-Random -Count $SpecialCharacters

        $NewPassword = $NewPassword.Replace(' ','')

        $characterArray = $NewPassword.ToCharArray()  
        $scrambledStringArray = $characterArray | Get-Random -Count $characterArray.Length    
        $NewRandomPassword = -join $scrambledStringArray
    }
    End {
        if ($SecureString -eq $false) {
            Return $NewRandomPassword
        }

        if ($SecureString -eq $true) {
            $NewRandomPassword = $NewRandomPassword | ConvertTo-SecureString -AsPlainText -Force
            Return $NewRandomPassword | ConvertFrom-SecureString
        }
    }
}
