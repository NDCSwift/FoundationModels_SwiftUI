//
        //
    //  Project: SmartNotes_SwiftUI
    //  File: StreamingView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI
import FoundationModels

struct StreamingView: View {
    @State private var session = LanguageModelSession()
    @State private var streamedText = ""
    @State private var isStreaming = false
    var body: some View {
        VStack {
            ScrollView {
                Text(streamedText.isEmpty ? "Tap to stream a response" : streamedText)
                    .frame(maxWidth: . infinity, alignment: .leading)
                    .padding()
            }
            Button(isStreaming ? "Generating..." : "Stream Response") {
                Task {
                    await streamResponse()
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(isStreaming)
        }
        .task { await session.prewarm() }
    }
    
    private func streamResponse() async {
        streamedText = ""
        isStreaming = true
        
        do {
            let stream = session.streamResponse(to: "Write a pragraph on the history of Swift")
            for try await partial in stream {
                streamedText = partial.content
            }
        } catch {
            streamedText = "Error \(error.localizedDescription)"
        }
        isStreaming = false
    }
}

#Preview {
    StreamingView()
}
