const express = require('express');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const cors = require('cors');

const corsOptions = {
  origin: [
    'http://localhost:8080',
    'https://quizzlerr.github.io/quizzlerr/',
    'https://quizzlerr.github.io',
    'https://quizzlerr.github.io/quizzlerr/login',
    'https://quizzlerr.github.io/quizzlerr/register',
  ],
};

const usersRouter = require('./routes/users');
const quizzesRouter = require('./routes/quizzes');
const authsRouter = require('./routes/auths');

const app = express();

app.use(cors(corsOptions));

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

app.use('/users', usersRouter);
app.use('/quizzes', quizzesRouter);
app.use('/auths', authsRouter);

module.exports = app;
