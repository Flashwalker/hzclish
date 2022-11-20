# Install script:
`mkdir -p ~/bin && install -m 755 hzclish ~/bin/`

## Install old (Twitter API) script (legacy. Wont be updated):
`mkdir -p ~/bin && install -m 755 hzclish.old ~/bin/`

# Install dependencies:

## Install curl:
`sudo apt-get install curl`

## Install jq:
`sudo apt-get install jq`

### or:
Use jq from dependencies directory:  
`mkdir -p ~/bin && install -m 755 dependencies/jq ~/bin/`


## For markdown:

### Install markdown:

`sudo apt-get install markdown`

#### or:
`sudo apt-get install libtext-markdown-perl`

#### or:
`sudo apt-get install discount`

#### or:

###  Install pandoc:

`sudo apt-get install pandoc`


## For markdown to bbcode:

### Install perl modules:
`sudo apt-get install libtext-markdown-perl libtext-typography-perl`

### Install markdown-to-bbcode converter script:
Use md2bbc.pl from dependencies directory:  
`mkdir -p ~/bin && install -m 755 -T dependencies/md2bbc.pl ~/bin/md2bbc`

#### or just:
`mkdir -p ~/bin && wget https://git.io/vHxFx -O ~/bin/md2bbc && chmod +x ~/bin/md2bbc`

#### or just:
`mkdir -p ~/.hzclish && wget https://git.io/vHxFx -O ~/.hzclish/md2bbc.pl && chmod +x ~/.hzclish/md2bbc.pl`

## Or:
## For pandoc markdown to bbcode (`-P` option):

### Install pandoc:
`sudo apt-get install pandoc`

### Install bbcode writer:
Use bbcode_phpbb.lua from dependencies directory of this repo:  
`mkdir -p ~/bin && cp dependencies/bbcode_phpbb.lua ~/bin/`

#### or just:
`mkdir -p ~/bin && wget https://git.io/vH5r3 -O ~/bin/bbcode_phpbb.lua`

#### or:
`mkdir -p ~/.hzclish && cp dependencies/bbcode_phpbb.lua ~/.hzclish/`

#### or just:
`mkdir -p ~/.hzclish && wget https://git.io/vH5r3 -O ~/.hzclish/bbcode_phpbb.lua`  

or use fresh from [this repo](https://github.com/lilydjwg/2bbcode)
