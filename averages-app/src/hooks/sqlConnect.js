function sqlConnect() {
    var Connection = require('tedious').Connection;
    var Request = require('tedious').Request;
    var TYPES = require('tedious').TYPES;

    // Create connection to database
    var config = {
      userName: 'bcomer',
      password: '}a8?X[XLPs[RawyKQ}?7', // update me
      server: 'localhost',
      options: {
          database: 'averages_app'
      }
    }
    var connection = new Connection(config);

    // Attempt to connect and execute queries if connection goes through
    connection.on('connect', function(err) {
      if (err) {
        console.log(err);
      } else {
        console.log('Connected and listening...');
      }
    });
}

export default sqlConnect;