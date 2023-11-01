//
//  ShipType.swift
//  SeaFightGame
//
//  Created by m.grebenozhko on 31.10.2023.
//

enum ShipType {
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

    var size: Int {
        switch self {
        case .oneDeck:
            return 1
        case .twoDeck:
            return 2
        }
    }
}
