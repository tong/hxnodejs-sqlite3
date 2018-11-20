package js.npm;

import js.npm.sqlite3.Database;

@:jsRequire("sqlite3")
extern class Sqlite3 {

	static var OPEN_READONLY(default,never) : Int;
	static var OPEN_READWRITE(default,never) : Int;
	static var OPEN_CREATE(default,never) : Int;

	/**
		Sets the execution mode to verbose to produce long stack traces.
		There is no way to reset this.
	**/
	static function verbose() : Sqlite3;

}
