//importing the mysql module into this file
var mysql = require('mysql');

var databaseConnection = mysql.createConnection({
	user: 'root',
	password: '',
	database: 'MyStore',
	host: 'localhost',
	port: 3306
});

//connecting to the database
// you dont need to put function after connect as long as the module
// that you're using does good handling of the logs and errors
// you can put the function after connect if you want custom logs and errors
databaseConnection.connect();

function insertProduct(){
  const insertQueryString = "INSERT INTO products (name, price, quantity, category) VALUES ('wireless headphones', 125.50, 10, 'music')"
  databaseConnection.query(insertQueryString, function(err, data){
    if(err){
      throw new Error(err)
    }
    console.log(data)
  })
}
// if you want to insert a product, run this function
//insertProduct();

function getProducts(){
  const selectAllString = "SELECT * FROM products";
  databaseConnection.query(selectAllString, function(err, data){
    if(err){
      throw new Error(err)
    }
    data.forEach((product) => {
      console.log(product);
    })
  })
}
// if you want to get all products, then run this function
getProducts();

function updateProduct(){
  const updateProductQuery = "UPDATE products SET price=152.50 WHERE name='wireless headphones'";
  databaseConnection.query(updateProductQuery, function(err, data){
    if(err){
      throw new Error(err)
    }
    console.log(data)
  })
}
// updateProduct();

function deleteProduct(){
  const deleteProductQuery = "DELETE FROM products WHERE name='wireless headphones'";
  databaseConnection.query(deleteProductQuery, function(err, data){
    if(err){
      throw new Error(err)
    }
    console.log(data)
  })
}
// deleteProduct();

// ending the database connection
databaseConnection.end();
