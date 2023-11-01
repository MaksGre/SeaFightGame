//
//  Dimensions.swift
//  SeaFightGame
//
//  Created by m.grebenozhko on 31.10.2023.
//

struct Dimensions {
    let unit1: Int
    let unit2: Int
}

extension Dimensions {

    static func convertCoordinates(_ coordinates: String) -> Dimensions? {
        guard !coordinates.isEmpty, coordinates.count < 3 else { return nil }
        let coordinatesMapped = coordinates.map { $0 }
        let unit1Char = coordinatesMapped[0]
        var unit1 = 0
        let fieldSymbols = Constants.fieldSymbols.map { $0 }
        for (index, value) in fieldSymbols.enumerated() {
            if value == unit1Char {
                unit1 = index + 1
                break
            }
        }
        guard unit1 > 0 else { return nil }
        guard let unit2Char = coordinates.last, let unit2 = Int(String(unit2Char)) else { return nil }
        return Dimensions(unit1: unit1, unit2: unit2)
    }
}
