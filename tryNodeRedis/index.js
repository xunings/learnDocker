const express = require('express');
const redis = require('redis');

const app = express();
const client = redis.createClient({
	//host: 'https://my-redis-server.com'
	// the client tries to connect to a server called redis-server
	host: 'redis-server',
	port: 6379
});
client.set('visits', 0);

app.get('/', (req,res) => {
	client.get('visits', (err, visits) => {
		res.send('Num of visits is ' + visits);
		client.set('visits', parseInt(visits)+1);
	});
}); 

app.listen(8081, () => {
	console.log('Listening on port 8081');
});