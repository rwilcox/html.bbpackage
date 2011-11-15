A BBEdit package to make working with HTML easier
===================================================

People have been writing HTML with BBEdit since the inception of HTML itself.

The package gathers up some gems from the community (for example: JS Lint integration for BBEdit) and packages it all together, along with some scripts I (Ryan Wilcox) and others wrote and/or ported.

Installation
============

    $ cd Library/Application\ Support/BBEdit/
    $ mkdir Packages # if it doesn't already exists
    $ cd Packages
    $ git clone https://github.com/rwilcox/html.bbpackage.git

And restart BBEdit.

The JS Lint script requires jsl to be in `/opt/local/bin/jsl`. To install this via Macports:

  `sudo port install jsl`.

(Yes, I know I'm showing my Macports bias.)

Have a useful thing to contribute?
=============================

Please do! I'm sure you HTML developers/designers have great scripts and text filters the community would like to use too. I don't write pure HTML much, so I'd love to see more tools from people who make their livings writing HTML in BBEdit.

License
================

Public domain, unless otherwise noted.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
