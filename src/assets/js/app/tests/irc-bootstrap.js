// This module facilitates node discovery through a qwebirc server
define(['jquery', 'app/irc'], function($, irc){
	var nodes = irc.bootstrap();
	for(node in nodes) {
		// Add as <li> to DOM
	}
});
