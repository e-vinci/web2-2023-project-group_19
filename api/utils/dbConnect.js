const { Client } = require('pg');

/*
    Dans le dossier "api" :

    -   Créer un dossier "databaseCredentials"
    -   Dans le dossier "databaseCredentials", créer un fichier "userCredentials.json"
    -   Dans le fichier "userCredentials.json", mettre ceci :

        {
            "user" : "postgres",
            "host" : "localhost",
            "database" : "quizzler",
            "password" : "mdp",
            "port" : "5432"
        }

    En cas de problème, contacter monsieur JS

*/

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
    console.log(error);
  }
}

async function disconnectDb() {
  try {
    await client.end();
  } catch (error) {
    console.log(error);
  }
}

module.exports = { client, connectDb, disconnectDb };
