class Player {
    constructor(id, name, birthDate, role, teamName, joinDate,mvpNum, picture) {
      this.playerid=id;
      this.team=teamName;
      this.name=name;
      this.birthDate = birthDate;
      this.role=role;
      this.joinDate=joinDate;
      this.mvpNum = mvpNum;
      this.image=picture;
    }
  }

  module.exports = Player

