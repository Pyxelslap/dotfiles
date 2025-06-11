Set-Location "./dotfiles"

$user = $env:USERPROFILE
$localappdata = $env:LOCALAPPDATA
$appdata = $env:APPDATA

Remove-Item alias:curl

scoop bucket add extras
scoop install neovim adb scrcpy curl concfg lazygit ripgrep gdu

New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target ".\all\config\nvim"

Get-Content "./all/symlink.txt" | ForEach-Object {
    $parts = $_ -split "←", 2
    if ($parts.Count -eq 2) {
			if ($parts[1] -eq "config") {
				Write-Host "Link to user's config directory"
			} elseif ($parts[1] -eq "home") {
				Write-Host "Link to user's home directory"
			} elseif ($parts[1] -eq "bin") {
				Write-Host "link to custom bin"
			}else {
				Write-Host "$_"
			}
						#   $target = $parts[0].Trim().Trim('"', "'") # TODO: sanitize home variable
						#   $link   = $parts[1].Trim().Trim('"', "'")
						#                                                                   if (Test-Path $target) {
						#       New-Item -ItemType SymbolicLink -Path $link -Target $target -Force 
						# Write-Host "Symlink : $target -> $link"               
						# }  else {
						#       Write-Warning "Target not found: $target"
						#   }
    } else {
        Write-Warning "Wrong format: $_"
    }
}
