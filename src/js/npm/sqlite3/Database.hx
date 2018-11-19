package js.npm.sqlite3;

import js.Error;
import js.node.events.EventEmitter;
import haxe.extern.Rest;

@:jsRequire("sqlite3","Database")
extern class Database extends EventEmitter<Database> {
	function new( filename : String, ?mode : Int, ?callback : Error->Void ) : Void;
	function close( ?callback : Error->Void ) : Void;
	function configure( option : Dynamic, value : Dynamic ) : Void;
	//TODO params/Rest
	//function run( sql : String, param : Rest<Dynamic>, ?callback : Error->Void ) : Void;
	function run( sql : String, ?param : Dynamic, ?callback : Error->Void ) : Void;
	function get( sql : String, ?param : Dynamic, ?callback : Error->Void ) : Void;
	function all( sql : String, ?param : Dynamic, ?callback : Error->Void ) : Void;
	function each( sql : String, ?param : Dynamic, ?callback : Error->Void, ?complete : Dynamic ) : Void;
	function exec( sql : String, ?callback : Error->Void ) : Void;
	function prepare( sql : String, ?param : Dynamic, ?callback : Error->Void ) : Statement;
	function serialize( f : Void->Void ) : Void;
}
