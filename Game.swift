//
//  Game.swift
//  SeaFightGame
//
//  Created by m.grebenozhko on 29.10.2023.
//

private extension String {
    static let welcome = "Добро пожаловать в игру Морской Бой"
    static let letsStart = "Да начнётся бой!"
    static let exampleShipPlacement = "Укажите координаты корабля в формате А1 для корабля: "
    static let incorrectCoordinates = "Неверные координаты"
    static let enterCoordinatesEnemyShip = "Укажите координаты вражеского корабля"
    static let hit = "Попадание!"
    static let miss = "Промах"
}

enum Constants {
    static let gameField = Dimensions(unit1: 4, unit2: 4)
    static let fieldSymbols = "абвг"
}

final class Game {

    // Private properties
    private var mode: GameMode = .name1
    private let consoleIO = ConsoleIO()
    private var player: Player?
    private var opponent: Player?
    private var player1: Player?
    private var player2: Player?

    // MARK: - Public

    func start() {
        var shouldQuit = false
        consoleIO.writeMessage(.welcome)

        while !shouldQuit {
            switch mode {
            case .name1:
//                player1 = getName(playerNum: 1)

                player1 = Player(name: "player1")
                player = player1
                mode.next()
            case .ships1:
//                getShips()

                player?.addShip(type: .oneDeck, startLocation: Dimensions(unit1: 1, unit2: 1))
                player?.addShip(type: .oneDeck, startLocation: Dimensions(unit1: 2, unit2: 1))
                player?.addShip(type: .twoDeck, startLocation: Dimensions(unit1: 3, unit2: 1))
                mode.next()
            case .name2:
//                player2 = getName(playerNum: 2)

                player2 = Player(name: "player2")
                player = player2
                mode.next()
            case .ships2:
//                getShips()
                consoleIO.writeMessage(.letsStart)

                player?.addShip(type: .oneDeck, startLocation: Dimensions(unit1: 2, unit2: 2))
                player?.addShip(type: .oneDeck, startLocation: Dimensions(unit1: 3, unit2: 2))
                player?.addShip(type: .twoDeck, startLocation: Dimensions(unit1: 4, unit2: 2))
                mode.next()
            case .player1:
                player = player1
                opponent = player2
                guard let player, let opponent else { return }
                consoleIO.writeMessage(mode.description + player.name)
                var nextTurn = false
                while !nextTurn {
                    consoleIO.writeMessage(.enterCoordinatesEnemyShip)
                    let coordinates = consoleIO.getInput()
                    guard let location = Dimensions.convertCoordinates(coordinates) else {
                        consoleIO.writeMessage(.incorrectCoordinates)
                        continue
                    }
                    if opponent.checkDeckUnderFire(location: location) {
                        consoleIO.writeMessage(.hit)
                    } else {
                        consoleIO.writeMessage(.miss)
                        nextTurn = true
                        mode.next()
                    }
                }
            case .player2:
                shouldQuit = true
                print("--- \(mode.description)")
            case .victory:
                print("--- \(mode.description)")
            }
        }
    }

    // MARK: - Private

    private func getName(playerNum: Int) -> Player? {
        consoleIO.writeMessage(mode.description + playerNum.description)
        let name = consoleIO.getInput()
        player = Player(name: name)
        mode.next()
        return player
    }

    private func getShips() {
        guard let player else { return }
        consoleIO.writeMessage(mode.description + player.name)
        ShipType.allCases.forEach { type in
            var countShip = 0
            while countShip < type.quantity {
                consoleIO.writeMessage(.exampleShipPlacement + type.description + " #" + (countShip + 1).description)
                let coordinates = consoleIO.getInput()
                guard let location = Dimensions.convertCoordinates(coordinates),
                      player.addShip(type: type, startLocation: location)
                else {
                    consoleIO.writeMessage(.incorrectCoordinates)
                    continue
                }
                countShip += 1
            }
        }
        mode.next()
    }
}
