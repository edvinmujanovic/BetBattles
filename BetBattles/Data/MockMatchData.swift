//
//  MockMatchData.swift
//  BetBattles
//
//  Created by Edvin Mujanovic on 2024-10-17.
//

import Foundation

struct MockMatchData {
    static let mockMatches: [MatchData] = [
        // English Premier League Match
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
        
        // La Liga Match
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
        ),
        
        // Serie A Match
        MatchData(
            id: UUID().uuidString, // Unique ID for each match
            sportKey: "soccer_seriea",
            sportTitle: "Serie A",
            commenceTime: "2024-10-22T19:45:00Z",
            homeTeam: "Juventus",
            awayTeam: "AC Milan",
            bookmakers: [
                MatchData.Bookmaker(
                    key: "paddypower",
                    title: "Paddy Power",
                    lastUpdate: "2024-10-17T09:36:58Z",
                    markets: [
                        MatchData.Bookmaker.Market(
                            key: "h2h",
                            lastUpdate: "2024-10-17T09:36:58Z",
                            outcomes: [
                                MatchData.Bookmaker.Market.Outcome(name: "Juventus", price: 2.05),
                                MatchData.Bookmaker.Market.Outcome(name: "AC Milan", price: 2.90)
                            ]
                        )
                    ]
                )
            ]
        ),
        
        // Bundesliga Match
        MatchData(
            id: UUID().uuidString, // Unique ID for each match
            sportKey: "soccer_bundesliga",
            sportTitle: "Bundesliga",
            commenceTime: "2024-10-23T14:30:00Z",
            homeTeam: "Bayern Munich",
            awayTeam: "Borussia Dortmund",
            bookmakers: [
                MatchData.Bookmaker(
                    key: "skybet",
                    title: "Sky Bet",
                    lastUpdate: "2024-10-17T09:36:58Z",
                    markets: [
                        MatchData.Bookmaker.Market(
                            key: "h2h",
                            lastUpdate: "2024-10-17T09:36:58Z",
                            outcomes: [
                                MatchData.Bookmaker.Market.Outcome(name: "Bayern Munich", price: 1.65),
                                MatchData.Bookmaker.Market.Outcome(name: "Borussia Dortmund", price: 4.00)
                            ]
                        )
                    ]
                )
            ]
        ),
        
        // Major League Soccer (MLS) Match
        MatchData(
            id: UUID().uuidString, // Unique ID for each match
            sportKey: "soccer_mls",
            sportTitle: "Major League Soccer",
            commenceTime: "2024-10-24T01:00:00Z",
            homeTeam: "LA Galaxy",
            awayTeam: "New York City FC",
            bookmakers: [
                MatchData.Bookmaker(
                    key: "fanduel",
                    title: "FanDuel",
                    lastUpdate: "2024-10-17T09:36:58Z",
                    markets: [
                        MatchData.Bookmaker.Market(
                            key: "h2h",
                            lastUpdate: "2024-10-17T09:36:58Z",
                            outcomes: [
                                MatchData.Bookmaker.Market.Outcome(name: "LA Galaxy", price: 2.25),
                                MatchData.Bookmaker.Market.Outcome(name: "New York City FC", price: 3.10)
                            ]
                        )
                    ]
                )
            ]
        ),
        
        // Ligue 1 Match
        MatchData(
            id: UUID().uuidString, // Unique ID for each match
            sportKey: "soccer_ligue1",
            sportTitle: "Ligue 1",
            commenceTime: "2024-10-25T20:00:00Z",
            homeTeam: "Paris Saint-Germain",
            awayTeam: "Olympique Lyonnais",
            bookmakers: [
                MatchData.Bookmaker(
                    key: "bet365",
                    title: "Bet365",
                    lastUpdate: "2024-10-17T09:36:58Z",
                    markets: [
                        MatchData.Bookmaker.Market(
                            key: "h2h",
                            lastUpdate: "2024-10-17T09:36:58Z",
                            outcomes: [
                                MatchData.Bookmaker.Market.Outcome(name: "Paris Saint-Germain", price: 1.50),
                                MatchData.Bookmaker.Market.Outcome(name: "Olympique Lyonnais", price: 5.00)
                            ]
                        )
                    ]
                )
            ]
        )
    ]
}
