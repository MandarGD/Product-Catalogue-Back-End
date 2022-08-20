const sqlite3 = require('sqlite3');
const { callbackify } = require('util');

//connect to database
const database = new sqlite3.Database(
    "./database_file/Product_Catalogue.db",
    sqlite3.OPEN_READWRITE, (error) => {
        if(error) {
            console.log("Could not open database");
        }
        else{
            console.log("Connected to Database");
        }
    })

module.exports = {
    //query function that runs the given sql on the database
    querydb : async (QueryString) => {
        //return a promise to get the data from the query
        return new Promise ((resolve, reject) => {
            database.all(QueryString, [], (error, rows) => {
                if (error){
                    console.log("Could not complete query");
                    reject(error);
                }
                return resolve(rows);
            })
        })
    },

    querydb2 : async (QueryString, res) => {
        var results = [];
        database.each(QueryString, [], (error, row) => {
            results.push(row)
        },
        (error, count) => {
            res.json({
                results
            })
        })
    },
    updateQuery : async (QueryString) => {
        return new Promise((resolve, reject) => {
            database.run(QueryString, (x, error) => {
                if(error){
                    resolve(false)
                }
            });
            resolve(true)
        })
        
        // database.run(QueryString, (error) => {
        //     if(error){
        //         console.log(error)
        //     }
        // })
        
    }
}