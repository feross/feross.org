var express = require('express')
var mysql = require('mysql')
var secret = require('./secret')

var isProduction = false
var port = process.argv[2]

if (port) {
  isProduction = true
} else {
  isProduction = false
  port = 3000
}
console.log ('Using port ' + port)

var app = express()
app.use(express.bodyParser())

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
}

// Increment the view count for a particular post and return
// the current view count.
app.post('/views', function (req, res) {

  var slug = req.param('slug')

  if (!slug)
    return res.send('Missing `slug` param')

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
    connection.query(
        'UPDATE views SET views=views+1 WHERE slug = ?', [slug],
        function (err, results) {
      if (err) {
        console.error(err.message)
        connection.end()
      } else if (results.affectedRows === 0) {
        // If no rows were affected, then this is a new post, so add it
        connection.query(
            'INSERT INTO views (slug, views) VALUES (?, ?)', [slug, 1],
            function (err, results) {
          if (err)
            console.error(err.message)
          else if (results.affectedRows !== 1)
            console.error('ERROR: Inserting new slug failed')
          else
            console.error('Added new slug ' + slug)

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

  connection.query(
      'SELECT sum(views) AS views FROM views',
      function (err, results) {
    if (err) {
      console.erorr(err.message)
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

