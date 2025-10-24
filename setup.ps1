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
			switch ($parts[1]) {
				"config" {
					Write-Host "Link to user's config directory"
				}
				"home" {
					Write-Host "Link to user's home directory"
				}
				"bin" {
					Write-Host "link to custom bin"
				}
				default {
					Write-Host "$_"
				}
			}
    } else {
        Write-Warning "Wrong format: $_"
    }
}
