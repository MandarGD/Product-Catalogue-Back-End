const express = require('express');
const cors = require('cors');
const sqlite3 = require('sqlite3').verbose();
const bodyParser = require('body-parser');

const userRouter = require('./routes/users/user.routes');
const authRouter = require('./routes/auth/auth.routes');
const catRouter = require('./routes/categories/category.routes');
const reviewRouter = require('./routes/reviews/reviews.routes');
const productRouter = require('./routes/products/product.routes');
const storeRouter = require('./routes/stores/stores.routes');



const app = express();

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
app.use(cors())


app.listen(5000);
app.use('/user', userRouter);
app.use('/auth', authRouter);
app.use('/reviews', reviewRouter);
app.use('/products', productRouter);
app.use('/category', catRouter);
app.use('/store', storeRouter);

