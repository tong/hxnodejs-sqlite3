
import js.npm.sqlite3.Database;

function main() {
	var db = new Database( Database.MEMORY );
	db.serialize( () -> {
		db.run( "CREATE TABLE lorem (info TEXT)" );
		var stmt = db.prepare( "INSERT INTO lorem VALUES (?)" );
		for( i in 0...10 ) {
			stmt.run( "Ipsum "+i );
		}
		stmt.finalize();
		db.each( "SELECT rowid AS id, info FROM lorem", (err,row) -> {
			trace( row.id + ": " + row.info );
		});
	});
	db.close();
}
