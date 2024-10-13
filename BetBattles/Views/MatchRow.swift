//
//  MatchRow.swift
//  BetBattles
//
//  Created by Edvin Mujanovic on 2024-10-14.
//

import SwiftUI

struct MatchRow: View {
    let matchModel: MatchModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // Display team names
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(matchModel.homeTeam)")
                        .font(.headline)
                        .foregroundColor(.blue)
                    Text("\(matchModel.awayTeam)")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                
                Spacer()

                // Display the odds
                if let h2hMarket = matchModel.bookmaker.markets.first(where: { $0.marketKey == "h2h" }) {
                    HStack(spacing: 16) {
                        Text("\(h2hMarket.outcomes[0].price, specifier: "%.2f")") // Home Win Odds
                            .font(.headline)
                            .padding(10)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(8)
                        
                        
                        Text("\(h2hMarket.outcomes[1].price, specifier: "%.2f")") // Away Win Odds
                            .font(.headline)
                            .padding(10)
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(8)
                    }
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(radius: 2))
        .padding(.vertical, 5)
    }
}
