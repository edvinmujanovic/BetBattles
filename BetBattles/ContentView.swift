//
//  ContentView.swift
//  BetBattles
//
//  Created by Edvin Mujanovic on 2024-03-07.
//

import SwiftUI

struct ContentView: View {
    @State private var matchManager = Match()

    var body: some View {
        VStack {
            if matchManager.matchModels != nil {
                // Data loaded, display content
                Text("DATA LOADED!!")
            } else {
                // Data not loaded, display try again button
                Button("Try Again") {
                    Task {
                        await loadMatchData()
                    }
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
        .onAppear {
            Task {
                await loadMatchData()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
