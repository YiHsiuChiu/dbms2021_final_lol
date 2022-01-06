var  mockDb = require('./MockDb');
var express = require('express');
const { mockIsEndUser, mockIsAdmin } = require('./MockDb');
var app = express();

app.use(express.json());

app.get('/player/name/:name', function (req, res) {
    res.json(mockDb.mockGetPlayers(req.params.name));
})

app.get('/player/id/:id', function (req, res) {
    res.json(mockDb.mockGetPlayers(req.params.id));
})

app.get('/player/role/:role', function (req, res) {
    res.json(mockDb.mockGetPlayers(req.params.role));
})

app.get('/player/teamname/:teamname', function (req, res) {
    res.json(mockDb.mockGetPlayers(req.params.teamname));
})

app.get('/team/teamname/:teamname', function (req, res) {
    res.json(mockDb.mockGetTeams(req.params.teamname));
})

app.get('/team/city/:city', function (req, res) {
    res.json(mockDb.mockGetTeams(req.params.city));
})

app.get('/team/owner/:owner', function (req, res) {
    res.json(mockDb.mockGetTeams(req.params.owner));
})

app.get('/team/region/:region', function (req, res) {
    res.json(mockDb.mockGetTeams(req.params.region));
})
 
app.get('/game/starttime/:starttime', function (req, res) {
    res.json(mockDb.mockGetGames(req.params.starttime));
})

app.get('/game/endtime/:endtime', function (req, res) {
    res.json(mockDb.mockGetGames(req.params.starttime));
})

app.get('/game/fractionoffinal/:fractionoffinal', function (req, res) {
    res.json(mockDb.mockGetGames(req.params.fractionoffinal));
})

app.get('/game/team/:team', function (req, res) {
    res.json(mockDb.mockGetGames(req.params.team));
})

app.get('/game/mvp/:mvp', function (req, res) {
    res.json(mockDb.mockGetGames(req.params.starttime));
})

app.post('/login', function(req, res) {
    if(mockDb.mockIsEndUser(req.body)){
        console.log("is enduser");
        res.status(200);
        res.end();
    }
    else{
        res.status(404);
        res.end();
    }
})

app.post('/user', function(req, res) {
    if(mockDb.mockAddEndUser(req.body)){
        res.status(200);
        res.end();
    }
    else{
        res.status(400);
        res.end();
    }
})

app.post('/game', function(req, res) {
    if(mockDb.mockAddGame(req.body)){
        res.status(200);
        res.end();
    }
    else{
        res.status(400);
        res.end();
    }
})

app.put('/game', function(req, res) {
    if(mockDb.mockUpdateGame(req.body)){
        res.status(200);
        res.end();
    }
    else{
        res.status(400);
        res.end();
    }
})

app.post('/admin', function(req, res) {
    if(mockDb.mockIsAdmin(req.body)){
        console.log("is Admin");
        res.status(200);
        res.end();
    }
    else{
        res.status(404);
        res.end();
    }
})

 var server = app.listen(8081, function () {
    var host = server.address().address
    var port = server.address().port
    console.log("Voting app listening at http://%s:%s", host, port)
 })