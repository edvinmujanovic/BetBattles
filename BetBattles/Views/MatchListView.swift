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

            // Add the round profile and history buttons
            VStack {
                Spacer()  // Push content up
                HStack {
                    // Profile button on the left
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
                    .padding(.leading, 20)  // Padding from the left edge

                    Spacer()  // Space between buttons

                    // History button on the right
                    VStack {
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.3))  // Button background
                                .frame(width: 60, height: 60)  // Circle size

                            NavigationLink(destination: HistoryView()) {
                                Image(systemName: "clock.arrow.circlepath")  // History icon (system)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }
                        }
                    }
                    .padding(.trailing, 20)  // Padding from the right edge
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
