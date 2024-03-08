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

    func loadMatch() async throws {
        let baseUrl = "https://api.the-odds-api.com/v4/sports/upcoming/odds/"
        let matchUrl = "?regions=eu&markets=h2h&apiKey=ebef567105ce7a5a5a83e8b46c375448"
 
        guard let url = URL(string: baseUrl + matchUrl) else {
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            let matchInfos = try decoder.decode([MatchData].self, from: data)
            
            for matchInfo in matchInfos {
                let matchModel = MatchModel(bookmaker: matchInfo.bookmakers[0], baseUrl: baseUrl)
                matchModels.append(matchModel)
            }
            print(matchInfos)
            print("LOADED EVENTS!!")
            
        } catch {
            print("Error decoding MatchData:", error)
        }
    }
}
