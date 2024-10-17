//
//  HistoryView.swift
//  BetBattles
//
//  Created by Edvin Mujanovic on 2024-10-17.
//

import SwiftUI

struct HistoryView: View {
    private let mockHistoryData: [BetHistory] = [
        BetHistory(id: UUID().uuidString, match: "Liverpool vs Manchester United", bet: "Liverpool to win", outcome: "Won", date: "2024-09-15"),
        BetHistory(id: UUID().uuidString, match: "Barcelona vs Real Madrid", bet: "Real Madrid to win", outcome: "Lost", date: "2024-09-18"),
        BetHistory(id: UUID().uuidString, match: "Juventus vs AC Milan", bet: "Draw", outcome: "Lost", date: "2024-09-20"),
        BetHistory(id: UUID().uuidString, match: "Bayern Munich vs Dortmund", bet: "Bayern Munich to win", outcome: "Won", date: "2024-09-22"),
        BetHistory(id: UUID().uuidString, match: "LA Galaxy vs New York City FC", bet: "LA Galaxy to win", outcome: "Won", date: "2024-09-25")
    ]

    var body: some View {
        VStack {
            List(mockHistoryData, id: \.id) { bet in
                VStack(alignment: .leading) {
                    Text(bet.match).font(.headline)
                    Text("Bet: \(bet.bet)")
                    Text("Outcome: \(bet.outcome)").font(.subheadline)
                    Text("Date: \(bet.date)").font(.caption).foregroundColor(.gray)
                }
            }
            .navigationTitle("Bet History")
        }
    }
}

struct BetHistory: Identifiable {
    let id: String
    let match: String
    let bet: String
    let outcome: String
    let date: String
}
