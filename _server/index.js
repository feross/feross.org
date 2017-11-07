var bodyParser = require('body-parser')
var express = require('express')
var mysql = require('mysql')
var secret = require('./secret')

var port = process.argv[2]
if (!port) port = 4001
console.log('Using port ' + port)

var app = express()

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

function createConnection () {
  // Set up a connection for each request
  var connection = mysql.createConnection(secret.db)

  // If there's an error, just print it out. Views aren't that important.
  connection.connect(function (err) {
    if (err) console.error('Database error: Cannot connect.' + err.message)
  })

  connection.on('error', function (err) {
    console.error('Database error: Well, this was really random.', err.message)
  })

  return connection
}

// Increment the view count for a particular post and return
// the current view count.
app.post('/views', function (req, res) {
  var slug = req.param('slug')

  if (!slug) return res.send('Missing `slug` param')

  var connection = createConnection()

  // Get view count and send it
  connection.query('SELECT views FROM views WHERE slug = ?', [slug], function (err, results) {
    if (err) {
      console.error(err.message)
      res.send({ err: 'Error: db error while getting view count' })
    } else if (results.length === 0) {
      res.send({ err: 'Error: slug not found' })
    } else {
      res.send(results[0])
    }

    // Asyncronously update the view count
    var query = 'UPDATE views SET views=views+1 WHERE slug = ?'
    connection.query(query, [ slug ], function (err, results) {
      if (err) {
        console.error(err.message)
        connection.end()
      } else if (results.affectedRows === 0) {
        // If no rows were affected, then this is a new post, so add it
        var query = 'INSERT INTO views (slug, views) VALUES (?, ?)'
        connection.query(query, [ slug, 1 ], function (err, results) {
          if (err) {
            console.error(err.message)
          } else if (results.affectedRows !== 1) {
            console.error('ERROR: Inserting new slug failed')
          } else {
            console.error('Added new slug ' + slug)
          }
          connection.end()
        })
      } else {
        connection.end()
      }
    })
  })
})

// Get the total view count for all posts
app.get('/views/total', function (req, res) {
  var connection = createConnection()

  var query = 'SELECT sum(views) AS views FROM views'
  connection.query(query, function (err, results) {
    if (err) {
      console.error(err.message)
      res.send({ err: 'Error: db error while getting total view count' })
    } else if (results.length > 0) {
      res.send(results[0])
    } else {
      res.send({ err: 'Error: slug not found' })
    }

    connection.end()
  })
})

// Start server
app.listen(port)
