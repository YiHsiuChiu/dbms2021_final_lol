// var  mockDb = require('./MockDb');
const Db = require('./DB');
const express = require('express');
const { mockIsEndUser, mockIsAdmin } = require('./MockDb');
var app = express();

app.use(express.json());

app.get('/player', function (req, res) {
    Db.getPlayers().then(function(result){res.json(result)});
})

app.get('/team', function (req, res) {
    Db.getTeams().then(function(result){res.json(result)});
})

app.get('/game', function (req, res) {
    Db.getGames().then(function(result){res.json(result)});
})

app.get('/player/teamname/:teamname', function (req, res) {
    Db.getPlayersByTeam(req.params.teamname).then(function(result){res.json(result)});
})

app.post('/login', function(req, res) {
    Db.isEndUser(req.body).then(function(result){
        if(result==true){
            console.log("is enduser");
            res.status(200);
            res.end();
        }
        else{
            res.status(404);
            res.end();
        }
    })
})

app.post('/user', function(req, res) {
    Db.addEndUser(req.body).then(function(result){
        if(result==true){
            res.status(200);
            res.end();
        }
        else{
            res.status(400);
            res.end();
        }
    })
})

app.post('/admin', function(req, res) {
    Db.isAdmin(req.body).then(function(result){
        if(result==true){
            console.log("is admin");
            res.status(200);
            res.end();
        }
        else{
            res.status(404);
            res.end();
        }
    })
})

app.post('/game', function(req, res) {
    Db.addGame(req.body).then(function(result){
        if(result==true){
            res.status(200);
            res.end();
        }
        else{
            res.status(400);
            res.end();
        }
    })
})

app.put('/game', function(req, res) {
    Db.updateGame(req.body).then(function(result){
        if(result==true){
            res.status(200);
            res.end();
        }
        else{
            res.status(400);
            res.end();
        }
    })
})

app.post('/vote', function(req, res) {
    Db.vote(req.body).then(function(result){
        if(result==true){
            res.status(200);
            res.end();
        }
        else{
            res.status(400);
            res.end();
        }
    })
})

 var server = app.listen(8081, function () {
    var host = server.address().address
    var port = server.address().port
    console.log("Voting app listening at http://%s:%s", host, port)
 })