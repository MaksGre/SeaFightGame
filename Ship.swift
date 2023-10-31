//
//  Ship.swift
//  SeaFightGame
//
//  Created by m.grebenozhko on 31.10.2023.
//

final class Ship {

    // Private properties
    private let type: ShipType
    private let locations: [Dimensions]

    // MARK: - Initialization

    init(type: ShipType, locations: [Dimensions]) {
        self.type = type
        self.locations = locations
    }
}
