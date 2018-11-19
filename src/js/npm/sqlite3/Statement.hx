package js.npm.sqlite3;

import js.Error;
import js.node.events.EventEmitter;
import haxe.extern.Rest;

@:jsRequire("sqlite3","Statement")
extern class Statement extends EventEmitter<Statement> {
	function bind( ?param : Dynamic, ?callback : Error->Void ) : Void;
	function reset( ?callback : Error->Void ) : Void;
	function finalize( ?callback : Void->Void ) : Void;
	function run( ?param : Dynamic, ?callback : Error->Void ) : Void;
	function get( ?param : Dynamic, ?callback : Error->Void ) : Void;
	function all( ?param : Dynamic, ?callback : Error->Void ) : Void;
	function each( ?param : Dynamic, ?callback : Error->Void, ?complete : Dynamic ) : Void;
}
