const express = require('express');
const database = require('../../database/sqlite-db');

router = express.Router();

router.get('/', async(req, res) => {
    const sql = `SELECT * FROM USER`;
    await database.querydb2(sql, res);
})
router.get('/:id', async(req, res) => {
    const sql = `SELECT * FROM USER WHERE (user_id == "${req.params.id}")`;
    let user = await database.querydb(sql);
    res.json(
        user
    )
})

module.exports = router;