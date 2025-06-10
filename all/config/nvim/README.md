## backstory
i make this config 'cause other nvim config just bloated and too heavy to run on my phone(OPPO A3s)

## dependencies you need to install this config on different platforms
### android
 **software:**
```
pkg install git && pkg install lua-language-server && pkg install nodejs
```
optional:
`pkg install wakatime-cli`[^1]\
**font:**
```
curl -L --output ~/.termux/font.ttf https://www.github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
```
[Others Nerd Font](https://www.nerdfonts.com/font-downloads)


### windows
 **software:**
- git
```
winget install --id Git.Git -e --source winget
```
or download it from [here](https://git-scm.com/downloads/win)</br>
- nodejs
```
winget install -e --id OpenJS.NodeJS
```
or download it from [here](https://nodejs.org/en/download)

 **font**:\
[Nerd Font](https://www.nerdfonts.com/font-downloads)\
Extract, select all files, right click, then click install

## Footnotes
[^1]: Its just for tracking my coding habit. if you don't want wakatime installed on your system, you can remove it in 'lua/plugins/qualityoflife.lua'
