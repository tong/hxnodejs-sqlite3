package js.npm.sqlite3;

import haxe.extern.Rest;
import js.lib.Error;
import js.node.events.EventEmitter;

@:enum abstract DatabaseEvent(String) to String {
	var trace_ = "trace";
	var profile = "profile";
	var insert = "insert";
	var update = "update";
	var delete = "delete";
}

/**
	@see https://github.com/mapbox/node-sqlite3/wiki/API#database
**/
@:jsRequire("sqlite3","Database")
extern class Database extends EventEmitter<Database> {

	/**  Anonymous in-memory database  **/
	public static inline var MEMORY = ":memory:";

	/** Anonymous disk-based database **/
	public static inline var ANONYMOUS = "";

	/**
		@param filename  Valid values are filenames, ":memory:" for an anonymous in-memory database and an empty string for an anonymous disk-based database.
		@param mode  One or more of `OPEN_READONLY`, `OPEN_READWRITE` and `OPEN_CREATE` (default = `OPEN_READWRITE | OPEN_CREATE`).
		@param callback  Called when the database was opened successfully or when an error occurred.
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
		/**
			Callback invoked when an SQL statement executes, with a rendering of the statement text.
		**/
		@:optional @:native("trace") var trace_:Void->Void;
		/**
			Callback invoked every time an SQL statement executes.
		**/
		@:optional var profile:Void->Void;
		/**
			@see https://www.sqlite.org/c3ref/busy_timeout.html
		**/
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

	//TODO: function map() : Database;

	//TODO: function backup() : Backup;

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
		Puts the execution mode into serialized.
		At most one statement object can execute a query at a time.
		Other statements wait in a queue until the previous statements are executed.

		@see https://github.com/mapbox/node-sqlite3/wiki/Control-Flow#databaseserializecallback
	**/
	function serialize( ?callback : Void->Void ) : Void;

	/**
		Puts the execution mode into parallelized.
		Queries scheduled will be run in parallel.

		@see https://github.com/mapbox/node-sqlite3/wiki/Control-Flow#databaseparallelizecallback
	**/
	function parallelize( ?callback : Void->Void ) : Void;
}
