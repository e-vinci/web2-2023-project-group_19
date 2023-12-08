const express = require('express');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const cors = require('cors');

const corsOptions = {
  origin: ['http://localhost:8080', 'http://localhost:3000'],
};

const usersRouter = require('./routes/users');
const quizzesRouter = require('./routes/quizzes');
const classementRouter = require('./routes/classement');
const authsRouter = require('./routes/auths');

const app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

app.use(cors(corsOptions));

app.use('/users', usersRouter);
app.use('/quizzes', quizzesRouter);
app.use('/classement', classementRouter);
app.use('/auths', authsRouter);

module.exports = app;
