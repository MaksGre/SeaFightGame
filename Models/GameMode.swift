//
//  GameMode.swift
//  SeaFightGame
//
//  Created by m.grebenozhko on 31.10.2023.
//

private extension String {
    static let playersName = "Укажите имя игрока "
    static let playerShipPlacement = "Расстановка кораблей игрока "
    static let playersTurn = "Ход игрока "
    static let playerWins = "Победа! Победил игрок "
}

enum GameMode {
    case name1
    case ships1
    case name2
    case ships2
    case player1
    case player2
    case victory
}

extension GameMode {

    var description: String {
        switch self {
        case .name1:
            return .playersName
        case .ships1:
            return .playerShipPlacement
        case .name2:
            return .playersName
        case .ships2:
            return .playerShipPlacement
        case .player1:
            return .playersTurn
        case .player2:
            return .playersTurn
        case .victory:
            return .playerWins
        }
    }

    mutating func next() {
        switch self {
        case .name1:
            self = .ships1
        case .ships1:
            self = .name2
        case .name2:
            self = .ships2
        case .ships2:
            self = .player1
        case .player1:
            self = .player2
        case .player2:
            self = .victory
        case .victory:
            self = .victory
        }
    }

    mutating func setPlayer1() {
        self = .player1
    }

    mutating func setVictory() {
        self = .victory
    }
}
