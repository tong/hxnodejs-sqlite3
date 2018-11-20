package js.npm.sqlite3;

import js.Error;
import js.node.events.EventEmitter;

@:jsRequire("sqlite3","Statement")
extern class Statement extends EventEmitter<Statement> {

	/**
		Binds parameters to the prepared statement and calls the callback when done or when an error occurs.
	**/
	function bind( ?param : Dynamic, ?callback : Error->Void ) : Statement;

	/**
		Resets the row cursor of the statement and preserves the parameter bindings.
	**/
	function reset( ?callback : Error->Void ) : Statement;

	/**
		Finalizes the statement.
	**/
	function finalize( ?callback : Void->Void ) : Void;

	/**
		Binds parameters and executes the statement.
	**/
	function run( param : Dynamic, ?callback : Error->Void ) : Statement;

	/**
		Binds parameters, executes the statement and retrieves the first result row.
	**/
	function get( ?param : Dynamic, ?callback : Error->Dynamic->Void ) : Statement;

	/**
		Binds parameters, executes the statement and calls the callback with all result rows.
	**/
	function all( ?param : Dynamic, ?callback : Error->Array<Dynamic>->Void ) : Statement;

	/**
		Binds parameters, executes the statement and calls the callback for each result row.
	**/
	function each( ?param : Dynamic, ?callback : Error->Dynamic->Void, ?complete : Error->Int->Void ) : Statement;
}
