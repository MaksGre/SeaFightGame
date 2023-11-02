//
//  ShipType.swift
//  SeaFightGame
//
//  Created by m.grebenozhko on 31.10.2023.
//

enum ShipType: CaseIterable {
    case oneDeck
    case twoDeck
}

extension ShipType {

    var description: String {
        switch self {
        case .oneDeck:
            return "1-палубный"
        case .twoDeck:
            return "2-палубный"
        }
    }

    var quantity: Int {
        switch self {
        case .oneDeck:
            return 2
        case .twoDeck:
            return 1
        }
    }
}
