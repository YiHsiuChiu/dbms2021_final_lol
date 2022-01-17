const  config = require('./dbconfig');
const pg = require('pg');
const Game = require('./Game');
const Team = require('./Team');
const Player = require('./Player');
const Region = require('./Region');
const client = new pg.Client(config);
client.connect(err => {
    if (err) throw err;
});

async function getPlayers(){
    // console.log('getPlayers')
    const query = 'Select player.*, sum(case when player.id=game.mvp then 1 else 0 end) as mvp_times From player, game Group BY player.id;';
    let players = [];
    const res = await client.query(query);
    // console.log('playerSQL get')
    const rows = res.rows;
    rows.map(row => {
            players.push(new Player(row['id'], row['name'], row['birth_date'], row['role'], row['team_name'], row['join_date'], row['mvp_times'], row['picture']));
    });
    // console.log('player return')
    return players;
}

async function getPlayersByTeam(team){
    // console.log(team)
    const query = `Select player.*, sum(case when player.id=game.mvp then 1 else 0 end) as mvp_times From player, game Where player.team_name='${team}' Group BY player.id;`;
    let players = [];
    const res = await client.query(query);
    const rows = res.rows;
    rows.map(row => {
            players.push(new Player(row['id'], row['name'], row['birth_date'], row['role'], row['team_name'], row['join_date'], row['mvp_times'], row['picture']));
    });
    return players;
}

async function getTeams(){
    // console.log('getTeams')
    const query = 'SELECT * FROM team;';
    let teams = [];
    const res = await client.query(query);
    // console.log('teamSQL get')
    const rows = res.rows;
    rows.map(row => {
        teams.push(new Team(row['name'], row['city'], row['owner'], row['create_date'], row['region_name'], row['picture']));
    });
    // console.log('team return')
    return teams;
}

async function getGames(){
    // console.log('getGames')
    const query = 'SELECT GAME.*, SUM(CASE WHEN (GAME.START_TIME = VOTE.GAME_START_TIME) AND (GAME.TEAM_RED = VOTE.WINNER) THEN 1 ELSE 0 END) AS RED_VOTE, SUM(CASE WHEN (GAME.START_TIME = VOTE.GAME_START_TIME) AND (GAME.TEAM_BLUE = VOTE.WINNER) THEN 1 ELSE 0 END) AS BLUE_VOTE FROM GAME, VOTE GROUP BY GAME.START_TIME;';
    let games = [];
    const res = await client.query(query);
    // console.log('gameSQL get')
    const rows = res.rows;
    rows.map(row => {
        games.push(new Game(row['start_time'], row['end_time'], row['fraction_of_final'], row['no'], row['winner'], row['team_red'],  row['team_blue'], row['mvp'], row['red_vote'], row['blue_vote']));
    });
    // console.log('game return')
    return games;
}

async function getVotesByGame(info){
    // console.log('getGames')
    const query =  `SELECT GAME.*,SUM(CASE WHEN (GAME.START_TIME = VOTE.GAME_START_TIME) AND (GAME.TEAM_RED = VOTE.WINNER) THEN 1 ELSE 0 END) AS RED_VOTE, SUM(CASE WHEN (GAME.START_TIME = VOTE.GAME_START_TIME) AND (GAME.TEAM_BLUE = VOTE.WINNER) THEN 1 ELSE 0 END) AS BLUE_VOTE FROM GAME, VOTE Where GAME.START_TIME = '${info.startTime}' GROUP BY GAME.START_TIME; `;
    let games = [];
    const res = await client.query(query);
    // console.log('gameSQL get')
    const rows = res.rows;
    rows.map(row => {
        games.push(new Game(row['start_time'], row['end_time'], row['fraction_of_final'], row['no'], row['winner'], row['team_red'],  row['team_blue'], row['mvp'], row['red_vote'], row['blue_vote']));
    });
    // console.log('game return')
    return games;
}

async function isEndUser(info){
    const query =  `SELECT count(*) as is_end_user FROM app_user Where username='${info.username}' AND password='${info.password}';`;
    const res = await client.query(query);
    const rows = res.rows;
    var isEndUser = false;
    rows.map(row => {
        if(row['is_end_user']==1){
            isEndUser = true;
        }
    });
    return isEndUser;
}

async function isAdmin(info){
    const query =  `SELECT count(*) as is_admin FROM app_user Where username='${info.username}' AND password='${info.password}' AND role='admin_user';`;
    const res = await client.query(query);
    const rows = res.rows;
    var isAdmin = false;
    rows.map(row => {
        if(row['is_admin']==1){
            isAdmin = true;
        }
    });
    return isAdmin;
}

async function addEndUser(info){
    if(await usernameExist(info.username) || info.username==="" || info.password===""){
        return false;
    }
    const query =  `Insert into app_user(username, password, role) Values ('${info.username}', '${info.password}', 'end_user');`;
    const res = await client.query(query);
    return true;
}

async function usernameExist(username){
    const query =  `SELECT count(*) as username_exist FROM app_user Where username='${username}';`;
    const res = await client.query(query);
    const rows = res.rows;
    var usernameExist = false;
    rows.map(row => {
        if(row['username_exist']==1){
            usernameExist = true;
        }
    });
    return usernameExist;
}

async function addGame(info){
    if(await gameExist(info.startTime)){
        return false;
    }
    const query =  `Insert into game(start_time, fraction_of_final, no, team_red, team_blue) Values ('${info.startTime}', '${info.fractionOfFinal}', '${info.no}', '${info.teamRedName}', '${info.teamBlueName}');`;
    const res = await client.query(query);
    return true;
}

async function gameExist(start_time){
    const query =  `SELECT count(*) as game_exist FROM game Where start_time='${start_time}';`;
    const res = await client.query(query);
    const rows = res.rows;
    var gameExist = false;
    rows.map(row => {
        if(row['game_exist']==1){
            gameExist = true;
        }
    });
    return gameExist;
}

async function updateGame(info){
    if(await gameExist(info.startTime)==false){
        return false;
    }
    const query =  `Update game Set end_time='${info.endTime}', winner='${info.winner}' ,mvp='${info.mvp}' Where start_time='${info.startTime}';`;
    const res = await client.query(query);
    return true;
}

async function vote(info){
    if(await gameExist(info.startTime)==false || new Date() < Date(info.startTime)){
        return false;
    }
    else if(await gameEnded(info.startTime)){
        return false;
    }
    else if(await userVoted(info.startTime, info.username)){
        return false;
    }
    const query =  `insert into vote(game_start_time, username, winner) values ('${info.startTime}', '${info.username}', '${info.winner}');`;
    const res = await client.query(query);
    return true;
}

async function gameEnded(startTime){
    const query =  `SELECT count(*) as game_ended FROM game Where start_time='${startTime}' AND end_time IS NOT NULL;`;
    const res = await client.query(query);
    const rows = res.rows;
    var gameEnded = false;
    rows.map(row => {
        if(row['game_ended']==1){
            gameEnded = true;
        }
    });
    return gameEnded;
}

async function userVoted(startTime, username){
    const query =  `select count(*) as voted from vote where username='${username}' AND game_start_time='${startTime}';`;
    const res = await client.query(query);
    const rows = res.rows;
    var gameEnded = false;
    rows.map(row => {
        if(row['voted']==1){
            gameEnded = true;
        }
    });
    return gameEnded;
}

module.exports = {
  getPlayers:getPlayers,
  getTeams:getTeams,
  getGames:getGames,
  getPlayersByTeam:getPlayersByTeam,
  isEndUser:isEndUser,
  isAdmin:isAdmin,
  addEndUser:addEndUser,
  addGame:addGame,
  updateGame:updateGame,
  vote:vote,
  getVotesByGame:getVotesByGame
}