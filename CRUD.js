const { MongoClient } = require('mongodb');
const uri = 'your-mongodb-uri';
const client = new MongoClient(uri);

async function run() {
  try {
    await client.connect();

    const db = client.db('labdb');
    const collection = db.collection('students');

    await collection.insertOne({ name: 'John', age: 22 });

    const docs = await collection.find().toArray();
    console.log('Find:', docs);

    await collection.updateOne(
      { name: 'John' },
      { $set: { age: 23 } }
    );

    await collection.deleteOne({ name: 'John' });
  } finally {
    await client.close();
  }
}

run();
