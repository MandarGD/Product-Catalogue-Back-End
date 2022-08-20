const express = require('express');
const database = require('../../database/sqlite-db');

router = express.Router();

router.get('/', (req, res) => {
    const sql = `SELECT * FROM CATEGORY`;
    database.querydb2(sql, res);
})


router.get('/products/:cat', async(req, res) => {
    const sql = `SELECT * FROM IN_CATEGORY WHERE(cat_name == ${req.params.cat})`;
    let result = await database.querydb(sql);
    res.json(
        result
    )
})




module.exports = router