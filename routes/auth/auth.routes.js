const express = require('express');
const database = require('../../database/sqlite-db');

router = express.Router();

router.post('/login', async (req, res) => {
    const sql = `SELECT * FROM USER WHERE (user_id == "${req.body.userID}")`;
    let user = await database.querydb(sql);
    if(user.length === 0) {

        res.json(
            false
        )
    }
    else if(user[0].password !== req.body.password){
        res.json(
            false
        )
    }
    else{
        res.json(
            true
        )
    }
    

})


router.post('/signup', async (req, res) => {
    let usersql = `SELECT * FROM USER WHERE (user_id == "${req.body.userID}")`;
    let allUsers = await database.querydb(usersql);
    if(allUsers.length > 0){
        res.json({
            msg: "This username already exists",
            auth: false
        })
    }
    else {
        let insertsql = `INSERT INTO USER (user_id, password) VALUES ("${req.body.userID}", "${req.body.password})"`

        database.updateQuery(insertsql).then(result => {
            if(result) {
                res.json({
                    msg: "Successfully registered",
                    auth: true
                })
            }
            else{
                res.json({
                    msg: "ERROR",
                    auth: false
                })
            }
        })
    }
    

})
module.exports = router;