
# get started

```npm install```
 to install node modules

```npm start```
 to run server on localhost:8081

## database settings
 
<p>change password user postgres to dbfinal of lol database</p>
<p>or rewrite dbconfig.js as wished</p>

# API

## get APIs

### get player

<p>these player related api return players that fit the requirement</p>

#### /player

<p>return all players</p>

#### /player/teamname/:teamname

<p>return all players under the team that have its name as teamname</p>

### get team

<p>these team related api return teams that fit the requirement</p>

#### /team

<p>return all teams</p>

### get game

<p>these game related api return games that fit the requirement</p>

#### /game

<p>return all games</p>

## post APIs

<p>note: please pass startTime and endTime as UTC +8(Taipei Standard Time)</p>

### user related

#### /login

<p>this api enable end user and admin to login as end user</p>

##### example post body to login default admin user

```{"username": "admin","password": "defaultpassword"}```

##### example post body to login default end user

```{"username": "user","password": "defaultpassword"}```

#### /admin

<p>this api enable admin to login as admin user</p>

##### example post body to login default admin

```{"username": "admin","password": "defaultpassword"}```

#### /user

<p>this api is used to create end user account</p>
<p>duplicated username is not allowed</p>

##### example post body to create end user

```{"username": "example","password": "defaultpassword"}```

### game related

#### /game

<p>this api is used to create game record</p>
<p>the record created will have null for end time, winner, and mvp</p>
<p>duplicated start time is not allowed</p>

##### example post body to create game

```{"startTime": "2021-02-17 12:00:00","fractionOfFinal": "final","no": "1","teamBlueName": "T1","teamBlueName": "DWG KIA"}```

## vote related

#### /vote

<p>this api is used to create vote record</p>
<p>user can only vote if the game have not been set an end_time, and it is passed start_time</p>
<p>only one vote is allow per user per game, and it cannot be changed</p>

```{"startTime": "2020-1-1 7:00:00", "username": "admin", "winner": "winner"}```

## put APIs

### game related

#### /game

<p>this api is used to update end time, winner, and mvp for existing game record</p>

##### example post body to update game

```{"startTime": "2021-02-17 12:00:00","endTime": "2021-02-17 13:00:00","winner": "T1","mvp": "Oner"}```