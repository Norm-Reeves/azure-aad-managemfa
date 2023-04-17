Write-Host "Please authenticate with AAD..." -NoNewline
Connect-MsolService
Write-Host "thank you!`n"

While($true){
	$prompt =  "What would you like to do?`n1.) Check Status`n2.) Disable MFA`n3.) Enable MFA`n4.) Enforce MFA`n5.) Reset MFA`n6.) Exit`n"

	$option = Read-Host $prompt

	if ($option -eq 1){
		$UPN = Read-Host "Please enter user's email"
		
		Write-Host "..." -NoNewline
		
		$status = (Get-MsolUser -UserPrincipalName $UPN).StrongAuthenticationRequirements
		
		if($status.Count -eq 0){
            Write-Host "Disabled"
        }
		
		else{
			Write-Host $status.State 
		}
	}

	elseif ($option -eq 2){
		$UPN = Read-Host "Please enter user's email"
		
		Write-Host "..." -NoNewline
		Set-MsolUser -UserPrincipalName $UPN -StrongAuthenticationRequirements @()
		Write-Host "done.`n"
	}
	
	elseif ($option -eq 3){
		$UPN = Read-Host "Please enter user's email"
		
		Write-Host "..." -NoNewline
		
		$strongAuth = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
		$strongAuth.RelyingParty = "*"
		$strongAuth.State = "Enabled"
		$strongAuthRequirements = @($strongAuth)
		
		Set-MsolUser -UserPrincipalName $UPN -StrongAuthenticationRequirements $strongAuthRequirements
		Write-Host "done.`n"
	}
	
	elseif ($option -eq 4){
		$UPN = Read-Host "Please enter user's email"
		
		Write-Host "..." -NoNewline
		
		$strongAuth = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
		$strongAuth.RelyingParty = "*"
		$strongAuth.State = "Enforced"
		$strongAuthRequirements = @($strongAuth)
		
		Set-MsolUser -UserPrincipalName $UPN -StrongAuthenticationRequirements $strongAuthRequirements
		Write-Host "done.`n"
	}
	
	elseif ($option -eq 5){
		$UPN = Read-Host "Please enter user's email"
		
		Write-Host "..." -NoNewline
		Reset-MsolStrongAuthenticationMethodByUpn -UserPrincipalName $UPN
		Write-Host "done.`n"
	}
	
	elseif ($option -eq 6){
		break
	}
	
}