import SwiftUI

struct MatchView: View {
    let matchModel: MatchModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("BetBattles")
                .font(.largeTitle)
                .padding(.bottom, 20)

            // Display Match Details
            HStack {
                VStack(alignment: .leading) {
                    Text("\(matchModel.homeTeam)")
                        .font(.title)
                        .foregroundColor(.blue)
                    Text("vs")
                        .font(.title2)
                    Text("\(matchModel.awayTeam)")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                Spacer()
            }
            .padding(.bottom, 20)

            // Display Odds
            if let h2hMarket = matchModel.bookmaker.markets.first(where: { $0.marketKey == "h2h" }) {
                VStack {
                    HStack {
                        Text("\(h2hMarket.outcomes[0].price, specifier: "%.2f")") // Home Win Odds
                            .font(.headline)
                            .padding()
                            .background(Color.green.opacity(0.2))
                            .cornerRadius(8)


                        Text("\(h2hMarket.outcomes[1].price, specifier: "%.2f")") // Away Win Odds
                            .font(.headline)
                            .padding()
                            .background(Color.red.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
            }
        }
        .padding()
        .navigationBarTitle("Match Details", displayMode: .inline)
    }
}
