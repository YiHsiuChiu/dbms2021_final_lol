class Game {
    constructor(startTime, endTime, fractionOfFinal, no, winner, teamRed, teamBlue, mvp, nOfRedVote, nOfBlueVote){
        this.startTime=startTime;
        this.endTime=endTime;
        this.fractionOfFinal=fractionOfFinal;
        this.no=no;
        this.winner=winner;
        this.teamRed=teamRed;
        this.teamBlue=teamBlue,
        this.mvp=mvp;
        this.nOfRedVote=nOfRedVote;
        this.nOfBlueVote=nOfBlueVote;
    }
}

module.exports = Game