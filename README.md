# hzclish - CLI bash script for posting/reading on [Hubzilla][hubzilla] (ex Red Matrix) hub

## Dependencies:

See: [dependencies/INSTALL.md](dependencies/INSTALL.md)

* [curl](https://curl.haxx.se/)
* [jq](https://stedolan.github.io/jq/)
* grep, sed, awk, tr, mkdir, mktemp, rm, wc, which (normally GNU/linux has this)

**For markdown to bbcode:**

* [md2bbc.pl](https://gist.github.com/Flashwalker/360e8615bff1b9b322e0096fe92680ab)
* libtext-markdown-perl
* libtext-typography-perl (optional)

 &nbsp;or:

* [pandoc](http://pandoc.org/)
* [bbcode writer](https://github.com/lilydjwg/2bbcode)


## Usage:

See: [INSTALL.md](INSTALL.md)

Run `hzclish -h` for help.

Config folder: ~/.hzclish

## Notice:

* Post message will be converted via [markdown][mdown] to bbcode, so you can use it syntax (*use* `-P` *or* `-m` *options to change markdown engine*)
* If you prefer to post in bbcode (*Hubzilla default*) or just as plain text, use `-B` option, so message won't be markdowned
* If you prefer to post in html, use `-H` option, so message won't be markdowned
* Don't forget to add two **spaces** for [markdown][mdown] line breaks
* If you have categories enabled in your [Hubzilla][hubzilla] profile settings, the top first line of post message, if it starts with ` *cat1 *cat2 ... *cat3` (*asterisk and text*), will be parsed as post categories (*It's like tags, but categories*)
* If you have hashtags enabled in your [Hubzilla][hubzilla] profile settings, words like ` #tag1 #tag2 ... #tag3` (*hash \+ text*) will be parsed as hashtags (*if they not starting the line*). And very last line of post message with ` #tag1 #tag2 ... #tag3` will be hashtags too, even if it starts the line
* Top first line of post message (*or second if you specified categories at first*), if it starts with `# Title of message` (*one hash \+ space \+ text*), will be parsed as title of the post (*In [Hubzilla][hubzilla] you can define post title in separate field*)
* If you want link, use markdown syntax: wrap  url  in `<>` brackets like this: `<http://example.com/>` or: `[link](http://example.com/)`
* If your post plain url with underscores: `http://example.com/url_with_underscores`, the [markdown][mdown] will parse it to emphasis: `http://example.com/url<em>with</em>underscores`, that breaks the url, so escape the `_` underscores with backslashes: `http://example.com/url\_with\_underscores`, or use markdown syntax: wrap  url  in `<>` brackets like this: `<http://example.com/url_with_underscores>`
* If you want **embed** url (preview image), write url just as plain text an add one or two **spaces** right after the url (*due [Hubzilla][hubzilla] has some oembed issues*):

> http://www.youtube.com/watch?v=MejbOFk7H6c`  `  
>
> \#tag1 \#tag2 \#tag3

## Changelog

v2.0:

- Rewritten with Zot API. Twitter API now: hzclish.old

[hubzilla]: https://project.hubzilla.org/
[mdown]: http://daringfireball.net/projects/markdown/syntax