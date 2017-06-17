#!/usr/bin/env perl

## Oriented for Hubzilla hub bbcode

## https://gist.github.com/Flashwalker/360e8615bff1b9b322e0096fe92680ab
## Origin: https://gist.github.com/RogerDodger/4405595

## Dependencies:
## sudo apt-get install libtext-markdown-perl libtext-typography-perl

## Usage:
## md2bbc.pl < "Markdown.md"

use strict;
use warnings;
use 5.01;

use Text::Markdown;
use Encode;
use HTML::Entities;
use Getopt::Long;

## Ensure proper encoding of IO
use open qw/:std :utf8/;
binmode(STDIN, ':utf8');
binmode(STDOUT, ':utf8');
binmode(STDERR, ':utf8');

## Get options
# my $opt = { code => 0, lists => 0, smartypants => 1 };
# GetOptions($opt, qw/code lists smartypants!/);

## Read input
my $in;
my $fn = shift;
if (defined $fn && -r $fn) {
	open READ, '<', $fn;
	$in = eval { local $/; <READ> };
	close READ;
}
else {
	$in = eval { local $/; <STDIN> };
}

## Profit
# print md2bbc($in, $opt);
print md2bbc($in);

sub md2bbc {
	local $_ = shift or return '';
	# my $opt = shift;

	## Override the Text::Markdown method that handles lists to do
	## nothing if we don't have BBCode lists supported
	# eval {
	# 	no warnings 'redefine';

	# 	sub Text::Markdown::_DoLists {
	# 		my( $self, $text ) = @_;

	# 		return $text;
	# 	}
	# } unless $opt->{lists};

	$_ = Text::Markdown->new->markdown($_);

	## Smartypants operates first so that attributes (e.g., URLs) don't get converted
	# if ($opt->{smartypants}) {
		if (eval { require Text::SmartyPants }) {
			$_ = Text::SmartyPants::process($_, 2); 
		}
		elsif (eval { require Text::Typography }) {
			$_ = Text::Typography::typography($_, 2); 
		}
	# }

	## Simple elements
	my %html2bb = (
		strong     => 'b',
		b          => 'b',
		em         => 'i',
		i          => 'i',
		strike     => 's',
		u          => 'u',
		sup        => 'sup',
		sub        => 'sub',
	);
	while (my($html, $bb) = each %html2bb) {
		s{<(/|)$html( [^>]*)?>}{[$1$bb]}g;
	}

	## Undo anchors elements on unnamed links
	# s{<a
	# 	[^>]*?       # random attributes we don't care about
	# 	href="(.+?)" # target
	# 	[^>]*?       # more random attributes we don't care about
	# >
	# 	https?://.+? # $1 # https?://.+? # (.+?) # text
	# 	</a>
	# }{$1}xg;

    ## Convert links
    s{<a
        [^>]*?       # random attributes we don't care about
        href="(.+?)" # target
        [^>]*?       # more random attributes we don't care about
    >
        (.+?)        # text
        </a>
    }{\#^[url=$1]$2\[/url]}xg;
#   }{[url="$1"]$2\[/url]}xg;

	## Convert images
	# s{<img
	# 	[^>]*?       # random attributes we don't care about
	# 	src="(.+?)"  # target
	# 	[^>]*?       # more random attributes we don't care about
	# 	alt="(.+?)"  # alt
	# 	[^>]*?       # more random attributes we don't care about
	# />
	# }{[img alt=$2]$1\[/img]}xg;

	## Convert images
	s{<img
		[^>]*?       # random attributes we don't care about
		src="(.+?)"  # target
		[^>]*?       # more random attributes we don't care about
	/>
	}{[img]$1\[/img]}xg;
	# }{[img alt=$2]$1\[/img]}xg;


	## Convert h1
	s{<h1>
		(.+?)        # text
		</h1>
	}{[size=x-large][b]$1\[/b]\[/size]}xg;
	# }{[size=24][b]$1\[/b]\[/size]}xg;

	## Convert h2
	s{<h2>
		(.+?)        # text
		</h2>
	}{[size=large][b]$1\[/b]\[/size]}xg;
	# }{[size=18][b]$1\[/b]\[/size]}xg;

	## Convert h3
	s{<h3>
		(.+?)        # text
		</h3>
	}{[size=16][b]$1\[/b]\[/size]}xg;
	# }{[size=large][b]$1\[/b]\[/size]}xg;

	## Convert h4
	s{<h4>
		(.+?)        # text
		</h4>
	}{[b]$1\[/b]}xg;
	# }{[size=14][b]$1\[/b]\[/size]}xg;
	
	## Convert hr
	# s{<hr ?/?>}{\n--------------------------------------------\n}g;

	## Convert hr
	s{(^ *$)?\n?<hr ?/?>\n?(^ *$)?}{[hr]}g;

	## Convert br
	s{(^ *$)?\n?<br ?/?>}{}g;
	# s{(^ *$)?\n?<br ?/?>}{}g;

	## Convert blockquote
	s{(^ *$)?\n?<blockquote>\s*}  {[quote]}g;
	s{( )?\s?</blockquote>\n?}{$1\[/quote]}xg;

	## Undo paragraphs elements
	s{<p>}{}g;
	s{( )?\s?</p>}{$1}xg;

	## Convert colored span elements
	# <span style="color: #888;">
	s{<span
		[^>]*?       # random attributes we don't care about
		style=".*?color\s*:\s*([^;]+?)(;?|;.*?)" # color
		[^>]*?       # more random attributes we don't care about
	>
	    (.+?)        # text
	    </span>
	}{[color=$1]$3\[/color]}xg;

	## Undo code elemeents
	# if ($opt->{code}) {
		s{(^ *$)?\n?<pre><code>}      {[code]}g;
		s{</code></pre>\n?(^ *$)?}    {[/code]}g;
	# }
	# else {
	# 	s{<pre><code>\s*}   {}g;
	# 	s{\s*</code></pre>} {}g;
	# }

	## Convert kbd element
	s{<kbd>}      {[code]}g;
	s{</kbd>}    {[/code]}g;

	# Convert list elements
	# if ($opt->{lists}) {
		s{(^ *$)?\n?<ul>\s*}     {[list]}g;
		s{(^ *$)?\n?<ol>\s*}     {[list=1]}g;
		s{\s*</[uo]l>\n?(^ *$)?} {[/list]}g;
		s{<li>}        {[*]}g;
		s{</li>}       {}g;
	# }

	## Undo cutom elements
	# s{</?
	# 	[^>]*?       # random attributes we don't care about
	# >
	# }{}g;

	## Decode HTML entities
	return decode_entities $_;
}