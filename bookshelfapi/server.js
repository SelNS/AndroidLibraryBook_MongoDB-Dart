const express = require('express');
const app = express();
// const mongoose = require('mongoose');
// const mongoUrl = 'your mongo uri';
const cors = require('cors');
const path = require('path');


const { MongoClient, ServerApiVersion } = require('mongodb');

const uri = "your mongo uri";

// Create a MongoClient with a MongoClientOptions object to set the Stable API version
const client = new MongoClient(uri, {
  serverApi: {
    version: ServerApiVersion.v1,
    strict: true,
    deprecationErrors: true,
  }
});

async function run() {
  try {
    // Connect the client to the server	(optional starting in v4.7)
    await client.connect();
    // Send a ping to confirm a successful connection
    await client.db("library").command({ ping: 1 });
    console.log("Pinged your deployment. You successfully connected to MongoDB!");
  } finally {
    // Ensures that the client will close when you finish/error
    await client.close();
  }
}
run().catch(console.dir);


app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());

const directory = path.join(__dirname, '/static/');
app.use(express.static(directory));

app.use('/user', require('./routes/user'))
app.use('/buku', require('./routes/buku'))


app.listen(5001, () => {
    console.log('Berhasil Jalan');
})
