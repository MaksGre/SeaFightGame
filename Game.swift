//
//  Game.swift
//  SeaFightGame
//
//  Created by m.grebenozhko on 29.10.2023.
//

private extension String {
    static let welcome = "Добро пожаловать в игру Морской Бой"
    static let letsStart = "Да начнётся бой!"
}

enum Constants {
    static let gameField = Dimensions(unit1: 4, unit2: 4)
}

final class Game {

    // Private properties
    private var mode: GameMode = .name1
    private let consoleIO = ConsoleIO()

    // MARK: - Public

    func start() {
        var shouldQuit = false

        consoleIO.writeMessage(.welcome)
        consoleIO.writeMessage(.letsStart)

        while !shouldQuit {
            var shouldQuit = false
            
        }
    }
}
