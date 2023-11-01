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
}

enum Constants {
    static let gameField = Dimensions(unit1: 4, unit2: 4)
    static let fieldSymbols = "абвг"
}

final class Game {

    // Private properties
    private var mode: GameMode = .name1
    private let consoleIO = ConsoleIO()
    private var player1: Player?
    private var player2: Player?

    // MARK: - Public

    func start() {
        var shouldQuit = false
        var currentPlayer: Player?

        consoleIO.writeMessage(.welcome)

        while !shouldQuit {

            switch mode {
            case .name1:
                consoleIO.writeMessage(mode.description + "1")
//                let name = consoleIO.getInput()
                let name = "Попик"
                currentPlayer = Player(name: name)
                player1 = currentPlayer
                mode.next()
            case .ships1:
                guard let currentPlayer else { continue }
                var countShip = 1
                consoleIO.writeMessage(mode.description + currentPlayer.name)
                ShipType.allCases.forEach { type in
                    while countShip <= type.quantity + 1 {
                        consoleIO.writeMessage(.exampleShipPlacement + type.description + " #" + countShip.description)
                        let coordinates = consoleIO.getInput()
                        guard let location = Dimensions.convertCoordinates(coordinates),
                              currentPlayer.addShip(type: type, startLocation: location)
                        else {
                            consoleIO.writeMessage(.incorrectCoordinates)
                            continue
                        }
                        countShip += 1
                    }
                }
                shouldQuit = true
//                var result = currentPlayer.addShip(type: .oneDeck, startLocation: Dimensions(unit1: 1, unit2: 2))
//                print("--- result \(result)")
//                result = currentPlayer.addShip(type: .oneDeck, startLocation: Dimensions(unit1: 3, unit2: 3))
//                print("--- result \(result)")
//                result = currentPlayer.addShip(type: .twoDeck, startLocation: Dimensions(unit1: 2, unit2: 3))
//                print("--- result \(result)")
            case .name2:
                print("--- \(mode.description)")
            case .ships2:
                consoleIO.writeMessage(.letsStart)
            case .player1:
                print("--- \(mode.description)")
            case .player2:
                print("--- \(mode.description)")
            case .victory:
                print("--- \(mode.description)")
            }
        }
    }
}
