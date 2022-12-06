const express = require('express')
const mysql = require('mysql')
const myconn = require('express-myconnection')


const app = express()

app.set('port', process.env.PORT || 9000)
const dbOptions = {
    host: 'localhost',
    port: 3308,
    user: 'root',
    password: '',
    database: 'noysita_oficial'
}

// Middlewares
app.use(myconn(mysql,dbOptions,'single'))
app.use(express.json())
// Rutas
app.use(require('./rutas/clientes'))
app.use(require('./rutas/empleados'))
app.use(require('./rutas/proveedores'))
app.use(require('./rutas/compras'))
app.use(require('./rutas/inventarios'))
app.use(require('./rutas/cai'))
app.use(require('./rutas/facturas'))
app.use(require('./rutas/platillos'))
app.use(require('./rutas/rol'))
app.use(require('./rutas/bitacora'))
 // Server running
app.listen(app.get('port'), () =>{
    console.log('Server running on port',app.get('port'))
})
///