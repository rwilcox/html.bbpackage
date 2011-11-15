#!/usr/bin/php
<?php
# Uses the CSS Tidy package <http://csstidy.sourceforge.net/index.php>, licensed under the GPL

include dirname(__FILE__). '/../../SharedSupport/csstidy/class.csstidy.php';

$input = file_get_contents('php://stdin');

# might need to add some options to the css tidy
# class.

$css = new csstidy();
$css->parse($input);
$css->load_template('low_compression');
echo $css->print->plain();
?>
