$home = $env:USERPROFILE
$homeconfig = $env:LOCALAPPDATA
$appdata = $env:APPDATA

Remove-Item alias:curl

If ([bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")) {
	iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
} Else {
	iex "& {$(irm get.scoop.sh)}"
}

scoop install neovim adb scrcpy curl git concfg

New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target ".\.config\nvim"
