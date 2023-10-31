//
//  Player.swift
//  SeaFightGame
//
//  Created by m.grebenozhko on 31.10.2023.
//

final class Player {

    // Public properties
    let name: String

    // Private properties
    private var ships: [Ship] = []

    // MARK: - Initialization

    init(name: String) {
        self.name = name
    }

    // MARK: - Private

    func addShip(_ ship: ShipType) {
        
    }
}
