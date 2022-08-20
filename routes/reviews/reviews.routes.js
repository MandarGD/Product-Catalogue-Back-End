const express = require('express');
const database = require('../../database/sqlite-db');


router = express.Router();

router.post('/', (req, res) => {
    const sql = `SELECT user_id, rating, rev_description FROM PRODUCT_REVIEW WHERE(prod_name == "${req.body.pname}" and brand_name == "${req.body.bname}")`;
    database.querydb2(sql, res);
})

router.post('/insert', (req, res) => {
    const sql = `INSERT INTO PRODUCT_REVIEW (prod_name, brand_name, user_id, rating, rev_description) VALUES ("${req.body.pname}", "${req.body.bname}", "${req.body.userID}", ${req.body.rating}, "${req.body.desc}")`
    database.updateQuery(sql).then(result => {
        if(result){
            res.json({
                inserted : result
            })
        }
        else{
            res.json({
                inserted : result
            })
        }
    })
})

module.exports = router;