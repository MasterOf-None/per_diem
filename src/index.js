// Imports
const express = require('express');
const morgan = require('morgan');
const path = require('path');
const exphbs = require('express-handlebars');

// Initializations
const app = express();

// Settings
app.set('appName', 'Sistema Integral de Gestión de Viáticos');
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.engine(
  '.hbs',
  exphbs({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
  })
);
app.set('view engine', '.hbs');

// Middlewares
app.use(morgan('dev'));
app.use(express.urlencoded({extended: 'false'}));
app.use(express.json());

// Global variables
app.use((req, res, next) =>
{
  next();
});

// Routes
app.use(require('./routes'));
app.use(require('./routes/authentication'));
app.use('/viatical', require('./routes/viatical'));

// Public
app.use(express.static(path.join(__dirname, 'public')));

// Starting the server
app.listen(app.get('port'), () => {
  console.log(`${app.get('appName')} on port: ${app.get('port')}`);
  var os = require('os');
  console.log(os.hostname());
});