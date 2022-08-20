const express = require('express');
const database = require('../../database/sqlite-db');

router = express.Router();

router.get('/', async (req, res) => {
    const sql = `SELECT * FROM PRODUCT`;
    database.querydb2(sql, res);
});

router.post('/getbyInfo', async(req, res) => {
    const sql = `
        SELECT * FROM (
            (SELECT * FROM PRODUCT WHERE (prod_name == "${req.body.pname}" and brand_name == "${req.body.bname}"))
            NATURAL JOIN
            (IN_CATEGORY)
        )
    `;
    let result = await database.querydb(sql);
    res.json(
        result
    )
});

router.post('/getbyname', async(req, res) => {
    // let sql = `SELECT * FROM PRODUCT WHERE `;
    let x = 0;
    if(req.body.rating !== ''){
        x = req.body.rating;
    }

    let sql = `
    SELECT * FROM (
        (SELECT * FROM PRODUCT WHERE (prod_name like "%${req.body.pname}%" and brand_name like "%${req.body.bname}%"))
        natural Join
        (IN_CATEGORY)
    )
    where (cat_name == "${req.body.catname}")
    `;

    if(req.body.catname == ""){
        sql = `SELECT * FROM PRODUCT WHERE (prod_name like "%${req.body.pname}%" and brand_name like "%${req.body.bname}%")`
    }


    let result = await database.querydb(sql)

    res.json(
        result
    )

})

router.get('/uploadedby/:id', (req, res) => {
    const sql = `SELECT * FROM PRODUCT WHERE (uploaded_by == ${req.params.id})`;
    database.querydb2(sql, res);
});

router.get('/getbyrating/:rating', (req, res) => {
    const sql = `SELECT * FROM PRODUCT WHERE (rating >= ${req.params.rating})`;
    database.querydb2(sql, res);
});


router.post('/insert', async(req, res) => {
    let sql = `INSERT INTO PRODUCT (prod_name, brand_name, prod_description, uploaded_by) VALUES ("${req.body.pname}", "${req.body.bname}", "${req.body.desc}", "${req.body.userID}")`
    await database.updateQuery(sql)
    for( let x = 0; x < req.body.categories.length; x++){
        
        let sql = `INSERT INTO IN_CATEGORY (prod_name, brand_name, cat_name) VALUES("${req.body.pname}", "${req.body.bname}", "${req.body.categories[x]}")`
        database.updateQuery(sql);
    }
    // req.body.categories.foreach(x => {
    //     let sql = `INSERT INTO IN_CATEGORY (prod_name, brand_name, cat_name) VALUES("${req.body.pname}", "${req.body.bname}", "${x}")`
    //     database.updateQuery(sql);
    // })
})

module.exports = router;