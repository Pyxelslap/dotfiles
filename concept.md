## symlink.txt at all folder

target<-{path type}[config, home, bin?]

## Configuration path

env:USERPROFILE = $HOME
env:LOCALAPPDATA | env:APPDATA = ~/.config/
env:LOCALAPPDATA\program\bin = ~/bin ?

## todo

- [x] make automated synlink in pwsh
- [ ] make automated symlink in bash
- [ ] multiple processes for installing packages in pwsh
