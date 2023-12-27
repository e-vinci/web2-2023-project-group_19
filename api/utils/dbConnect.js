const { Client } = require('pg');

const userCredentials = require('../databaseCredentials/userCredentials.json');

const client = new Client({
  user: userCredentials.user,
  host: userCredentials.host,
  database: userCredentials.database,
  password: userCredentials.password,
  port: userCredentials.port,
});

async function connectDb() {
  try {
    await client.connect();
  } catch (error) {
    // eslint-disable-next-line no-console
    console.error(error);
  }
}

async function disconnectDb() {
  try {
    await client.end();
  } catch (error) {
    // eslint-disable-next-line no-console
    console.error(error);
  }
}

connectDb();

module.exports = {
  client,
  disconnectDb,
};
