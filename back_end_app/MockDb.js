var Player = require("./Player")
var Team = require("./Team")
var Game = require("./Game")
var AppUser = require("./AppUser")
const player1 = new Player("superstar999", "john", new Date(1995, 11, 17), "mid", "the8", new Date(2020, 1, 1), " ");
const player2 = new Player("funnyJohn", "john", new Date(2000, 1, 20), "top", "the8", new Date(2021, 12, 20), " ");
let players = [player1, player2];
const team1 = new Team("the8", "Chicago", "Smith", new Date(2011, 3, 29), "North America", " ");
const team2 = new Team("newTeam", "San Diego", "Company", new Date(2020, 5, 23), "North America", " ");
let teams = [team1, team1];
const game1 = new Game(new Date(2021, 3, 10, 13, 0, 0, 0), new Date(2021, 3, 10, 13, 40, 0, 0), "semifinal", 1, "the8", "the8", "newTean", "funnyjohn", 800, 400);
const game2 = new Game(new Date(2021, 3, 10, 14, 0, 0, 0), null, "semifinal", 2, null, "the8", "newTean", null, 300, 300);
let games = [game1, game2];
const endUser = new AppUser("user", "defaultpassword", "endUser");
const admin = new AppUser("admin", "defaultpassword", "admin");
let users = [endUser, admin];


function mockGetPlayers(){
  return players;
}

function mockGetTeams(){
  return teams;
}

function mockGetGames(){
  return games;
}

function mockIsEndUser(info){
  for(const i of users){
    if(info.username==i.username && info.password==i.password){
      return true;
    }
  }
  return false;
}

function mockIsAdmin(info){
  for(const i of users){
    if(info.username==i.username && info.password==i.password && i.role=="admin"){
      console.log(info.username);
      return true;
    }
  }
  return false;
}

function mockAddEndUser(info){
  for(const i of users){
    if(info.username==i.username){
      return false;
    }
  }
  var appUser = new AppUser(info.username, info.password, "endUser");
  users.push(appUser);
  return true;
}

function mockAddGame(info){
  
  var newGame = new Game(new Date(info.start_time), null, info.fraction_of_final, info.no, null, info.team_red, info.team_blue, null, null, null);
  for(const i of games){
    if(newGame.startTime.getTime()==i.startTime.getTime()){
      return false;
    }
  }
  games.push(newGame);
  return true;
}

function mockUpdateGame(info){
  var startTime = new Date(info.start_time);
  for(const i of games){
    if(startTime.getTime()==i.startTime.getTime()){
      i.endTime = new Date (info.end_time);
      i.winner = info.winner;
      i.mvp = info.mvp;
      return true;
    }
  }
  return false;
}


module.exports = {
  mockGetPlayers:mockGetPlayers,
  mockGetTeams:mockGetTeams,
  mockGetGames:mockGetGames,
  mockIsEndUser:mockIsEndUser,
  mockIsAdmin:mockIsAdmin,
  mockAddEndUser:mockAddEndUser,
  mockAddGame:mockAddGame,
  mockUpdateGame:mockUpdateGame
}