express = require('express')
mysql = require('mysql')
config = require('./config')

app = express()
app.use(express.bodyParser())

createConnection = ->
  # Set up a connection for each request
  connection = mysql.createConnection
    host: config.db.host
    user: config.db.user
    password: config.db.password
    database: config.db.database

  # If there's an error, just print it out. Views aren't that important.
  connection.connect (err) ->
    if err
      console.log 'Database error: Cannot connect.'
      console.log err
  connection.on 'error', (err) ->
    console.log 'Database error: Well, this was really random.'
    console.log err


app.post '/view', (req, res) ->

  slug = req.param('slug')

  if !slug
    res.send 'Missing `slug` param'
    return
  
  connection = createConnection()

  # First, get view count and send it
  connection.query 'SELECT views FROM views WHERE slug = ?', [slug], (err, results) ->
    if err
      console.log err
      res.send err: 'Error: db error while getting view count'
    else
      if results.length > 0
        res.send results[0]
      else
        res.send err: 'Error: slug not found'

  # Later, we can asyncronously update the view count
  connection.query 'UPDATE views SET views=views+1 WHERE slug = ?', [slug], (err, results) ->
    if err
      console.log err
      connection.end()

    # If no rows were affected, then this is a new post, so add it
    else if results.affectedRows == 0
      connection.query 'INSERT INTO views (slug, views) VALUES (?, ?)', [slug, 1], (err, results) ->
        if err
          console.log err
        else if results.affectedRows != 1
          console.log 'ERROR: Inserting new slug failed'
        else
          console.log "Added new slug #{slug}"

        connection.end()

    else
      connection.end()


# Start server
app.listen 3000