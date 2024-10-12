import SwiftUI

struct MatchView: View {
    let matchModel: MatchModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("BetBattles")
                .font(.largeTitle)
                .padding(.bottom, 20)

            MatchRow(matchModel: matchModel)
                .padding(.bottom, 20)

            Text("Odds")
                .font(.title)
                .padding(.bottom, 10)

            ForEach(matchModel.bookmaker.markets) { market in
                VStack(alignment: .leading, spacing: 10) {
                    Text("Market Key: \(market.marketKey)")
                        .font(.headline)
                    Text("Last Update: \(market.lastUpdate)")
                        .font(.subheadline)

                    ForEach(market.outcomes) { outcome in
                        HStack {
                            Text(outcome.outcomeName)
                                .font(.subheadline)
                            Spacer()
                            Text("\(outcome.price, specifier: "%.2f")")
                                .font(.subheadline)
                        }
                    }
                }
                .padding(.bottom, 10)
            }
        }
        .padding()
        .navigationBarTitle("Match Details")
    }
}

struct MatchRow: View {
    let matchModel: MatchModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Home Team: \(matchModel.homeTeam)")
                .font(.headline)
                .foregroundColor(.blue)
            Text("Away Team: \(matchModel.awayTeam)")
                .font(.headline)
                .foregroundColor(.blue)
            Text("Bookmaker: \(matchModel.bookmaker.bookmakerTitle)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Last Update: \(matchModel.bookmaker.lastUpdate)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(radius: 2))
    }
}
