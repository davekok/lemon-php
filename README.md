Lemon Parser Generator
======================

(for licensing and copyright information, see COPYING)

This is an adaptation of lemon that optionally emits PHP code to implement a
parser for the grammar described in a .y file.

Usage:

	docker run --rm -it broekhuis/lemon -lPHP my.y

This will output `my.php`, which contains a PHP class that implements your parser.
Usage is along the lines of:

	$parser = new Parse();
	$lexer = lexer();
	foreach ($lexer => [$token, $value])
	{
		$parser->parse($token, $value);
	}
	$ast = $parser->parse(0);

You can find out more about the lemon syntax from:
<http://www.hwaci.com/sw/lemon/lemon.html>
