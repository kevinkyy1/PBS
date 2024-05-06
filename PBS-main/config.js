const mysql = require('mysql')
const db = mysql.createConnection ({
    host: 'sql6.freesqldatabase.com',
    user: 'sql6700945',
    password: 'cgWeigxhlx',
    database: 'sql6700945'
})
module.exports = db