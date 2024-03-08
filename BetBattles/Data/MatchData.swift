//
//  MatchData.swift
//  BetBattles
//
//  Created by Edvin Mujanovic on 2024-03-07.
//

import Foundation


struct EventData: Decodable {
    let id: String
    let sportKey: String
    let sportTitle: String
    let commenceTime: String
    let homeTeam: String
    let awayTeam: String
    let bookmakers: [Bookmaker]

    struct Bookmaker: Decodable {
        let key: String
        let title: String
        let lastUpdate: String
        let markets: [Market]

        struct Market: Decodable {
            let key: String
            let lastUpdate: String
            let outcomes: [Outcome]

            struct Outcome: Decodable {
                let name: String
                let price: Double
            }
        }
    }
}
