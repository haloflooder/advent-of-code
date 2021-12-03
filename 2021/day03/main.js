function PowerInfo(gamma, epsilon) {
    this.rawGamma = gamma;
    this.rawEpsilon = epsilon;
    this.gamma = parseInt(gamma, 2);
    this.epsilon = parseInt(epsilon, 2);

    this.calculatePower = function() {
        return this.gamma * this.epsilon;
    }
}

function processBinaryLogs(rawBinaryLog) {
    var binaryCount = [];

    for (var i = 0; i < rawBinaryLog.length; i++) {
        var bits = rawBinaryLog[i].split("");
        for (var j = 0; j < bits.length; j++) {
            if (bits[j] == "1") {
                if (binaryCount[j] == undefined) {
                    binaryCount[j] = 1;
                } else {
                    binaryCount[j]++;
                }
            }
        }
    }
    
    var gammaBinary = "";
    var epsilonBinary = "";
    for (var i = 0; i < binaryCount.length; i++) {
        var remaining = rawBinaryLog.length - binaryCount[i];
        if (binaryCount[i] > remaining) {
            gammaBinary += "1" ;
            epsilonBinary += "0";
        } else {
            gammaBinary += "0";
            epsilonBinary += "1";
        }

        console.log(binaryCount[i] + " vs " + remaining);
    }
    
    return new PowerInfo(gammaBinary, epsilonBinary);
}

function onLoad() {
    var bankOneData = processBinaryLogs(inputData);
    var gammaText = document.getElementById("b1-gamma");
    var epsilonText = document.getElementById("b1-epsilon");
    var powerText = document.getElementById("b1-power");

    gammaText.innerHTML = bankOneData.gamma;
    epsilonText.innerHTML = bankOneData.epsilon;
    powerText.innerHTML = bankOneData.calculatePower();
}