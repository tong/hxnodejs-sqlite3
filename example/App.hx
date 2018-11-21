
class App {

	static function main() {
		var db = new js.npm.sqlite3.Database( ':memory:' );
		db.serialize( function() {
			db.run( "CREATE TABLE lorem (info TEXT)" );
			var stmt = db.prepare( "INSERT INTO lorem VALUES (?)" );
			for( i in 0...10 ) {
				stmt.run( "Ipsum "+i );
			}
			stmt.finalize();
			db.each( "SELECT rowid AS id, info FROM lorem", function(err,row) {
				trace( row.id + ": " + row.info );
			});
		});
		db.close();
	}

}
