//
//  DeckInfo.swift
//  SeaFightGame
//
//  Created by m.grebenozhko on 31.10.2023.
//

struct DeckInfo {

    let location: Dimensions
    var status: DeckStatus = .normal

    init(location: Dimensions) {
        self.location = location
    }
}
