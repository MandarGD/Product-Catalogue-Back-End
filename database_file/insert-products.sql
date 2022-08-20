SELECT * FROM (
        (SELECT * FROM PRODUCT WHERE (prod_name like "%%" and brand_name like "%hilroy%"))
        natural Join
        IN_CATEGORY
    )
    where (cat_name == "Art")








