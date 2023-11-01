//
//  Ship.swift
//  SeaFightGame
//
//  Created by m.grebenozhko on 31.10.2023.
//

final class Ship {

    // Public properties
    let deckInfo: [DeckInfo]

    // Private properties
    private let type: ShipType

    // MARK: - Initialization

    init(type: ShipType, decksInfo: [DeckInfo]) {
        self.type = type
        self.deckInfo = decksInfo
    }

    // MARK: - Public

    
}
