const sql = require('mssql')

const config = {
    user: 'Equipo4',
    password: 'TECMty@2022E4',
    database: 'TC2007B',
    server: 'equipo4.database.windows.net',
    options: {
    trustedConnection: true,
    trustServerCertificate: true
  }
} 
const poolPromise = new sql.ConnectionPool(config)
  .connect()
  .then(pool => {
    console.log('Connected to MSSQL')
    return pool
  })
  .catch(err => console.log('Database Connection Failed! Bad Config: ', err))

module.exports = {
  sql, poolPromise
}