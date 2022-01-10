class Game {
    constructor(startTime, endTime, fractionOfFinal, no, winner, teamRed, teamBlue, teamRedRegion, teamBlueRegion, mvp, nOfRedVote, nOfBlueVote) {
        this.startTime = startTime;
        this.endTime = endTime;
        this.fractionOfFinal = fractionOfFinal;
        this.no = no;
        this.winner = winner;
        this.teamRedName = teamRed;
        this.teamBlueName = teamBlue;
        this.teamBlueRegion = teamBlueRegion;
        this.teamRedRegion = teamRedRegion;
        this.mvp = mvp;
        this.nOfRedVote = nOfRedVote;
        this.nOfBlueVote = nOfBlueVote;
    }
}

module.exports = Game