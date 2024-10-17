//
//  ProfileSettingsView.swift
//  BetBattles
//
//  Created by Edvin Mujanovic on 2024-10-17.
//

import SwiftUI

struct ProfileSettingsView: View {
    // Mock data
    let profileName = "John Doe"
    let email = "johndoe@example.com"
    let level = 10
    let savedFunds = 150.75  // Representing saved money

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Profile")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)

            // Display profile information
            HStack {
                Text("Name:")
                    .font(.headline)
                Spacer()
                Text(profileName)
            }
            .padding()

            HStack {
                Text("Email:")
                    .font(.headline)
                Spacer()
                Text(email)
            }
            .padding()

            HStack {
                Text("Level:")
                    .font(.headline)
                Spacer()
                Text("\(level)")
            }
            .padding()

            HStack {
                Text("Funds:")
                    .font(.headline)
                Spacer()
                Text("\(savedFunds, specifier: "%.2f") $")  // Display the saved funds
            }
            .padding()

            Spacer()

            // Back button
            Button(action: {
                // Navigate back to the previous screen
                // In SwiftUI, this button is automatically wired to pop the view when in a NavigationStack
            }) {
                Text("Back")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
        .navigationBarTitle("Profile", displayMode: .inline)
    }
}

struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView()
    }
}

