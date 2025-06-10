Set-Location "./dotfiles"

$home = $env:USERPROFILE
$localappdata = $env:LOCALAPPDATA
$appdata = $env:APPDATA

Remove-Item alias:curl

iex "& {$(irm get.scoop.sh)} -RunAsAdmin"

scoop bucket add extras
scoop install neovim adb scrcpy curl git concfg

New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target ".all\config\nvim"
