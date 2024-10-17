//
//  APIManager.swift
//  BetBattles
//
//  Created by Edvin Mujanovic on 2024-03-07.
//

import Foundation
import Observation

@Observable
class Match {
    var matchModels: [MatchModel] = []

    // Load matches with filtering and duplicate handling
    func loadMatch() async throws {
        let baseUrl = "https://api.the-odds-api.com/v4/sports/upcoming/odds/"
        let apiKey = ProcessInfo.processInfo.environment["ODDS_API_KEY"] ?? ""
        let matchUrl = "?regions=eu&markets=h2h&apiKey=\(apiKey)"
 
        guard let url = URL(string: baseUrl + matchUrl) else {
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            // Decode the API response
            let matchInfos = try decoder.decode([MatchData].self, from: data)
            
            // Filter for soccer and hockey matches only
            let filteredMatches = matchInfos.filter { match in
                match.sportKey.contains("soccer") || match.sportKey.contains("hockey")
            }

            var seenMatches = Set<String>()  // Set to track unique match IDs based on teams
            
            for matchInfo in filteredMatches {
                // Create a unique match identifier based on home and away team
                let uniqueMatchId = "\(matchInfo.homeTeam) vs \(matchInfo.awayTeam)"

                if !seenMatches.contains(uniqueMatchId) {
                    if let firstBookmaker = matchInfo.bookmakers.first {
                        let matchModel = MatchModel(matchData: matchInfo, baseUrl: baseUrl)
                        matchModels.append(matchModel)
                        seenMatches.insert(uniqueMatchId)  // Mark the match as seen
                    }
                }
            }
            
            print("Filtered and loaded soccer and hockey events!")
            
        } catch {
            print("Error decoding MatchData:", error)
        }
    }
}
