# Install script:
mkdir -p ~/bin && install -m 755 hzclish ~/bin/


# Install dependencies:

## Install curl:
sudo apt-get install curl 

## Install jq:
sudo apt-get install jq

### or:
mkdir -p ~/bin && install -m 755 jq ~/bin/


## For markdown:

### Install markdown:

sudo apt-get install markdown

#### or:
sudo apt-get install libtext-markdown-perl

#### or:
sudo apt-get install discount

#### or:

###  Install pandoc:

sudo apt-get install pandoc


## For markdown to bbcode:

### Install perl modules:
sudo apt-get install libtext-markdown-perl libtext-typography-perl

### Install markdown-to-bbcode converter script:
mkdir -p ~/bin && install -m 755 -T md2bbc.pl ~/bin/md2bbc

#### or:
mkdir -p ~/bin && wget https://git.io/vHxFx -O ~/bin/md2bbc && chmod +x ~/bin/md2bbc

#### or:
mkdir -p ~/.hzclish && wget https://git.io/vHxFx && chmod +x ~/.hzclish/md2bbc.pl


## For pandoc markdown to bbcode (`-P` option):

### Install pandoc:
sudo apt-get install pandoc

### Install bbcode writer:
mkdir -p ~/bin && cp bbcode_phpbb.lua ~/bin/

#### or:
mkdir -p ~/bin && wget https://git.io/vH5r3 -O ~/bin/bbcode_phpbb.lua

#### or:
mkdir -p ~/.hzclish && cp bbcode_phpbb.lua ~/.hzclish/

#### or:
mkdir -p ~/.hzclish && wget https://git.io/vH5r3 -O ~/.hzclish/bbcode_phpbb.lua
