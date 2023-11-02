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
    case namePlayer1
    case shipsPlayer1
    case namePlayer2
    case shipsPlayer2
    case turnPlayer1
    case turnPlayer2
    case victory
}

extension GameMode {

    var description: String {
        switch self {
        case .namePlayer1:
            return .playersName
        case .shipsPlayer1:
            return .playerShipPlacement
        case .namePlayer2:
            return .playersName
        case .shipsPlayer2:
            return .playerShipPlacement
        case .turnPlayer1:
            return .playersTurn
        case .turnPlayer2:
            return .playersTurn
        case .victory:
            return .playerWins
        }
    }

    mutating func next() {
        switch self {
        case .namePlayer1:
            self = .shipsPlayer1
        case .shipsPlayer1:
            self = .namePlayer2
        case .namePlayer2:
            self = .shipsPlayer2
        case .shipsPlayer2:
            self = .turnPlayer1
        case .turnPlayer1:
            self = .turnPlayer2
        case .turnPlayer2:
            self = .victory
        case .victory:
            self = .victory
        }
    }

    mutating func setPlayer1() {
        self = .turnPlayer1
    }

    mutating func setVictory() {
        self = .victory
    }
}
