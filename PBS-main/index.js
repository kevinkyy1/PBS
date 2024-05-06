const express = require('express')
const app = express()
const port = 3002
const bodyParser = require ('body-parser')
const db = require('./config.js')
const response = require ('./request.js')
app.use(bodyParser.json())

app.get('/passengers',(req,res)=>{
    const sql = 'SELECT * FROM passengers'
    db.query(sql,(error, result)=>{
        response(200,result,'data passengers',res)
    })
    
})
app.get('/routes',(req,res)=>{
    const sql = 'SELECT * FROM routes'
    db.query(sql,(error, result)=>{
        response(200,result,'data routes',res)
    })
    
})
app.get('/tickets',(req,res)=>{
    const sql = 'SELECT * FROM tickets'
    db.query(sql,(error, result)=>{
        response(200,result,'data tickets',res)
    })
    
})
app.get('/passengers/:passenger_id',(req,res)=>{
    const passenger_id = req.params.passenger_id
    const sql = `SELECT * FROM passengers where passenger_id ='${passenger_id}'`
    db.query(sql, (err, result)=>{
        if(err)throw err
        response(200,result,"get detail passengers",res)
    })
})
app.get('/routes/:route_id',(req,res)=>{
    const route_id = req.params.route_id
    const sql = `SELECT * FROM routes where route_id ='${route_id}'`
    db.query(sql, (err, result)=>{
        if(err)throw err
        response(200,result,"get detail routes",res)
    })
})
app.get('/tickets/:ticket_id',(req,res)=>{
    const ticket_id = req.params.ticket_id
    const sql = `SELECT * FROM tickets where ticket_id ='${ticket_id}'`
    db.query(sql, (err, result)=>{
        if(err)throw err
        response(200,result,"get detail tickets",res)
    })
})
app.post('/passengers',(req, res)=>{
    const {passenger_id, nama, jenis_kelamin, umur, email, notelp}=req.body
    const sql = `INSERT INTO passengers (passenger_id,nama,jenis_kelamin,umur,email,notelp) values ('${passenger_id}','${nama}','${jenis_kelamin}','${umur}','${email}','${notelp}');`
    db.query(sql,(error, fields)=>{
    if(error)response(500, 'invalid', `${nama} dengan id ${passenger_id} sudah di tambahkan`, res)
    if(fields?.affectedRows){
        const data = {
            isSucces: fields.affectedRows,
            id:fields.insertId,
        }
        response(200,data,"Data berhasil di simpan",res)
    }
    })
})
app.post('/routes',(req, res)=>{
    const {route_id, asal, tujuan, tarif}=req.body
    const sql = `INSERT INTO routes (route_id,asal,tujuan,tarif) values ('${route_id}','${asal}','${tujuan}','${tarif}');`
    db.query(sql,(error, fields)=>{
    if(error)response(500, 'invalid', `${asal} dengan id ${route_id} sudah di tambahkan`, res)
    if(fields?.affectedRows){
        const data = {
            isSucces: fields.affectedRows,
            id:fields.insertId,
        }
        response(200,data,"Data berhasil di simpan",res)
    }
    })
})
app.post('/tickets',(req, res)=>{
    const {ticket_id,passenger_id, route_id, tanggal_pembelian, jumlah}=req.body
    const sql = `INSERT INTO tickets (ticket_id,passenger_id,route_id,tanggal_pembelian,jumlah) values ('${ticket_id}','${passenger_id}','${route_id}','${tanggal_pembelian}','${jumlah}');`
    db.query(sql,(error, fields)=>{
    if(error)response(500, 'invalid', `${passenger_id} dengan id ${ticket_id} sudah di tambahkan`, res)
    if(fields?.affectedRows){
        const data = {
            isSucces: fields.affectedRows,
            id:fields.insertId,
        }
        response(200,data,"Data berhasil di simpan",res)
    }
    })
})
app.listen(port, () => {
    console.log(`Runing in port ${port}`)
})

