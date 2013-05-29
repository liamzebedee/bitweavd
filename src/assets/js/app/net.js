// The networking module
//
// This module contains a generic remote procedure call mechanism that functions 
// over WebRTC DataChannels. 
// (see docs/rpc.md for more info)
define(['jquery', 'app/webrtc', 'bencode'],
function($, webrtc, bencode){

// Version to be transmitted over the wire.
const version = '0.0.0a';
// see register
var services = {};

// Register a function @func as service @name to be provided by RPC.
// @func must be in the form function(msg, args)
function register(name, func) {
	services[name] = func;
}

function Node() {
	// Helpers
	// XXX convert to 'class' format
	function Query() {
		return {
			'q': {
				v: version,
				m: null,
				p: null,
			}
		};
	}
	
	function Reply() {
		return {
			'r': {
				v: version,
				i: 0,
				r: null,
			}
		}
	}
	
	
	var pending = {};
	var idCounter = 0;
	function getNewId() {
		idCounter++;
		return idCounter;
	}
	
	function query(name, args) {
		// XXX check if args is an obj
		var queryMsg = Query();
		var id = getNewId();
		queryMsg.m = name;
		queryMsg.p = args;
		querymsg.i = id;
		this.sendDict(queryMsg);
		var dfd = $.Deferred();
		pending[id] = dfd;
		return dfd.promise();
	}
	function queryNoReply(name, args) {
		// XXX check if args is an obj
		var queryMsg = Query();
		queryMsg.m = name;
		queryMsg.p = args;
		this.sendDict(queryMsg);
	}
	
	function sendDict(dict) {
		var msg = bencode.encode(dict);
		// XXX Write to datachannel
	}
	
	function onmessage(msg) {
		msg = bencode.decode(msg);
	
		// Query
		if(msg.q) {
			// Validate message
			msg = msg.q;
			// XXX validate more
			// Get service
			var service = services[msg.m];
			// Construct the message info
			var msgInfo = {
				sender: this,
				id: msg.i,
				version: msg.v
			};
			msgInfo.reply = function(args) {
				replyMsg = Reply();
				replyMsg.i = msg.i;
				// XXX check args if dict
				replyMsg.r = args;
			};
			// Run the service
			service(msgInfo, msg.p);
			return;
		}
		// Reply
		else if(msg.r) {
			// Validate message
			msg = msg.r;
			// XXX check if msg.p is dict
			// Get $.Defferred of query awaiting reply
			var dfd = pending[msg.i];
			if(!dfd) return;
			// Resolve and return
			dfd.resolve(msg.v);
			delete pending[msg.i]
			return;
		}
	}
	
	return {
		query: query,
		queryNoReply: queryNoReply,
	}
}

function connect(){} // XXX

return {
	version: version,
	register: register,
}});
