var statik = require('statik');
statik({port: (process.env.PORT || 3000), root: (process.env.PWD + "/public")});
