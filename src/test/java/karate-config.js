function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'pro';
  }
  var config = {
    env: env,
    apiUrl: 'https://deckofcardsapi.com/api/',
    proxy: 'http://localhost:8080'
  }

  return config;
}
