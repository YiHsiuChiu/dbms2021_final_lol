class Game {
    constructor(startTime, endTime, fractionOfFinal, no, winner, teamRedName, teamBlueName, mvp, nOfRedVote, nOfBlueVote, teamRedRegion, teamBlueRegion){
        this.startTime=startTime;
        this.endTime=endTime;
        this.fractionOfFinal=fractionOfFinal;
        this.no=no;
        this.winner=winner;
        this.teamRedName=teamRedName;
        this.teamBlueName=teamBlueName,
        this.mvp=mvp;
        this.nOfRedVote=nOfRedVote;
        this.nOfBlueVote=nOfBlueVote;
        this.teamRedRegion=teamRedRegion;
        this.teamBlueRegion=teamBlueRegion;
    }
}

module.exports = Game