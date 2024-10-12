//
//  MatchModel.swift
//  BetBattles
//
//  Created by Edvin Mujanovic on 2024-03-07.
//

import Foundation
import Observation

class MatchModel: Identifiable {
    let id = UUID() // Provide a unique ID for SwiftUI's List
    let homeTeam: String
    let awayTeam: String
    let bookmaker: Bookmaker  // Include a reference to Bookmaker
    
    init(matchData: MatchData, baseUrl: String) {
        homeTeam = matchData.homeTeam
        awayTeam = matchData.awayTeam
        bookmaker = Bookmaker(bookmaker: matchData.bookmakers[0], baseUrl: baseUrl)
    }
}

extension MatchModel {
    @Observable
    class Bookmaker {
        let bookmakerKey: String
        let bookmakerTitle: String
        let lastUpdate: String
        let markets: [Market]

        init(bookmaker: MatchData.Bookmaker, baseUrl: String) {
            bookmakerKey = bookmaker.key
            bookmakerTitle = bookmaker.title
            lastUpdate = bookmaker.lastUpdate
            markets = bookmaker.markets.map { Market(model: $0, baseUrl: baseUrl) }
        }
    }

    @Observable
    class Market: Identifiable {
        let marketKey: String
        let lastUpdate: String
        let outcomes: [Outcome]

        init(model: MatchData.Bookmaker.Market, baseUrl: String) {
            marketKey = model.key
            lastUpdate = model.lastUpdate
            outcomes = model.outcomes.map { Outcome(model: $0, baseUrl: baseUrl) }
        }
    }

    @Observable
    class Outcome: Identifiable {
        let outcomeName: String
        let price: Double

        init(model: MatchData.Bookmaker.Market.Outcome, baseUrl: String) {
            outcomeName = model.name
            price = model.price
        }
    }
}
