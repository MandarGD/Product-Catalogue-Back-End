const express = require('express');
const database = require('../../database/sqlite-db');

router = express.Router();

router.get('/', async (req, res) => {
    const sql = `SELECT * FROM STORE`;
    let result = await database.querydb(sql);
    res.json(
        result
    )
});

router.post('/availableAt', async(req, res) => {
    const sql = `SELECT * FROM AVAILABLE_AT WHERE (prod_name == "${req.body.pname}" and brand_name == "${req.body.bname}")`;
    let result = await database.querydb(sql);
    res.json(
        result
    )
})

router.post('/insert', async(req, res) => {
    const sql = `INSERT INTO AVAILABLE_AT (prod_name, brand_name, s_name, s_location, type)VALUES("${req.body.pname}", "${req.body.bname}", "${req.body.sname}", "${req.body.slocation}", "${req.body.price}")`;
    await database.updateQuery(sql)
})


module.exports = router;