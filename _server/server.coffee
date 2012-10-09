express = require('express')
mysql = require('mysql')
config = require('./config')

isProduction = false

port = process.argv[2]
if port
  isProduction = true
  console.log "Using port #{port}"
else
  isProduction = false
  console.log "Using default port 3000"
  port = 3000

app = express()
app.use(express.bodyParser())

createConnection = ->
  # Set up a connection for each request
  connection = mysql.createConnection
    host: if isProduction then config.db.prod.host else config.db.dev.host
    user: if isProduction then config.db.prod.user else config.db.dev.user
    password: if isProduction then config.db.prod.password else config.db.dev.password
    database: if isProduction then config.db.prod.database else config.db.dev.database

  # If there's an error, just print it out. Views aren't that important.
  connection.connect (err) ->
    if err
      console.log 'Database error: Cannot connect.'
      console.log err
  connection.on 'error', (err) ->
    console.log 'Database error: Well, this was really random.'
    console.log err

# Increment the view count for a particular post and return
# the current view count.
app.post '/views', (req, res) ->

  slug = req.param('slug')

  if !slug
    res.send 'Missing `slug` param'
    return
  
  connection = createConnection()

  # Get view count and send it
  connection.query 'SELECT views FROM views WHERE slug = ?', [slug], (err, results) ->
    if err
      console.log err
      res.send err: 'Error: db error while getting view count'
    else if results.length == 0
      res.send err: 'Error: slug not found'
    else
      res.send results[0]

    # Asyncronously update the view count
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


# Get the total view count for all posts
app.get '/views/total', (req, res) ->
  
  connection = createConnection()

  connection.query 'SELECT sum(views) AS views FROM views', (err, results) ->
    if err
      console.log err
      res.send err: 'Error: db error while getting total view count'
    else if results.length > 0
      res.send results[0]
    else
      res.send err: 'Error: slug not found'

    connection.end()

# Start server
app.listen port