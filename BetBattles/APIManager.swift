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
    
    // Flag to toggle between real API and mock data, set to false when using real API data
    let useMockData = true

    // Flag to track whether data has already been loaded
    var dataLoaded = false

    // Load matches with filtering and duplicate handling
    func loadMatch() async throws {
        // Only load data if it hasn't been loaded yet
        if dataLoaded {
            print("Match data already loaded. Skipping re-fetch.")
            return
        }

        if useMockData {
            // Load from mock data
            loadMockData()
        } else {
            // Load from real API
            try await loadRealMatchData()
        }

        // Set the flag to indicate data has been loaded
        dataLoaded = true
    }
    
    // Function to load mock data
    private func loadMockData() {
        let mockMatches = MockMatchData.mockMatches //ignore error?

        var seenMatches = Set<String>()  // Set to track unique match IDs based on teams
        
        for matchInfo in mockMatches {
            // Create a unique match identifier based on home and away team
            let uniqueMatchId = "\(matchInfo.homeTeam) vs \(matchInfo.awayTeam)"
            
            if !seenMatches.contains(uniqueMatchId) {
                if let firstBookmaker = matchInfo.bookmakers.first {
                    let matchModel = MatchModel(matchData: matchInfo, baseUrl: "")
                    matchModels.append(matchModel)
                    seenMatches.insert(uniqueMatchId)  // Mark the match as seen
                }
            }
        }
        
        print("Loaded mock soccer events!")
    }
    
    // Function to load real match data from API
    private func loadRealMatchData() async throws {
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

    // Optional: Method to force reload data if needed (for Try Again)
    func reloadMatchData() async throws {
        dataLoaded = false // Reset the flag
        matchModels.removeAll() // Clear the existing data
        try await loadMatch()
    }
}
