import SwiftUI

struct MatchListView: View {
    @State private var matchManager = Match()

    var body: some View {
        VStack {
            if !matchManager.matchModels.isEmpty {
                // Data loaded, display list
                List(matchManager.matchModels, id: \.bookmaker.bookmakerKey) { matchModel in
                    NavigationLink(destination: MatchView(matchModel: matchModel)) {
                        MatchRow(matchModel: matchModel)
                    }
                }
            } else {
                // Data not loaded, display try again button
                Button("Try Again") {
                    Task {
                        await loadMatchData()
                    }
                }
            }
        }
        .onAppear {
            Task {
                await loadMatchData()
            }
        }
        .navigationTitle("Upcoming Matches")
    }

    private func loadMatchData() async {
        do {
            try await matchManager.loadMatch()
        } catch {
            print("Failed to load match data: \(error)")
        }
    }
}

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

//matchview:

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
