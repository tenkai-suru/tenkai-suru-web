var statik = require('statik');
statik({port: (process.env.PORT || 3004), root: (process.env.PWD + "/public")});
