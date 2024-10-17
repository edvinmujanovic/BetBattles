import SwiftUI

struct MatchListView: View {
    @State private var matchManager = Match()

    var body: some View {
        ZStack {
            VStack {
                if !matchManager.matchModels.isEmpty {
                    // Data loaded, display list
                    List(matchManager.matchModels, id: \.id) { matchModel in
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

            // Add the round profile button
            VStack {
                Spacer()  // Push content up
                HStack {
                    VStack {
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.3))  // Button background
                                .frame(width: 60, height: 60)  // Circle size
                            
                            NavigationLink(destination: ProfileSettingsView()) {
                                Image(systemName: "person.crop.circle")  // Profile icon (system)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }
                        }
                    }
                    .padding(20)  // Padding to position it from the edges
                    Spacer()  // Push to the left side
                }
            }
        }
    }

    private func loadMatchData() async {
        do {
            try await matchManager.loadMatch()
        } catch {
            print("Failed to load match data: \(error)")
        }
    }
}
