//
//  MockMatchData.swift
//  BetBattles
//
//  Created by Edvin Mujanovic on 2024-10-17.
//

import Foundation

struct MockMatchData {
    static let mockMatches: [MatchData] = [
        MatchData(
            id: UUID().uuidString, // Unique ID for each match
            sportKey: "soccer_epl",
            sportTitle: "English Premier League",
            commenceTime: "2024-10-20T14:00:00Z",
            homeTeam: "Liverpool FC",
            awayTeam: "Manchester United",
            bookmakers: [
                MatchData.Bookmaker(
                    key: "betfair",
                    title: "Betfair",
                    lastUpdate: "2024-10-17T09:36:58Z",
                    markets: [
                        MatchData.Bookmaker.Market(
                            key: "h2h",
                            lastUpdate: "2024-10-17T09:36:58Z",
                            outcomes: [
                                MatchData.Bookmaker.Market.Outcome(name: "Liverpool FC", price: 1.75),
                                MatchData.Bookmaker.Market.Outcome(name: "Manchester United", price: 3.25)
                            ]
                        )
                    ]
                )
            ]
        ),
        MatchData(
            id: UUID().uuidString, // Unique ID for each match
            sportKey: "soccer_laliga",
            sportTitle: "La Liga",
            commenceTime: "2024-10-21T17:00:00Z",
            homeTeam: "FC Barcelona",
            awayTeam: "Real Madrid",
            bookmakers: [
                MatchData.Bookmaker(
                    key: "williamhill",
                    title: "William Hill",
                    lastUpdate: "2024-10-17T09:36:58Z",
                    markets: [
                        MatchData.Bookmaker.Market(
                            key: "h2h",
                            lastUpdate: "2024-10-17T09:36:58Z",
                            outcomes: [
                                MatchData.Bookmaker.Market.Outcome(name: "FC Barcelona", price: 1.95),
                                MatchData.Bookmaker.Market.Outcome(name: "Real Madrid", price: 2.75)
                            ]
                        )
                    ]
                )
            ]
        )
    ]
}
