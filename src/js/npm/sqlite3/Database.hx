package js.npm.sqlite3;

import js.Error;
import js.node.events.EventEmitter;
import haxe.extern.Rest;

@:jsRequire("sqlite3","Database")
extern class Database extends EventEmitter<Database> {

	/**
	**/
	function new( filename : String, ?mode : Int, ?callback : Error->Void ) : Void;

	/**
		Closes the database.
	**/
	function close( ?callback : Error->Void ) : Void;

	/**
		Set a configuration option for the database.
	**/
	function configure( option : {
		@:optional @:native("trace") var trace_:Void->Void;
		@:optional var profile:Void->Void;
		@:optional var busyTimeout : Int;
	}, value : Dynamic ) : Void;

	/**
		Runs the SQL query with the specified parameters and calls the callback afterwards.
	**/
	@:overload(function( sql : String, ?param : Rest<Dynamic>, ?callback : Error->Void ) : Database {})
	@:overload(function( sql : String, ?param : Array<Dynamic>, ?callback : Error->Void ) : Database {})
	function run( sql : String, ?param : Dynamic, ?callback : Error->Void ) : Database;

	/**
		Runs the SQL query with the specified parameters and calls the callback with the first result row afterwards.
	**/
	function get( sql : String, ?param : Dynamic, ?callback : Error->Dynamic->Void ) : Database;

	/**
		Runs the SQL query with the specified parameters and calls the callback with all result rows afterwards.
	**/
	function all( sql : String, ?param : Dynamic, ?callback : Error->Array<Dynamic>->Void ) : Database;

	/**
		Runs the SQL query with the specified parameters and calls the callback once for each result row.
	**/
	function each( sql : String, ?param : Dynamic, ?callback : Error->Dynamic->Void, ?complete : Error->Int->Void ) : Database;

	/**
		Runs all SQL queries in the supplied string.
		No result rows are retrieved.
	**/
	function exec( sql : String, ?callback : Error->Void ) : Database;

	/**
		Prepares the SQL statement and optionally binds the specified parameters and calls the callback when done.
	**/
	function prepare( sql : String, ?param : Dynamic, ?callback : Error->Void ) : Statement;

	/**
	**/
	function serialize( f : Void->Void ) : Void;
}
