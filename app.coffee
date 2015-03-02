express = require "express"
path = require "path"
favicon = require "serve-favicon"
expresslog = require "morgan"
cookieParser = require "cookie-parser"
bodyParser = require "body-parser"
logger = require "graceful-logger"

routes = require("./routes/index");

app = express();

# view engine setup
app.set "views", path.join(__dirname, "views")
app.set "view engine", "ejs"
# app.engine("html", require("ejs").renderFile);

# uncomment after placing your favicon in /public
# app.use(favicon(__dirname + "/public/favicon.ico"));
app.use expresslog "dev"
app.use bodyParser.json()
app.use bodyParser.urlencoded { extended: false }
app.use cookieParser()
app.use express.static path.join(__dirname, "public")
app.use express.static path.join(__dirname, "js")
app.use express.static path.join(__dirname, "themes")
app.use express.static path.join(__dirname, "uploadify")
app.use express.static path.join(__dirname, "xheditor")
app.use express.static path.join(__dirname, "chart")
app.use express.static "dwz.frag.xml"

app.use "/", routes

# catch 404 and forward to error handler
app.use (req, res, next) ->
  err = new Error("Not Found")
  err.status = 404
  next(err)

# error handlers

# development error handler
# will print stacktrace
if (app.get("env") == "development") 
  app.use (err, req, res, next) ->
    res.status(err.status || 500);
    res.render("error", {
        message: err.message,
        error: err
    })

debug = require("debug")("dwz")

app.set "port", process.env.PORT || 3000

server = app.listen app.get("port"), ->
  logger.info "Express server listening on port " + server.address().port 
  # console.log "Express server listening on port " + server.address().port 

