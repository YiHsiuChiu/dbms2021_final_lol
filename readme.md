
# get started

```npm install```
 to install node modules

```npm start```
 to run server on localhost:8081

# API

## get APIs

### get player

<p>these player related api return all mock data</p>

#### /player/name/:name

#### /player/id/:id

#### /player/role/:role

### get team

<p>these team related api return all mock data</p>

#### /player/teamname/:teamname

#### /team/teamname/:teamname

#### /team/city/:city

#### /team/owner/:owner

#### team/region/:region

### get game

<p>these game related api return all mock data</p>
<p>note: start_time and end_time are recorded in Greenwich Mean Time</p>

#### /game/starttime/:starttime

#### /game/endtime/:endtime

#### /game/fractionoffinal/:fractionoffinal

#### /game/team/:team

#### /game/mvp/:mvp

## post APIs

### user related

#### /login

<p>this api enable end user and admin to login as end user</p>

##### post body to login default admin user

```{"username": "admin","password": "defaultpassword"}```

##### post body to login default end user

```{"username": "user","password": "defaultpassword"}```

#### /admin

<p>this api enable admin to login as admin user</p>

##### post body to login default admin

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

```{"start_time": "2021-02-17T12:00:00","fraction_of_final": "final","no": "1","team_red": "team_red","team_blue": "team_blue"}```

## put APIs

### game related

#### /game

<p>this api is used to update end time, winner, and mvp for existing game record</p>

##### example post body to update game

```{"start_time": "2021-02-17T12:00:00","end_time": "2021-02-17T13:00:00","winner": "the8","mvp": "mvp"}```