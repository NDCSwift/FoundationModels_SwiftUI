//
        //
    //  Project: SmartNotes_SwiftUI
    //  File: ContentView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

import FoundationModels
import SwiftUI

// Simple demo view that asks the on-device model to generate a short description and shows the result.

// Main entry view demonstrating a basic text generation flow
struct ContentView: View {
    // Session used to talk to the on-device language model
    @State private var session = LanguageModelSession()
    // Holds the latest generated response or an error message
    @State private var response = ""
    var body: some View {
        VStack {
            
            // Title for the demo
            Text("Foundation Models")
                .font(.title.bold())
            
            // Shows either a prompt to generate or the model's response
            Text(response.isEmpty ? "Tap the button to generate" : response)
                .padding()
            
            // Triggers a generation request to the model
            Button("Generate") {
                Task {
                    do {
                        // Ask the model for a one-sentence summary of SwiftUI
                        let result = try await session.respond(to: "Write a one sentence summary of what swiftUI is")
                        response = result.content  // Update UI with the generated text
                    }
                    catch {
                        response = "Error \(error.localizedDescription)"  // Show a user-friendly error
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(session.isResponding)  // Disable the button while a request is in-flight
            
        }
        // Warm up the model session when the view appears for faster first response
        .task {
            await session.prewarm()
        }
        // Basic layout padding
        .padding()
    }
}

#Preview {
    ContentView()
}
