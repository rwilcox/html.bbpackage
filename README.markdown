A BBEdit package to make working with HTML easier
===================================================

People have been writing HTML with BBEdit since the inception of HTML itself.

The package gathers up some gems from the community (for example: JS Lint integration for BBEdit) and packages it all together, along with some scripts I (Ryan Wilcox) and others wrote and/or ported.

Installation
============

    $ cd Library/Application\ Support/BBEdit/
    $ mkdir Packages                            # if it doesn't already exists
    $ cd Packages
    $ git clone https://github.com/rwilcox/html.bbpackage.git
    $ sudo gem install htmlentities             # for escape_html_entities filter to work propely

And restart BBEdit.

The JS Lint script requires jsl to be in `/opt/local/bin/jsl`. To install this via Macports:

  `sudo port install javascript-lint`.

(Yes, I know I'm showing my Macports bias.)

Current Features
==========================

Text Filters:

  * Tidy your CSS with CSS Tidy
  * Sort your CSS Properties with CSS Comb
  * Escape and unescape text to be suitable to be passed in a URI
  * Escape and Unescape HTML Entities
  * Beautify your Javascript using the script that powers [JS Beautifier](http://jsbeautifier.org/)
  * Validate your JSON
  * Make your JSON pretty (mostly for human debugging of JSON output)
  
Scripts:

  * Run JS Lint
  * Jump to end of current tag
  * Select contents of current tag
  * select contents of current tag AND the beginning and ending HTML tags


Have a useful thing to contribute?
=============================

Please do! I'm sure you HTML developers/designers have great scripts and text filters the community would like to use too. I don't write pure HTML much, so I'd love to see more tools from people who make their livings writing HTML in BBEdit.


License
================

Public domain, unless otherwise noted.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
