# hzclish - CLI bash script for posting/reading on [Hubzilla](https://project.hubzilla.org/) (ex Red Matrix) hub

### Looks like won't work with last Hubzilla versions.
Works on Hubzilla 2.2  
**TODO: rewrite with Zot API**

### Dependencies:

* [curl](https://curl.haxx.se/) (ubuntu updates/main, security/main, /main repos has this)
* [jq](https://stedolan.github.io/jq/) (ubuntu backports/universe, /universe repos has this)
* [markdown][mdown] or [pandoc](http://pandoc.org/) or [discount](https://github.com/Orc/discount) (ubuntu /universe repo has this)
* grep, sed, awk, tr, mkdir, mktemp, rm, wc (normally GNU/linux has this)

### Usage:

Run `hzclish -h` for help.

Config folder: ~/.hzclish

### Notice:

* Message will be parsed by [markdown][mdown], so you can use it syntax
* If your post url with underscores: `http://example.com/url_with_underscores`, the [markdown][mdown] will parse it to emphasis: `http://example.com/url<em>with</em>underscores`, which is breaks the url,  so wrap  url  in `<>` like this: `<http://example.com/url_with_underscores>`
* Don't forget to add two **spaces** for [markdown][mdown] line breaks
* If you have categories enabled in your Hubzilla profile settings, the top first line of post message, if it starts with ` *cat1 *cat2 ... *cat3` (*asterisk and text*), will be parsed as post categories (*It's like tags, but categories*)
* If you have hashtags enabled in your Hubzilla profile settings, words like ` #tag1 #tag2 ... #tag3` (*hash \+ text*) will be parsed as hashtags (*if they not starting the line*). And very last line of post message with ` #tag1 #tag2 ... #tag3` – will be hashtags too, even if it starts the line
* Top first line of post message (*or second if you specified categories at first*), if it starts with `# Title of message` (*one hash \+ space \+ text*), will be parsed as title of the post (*In Hubzilla you can define post title in separate filed*);
* Somehow, if you specified hashtags after url (*even after new line*) it breaks the url. Looks like Hubzilla parser issue. So here is how you should do it right: add one or two **space**  after url and then hashtags

> http://www.youtube.com/watch?v=MejbOFk7H6c`  `  
>
> \#tag1 \#tag2 \#tag3


[mdown]: http://daringfireball.net/projects/markdown/syntax