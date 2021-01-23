/*
	https://www.npmjs.com/package/mysql
*/

//setup for connecting to database from node (server side javascript)

//importing the mysql module into this file
var mysql = require('mysql');

//creating a database client to connect to,
//which as you see, uses the object that we set up
/*
	Replace the values in this object with your connection parameters
	Your connection should be the same if you have a 'first_sql' database and there's no password
	If you do not have a 'first_sql' database, create one
*/
var databaseConnection = mysql.createConnection({
	user: 'root',
	password: '',
	database: 'first_sql',
	host: 'localhost',
	port: 3306
});

//connecting to the database
// you dont need to put function after connect as long as the module
// that you're using does good handling of the logs and errors
// you can put the function after connect if you want custom logs and errors
databaseConnection.connect(function(err, res){
	if(err){
		console.error("Error Connecting to Database");
		console.error(err);
	} else {
		console.log("Successfully connected to database");
		console.log(res);
	}
});
// ending the database connection
databaseConnection.end();
