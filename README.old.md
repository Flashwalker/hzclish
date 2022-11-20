# hzclish.old - CLI bash script for posting/reading on [Hubzilla][hubzilla] (ex Red Matrix) hub

## This version works only with Hubzilla hubs with **Twitter API** plugin enabled
#### (legacy. Wont be updated).

## Dependencies:

See: [dependencies/INSTALL.md](dependencies/INSTALL.md)

* [curl](https://curl.haxx.se/)
* [jq](https://stedolan.github.io/jq/)
* grep, sed, awk, tr, mkdir, mktemp, rm, wc, which (usually GNU/linux has this by default)

For markdown:

* [markdown][mdown] &nbsp;or&nbsp; libtext-markdown-perl &nbsp;or&nbsp; [pandoc](http://pandoc.org/) &nbsp;or&nbsp; [discount](https://github.com/Orc/discount)

## Usage:

See: [INSTALL.md](INSTALL.md)

Run `hzclish -h` for help.

Config folder: `~/.hzclish`

## Notice:

* Post message will be converted via [markdown][mdown], so you can use markdown syntax (*use* `-P` *or* `-m` *options to change markdown engine*)
* Don't forget to add two **spaces** for [markdown][mdown] line breaks
* If you have categories enabled in your [Hubzilla][hubzilla] profile settings, the top first line of post message, if it starts with ` *cat1 *cat2 ... *cat3` (*asterisk and text*), will be parsed as post categories (*It's like tags, but categories*)
* If you have hashtags enabled in your [Hubzilla][hubzilla] profile settings, words like ` #tag1 #tag2 ... #tag3` (*hash \+ text*) will be parsed as hashtags (*if they not starting the line*). Also the very last line (of your post message) with tags: ` #tag1 #tag2 ... #tag3` will be treated as hashtags too, even if it starts the line
* Top first line of post message (*or second if you specified categories at first*), if it starts with `# Title of message` (*one hash \+ space \+ text*), will be parsed as title of the post (*In [Hubzilla][hubzilla] you can define the post title in separate field*)
* If you want a link, use markdown syntax: wrap url in `<>` brackets like this: `<http://example.com/>` or `[]()` brackets like this: `[link](http://example.com/)`
* If you post plain url with underscores, e.g.: `http://example.com/url_with_underscores`, the [markdown][mdown] will parse it to emphasis: `http://example.com/url<em>with</em>underscores`, which is breaks the url. So escape the `_` underscore with backslash: `http://example.com/url\_with\_underscores`, or use markdown syntax: wrap url in `<>` brackets like this: `<http://example.com/url_with_underscores>`
* If you want to **embed** url (with preview image), write your url just as plain text an add one or two **spaces** right after the url (*due to [Hubzilla][hubzilla] has some oembed issues*):

> http://www.youtube.com/watch?v=MejbOFk7H6c`***SPACES-GOES-HERE***`   
>
> \#tag1 \#tag2 \#tag3

[hubzilla]: https://hubzilla.org/page/hubzilla/hubzilla-project
[mdown]: http://daringfireball.net/projects/markdown/syntax
