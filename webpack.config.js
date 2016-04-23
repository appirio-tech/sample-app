require('./node_modules/coffee-script/register');

if (process.env.TRAVIS_BRANCH == 'master') process.env.ENV = 'PROD'
if (process.env.TRAVIS_BRANCH == 'dev') process.env.ENV = 'DEV'
if (process.env.TRAVIS_BRANCH == 'qa') process.env.ENV = 'QA'

if (process.env.ENV == 'DEV') {
  process.env.COOKIE_DOAMIN      = '.topcoder-dev.com'
  process.env.LOGIN_RETURN_URL   = 'https://sample.topcoder-dev.com/'
  process.env.LOGOUT_RETURN_URL  = 'https://sample.topcoder-dev.com/'
  process.env.ACCOUNTS_LOGIN_URL = 'https://accounts.topcoder-dev.com/login'
  process.env.ACCOUNTS_LOGOUT_URL= 'https://accounts.topcoder-dev.com/logout'
  process.env.CONNECTOR_URL = 'https://accounts.topcoder-dev.com/connector.html'
}
else if (process.env.ENV == 'QA') {
  process.env.COOKIE_DOAMIN      = '.topcoder-qa.com'
  process.env.LOGIN_RETURN_URL   = 'https://sample.topcoder-qa.com/'
  process.env.LOGOUT_RETURN_URL  = 'https://sample.topcoder-qa.com/'
  process.env.ACCOUNTS_LOGIN_URL = 'https://accounts.topcoder-qa.com/login'
  process.env.ACCOUNTS_LOGOUT_URL= 'https://accounts.topcoder-qa.com/logout'
  process.env.CONNECTOR_URL = 'https://accounts.topcoder-qa.com/connector.html'
}
else {
  process.env.COOKIE_DOAMIN      = '.topcoder-dev.com'
  process.env.LOGIN_RETURN_URL   = 'http://local.sample.topcoder-dev.com:3100/'
  process.env.LOGOUT_RETURN_URL  = 'http://local.sample.topcoder-dev.com:3100/'
  process.env.ACCOUNTS_LOGIN_URL = 'http://local.accounts.topcoder-dev.com:8000/#login'
  process.env.ACCOUNTS_LOGOUT_URL= 'http://local.accounts.topcoder-dev.com:8000/#logout'
  process.env.CONNECTOR_URL = 'http://local.accounts.topcoder-dev.com:8000/connector.html'
}

config = require('appirio-tech-webpack-config')({
  dirname: __dirname,
  entry: {
    app: './app/index'
  },
  template: './app/index.html'
});

module.exports = config;