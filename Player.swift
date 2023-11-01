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

    func addShip(type: ShipType, startLocation location: Dimensions) -> Bool {
        guard location.unit1 > 0, location.unit2 > 0 else { return false }
        guard location.unit1 <= Constants.gameField.unit1, location.unit2 <= Constants.gameField.unit2 else { return false }
        var newShipDeckInfo = [DeckInfo(location: location)]
        if type == .twoDeck {
            let nextLocation = Dimensions(unit1: location.unit1 + 1, unit2: location.unit2)
            guard nextLocation.unit1 <= Constants.gameField.unit1 else { return false }
            newShipDeckInfo.append(DeckInfo(location: nextLocation))
        }
        if !ships.isEmpty {
            for deck in newShipDeckInfo {
                guard checkLocationIsNotBusy(deck.location) else { return false }
            }
        }
        ships.append(Ship(type: type, decksInfo: newShipDeckInfo))

        return true
    }

    func checkLocationIsNotBusy(_ location: Dimensions, markLocation: Bool = false) -> Bool {
        let shipsDeckInfo = ships.flatMap { $0.deckInfo }
        for deck in shipsDeckInfo {
            if deck.location.unit1 == location.unit1 && deck.location.unit2 == location.unit2 {
                if markLocation { deck.status = .underFire }
                return false
            }
        }
        return true
    }

    func checkDeckUnderFire(location: Dimensions) -> Bool {
        !checkLocationIsNotBusy(location, markLocation: true)
    }
}
