package js.npm;

import js.Error;
import js.npm.sqlite3.Database;

@:jsRequire("sqlite3")
extern class Sqlite3 {

	static var OPEN_READONLY(default,never) : Int;
	static var OPEN_READWRITE(default,never) : Int;
	static var OPEN_CREATE(default,never) : Int;

	/**
		Sets the execution mode to verbose to produce long stack traces.
	**/
	static function verbose() : Sqlite3;

	/*
	public static inline function open( filename : String, ?mode : Int, callback : Error->Database->Void ) : Void {
		var db : Database;
		db = new Database( filename, mode, function(e){
			trace( e );
			if( e == null ) callback( e, null ) else callback( null, db );
		} );
	}
	*/

}
