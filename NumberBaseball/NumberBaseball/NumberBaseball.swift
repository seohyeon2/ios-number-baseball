//
//  NumberBaseball.swift
//  NumberBaseball
//
//  Created by mmim, onetool on 2022/02/10.
//

import Foundation

var computerNumbers: [Int] = []
var playerNumbers: [Int] = []
var roundCount: Int = 9
var strike: Int = 0
var ball: Int = 0
let maxArrayCount: Int = 3
let firstRange: Int = 1
let lastRange: Int = 9

func startGame() {
    computerNumbers = transformSetToArray()
    while roundCount > 0 {
        playerNumbers = transformSetToArray()
        checkScoreCondition()
        checkGameResult()
        resetValue()
    }
}

func checkGameResult() {
    if roundCount == 0 {
        print("컴퓨터 승리🤣")
    } else if strike == 3 {
        print("유저 승리❤️")
        roundCount = 0
    }
}

func generateRandomNumber() -> Int {
    return Int.random(in: firstRange...lastRange)
}

func saveNumbersToSet() -> Set<Int> {
    var randomNumbersSet: Set<Int> = []
    while randomNumbersSet.count < maxArrayCount {
        randomNumbersSet.insert(generateRandomNumber())
    }
    return randomNumbersSet
}

func transformSetToArray() -> [Int] {
    return Array(saveNumbersToSet())
}

func printPlayerNumbers() {
    print("\n임의의 수 : ", terminator: "")
    playerNumbers.forEach{ print($0, terminator: " ") }
}

func checkScoreCondition() {
    let sameNumbers = computerNumbers.filter{ playerNumbers.contains($0) }
    for element in 0..<maxArrayCount {
        checkStrikeCondition(numberInArray: element)
    }
    checkBallCondition(sameNumbers: sameNumbers.count)
    printPlayerNumbers()
    printScoreInformation()
}

func checkStrikeCondition(numberInArray: Int) {
    if computerNumbers[numberInArray] == playerNumbers[numberInArray] {
        strike += 1
    }
}

func checkBallCondition(sameNumbers: Int) {
    ball = sameNumbers - strike
}

func printScoreInformation() {
    print("\n\(strike) 스트라이크, \(ball) 볼")
    roundCount -= 1
    print("남은 기회 : \(roundCount)")
}

func resetValue() {
    playerNumbers.removeAll()
    strike = 0
    ball = 0
}
