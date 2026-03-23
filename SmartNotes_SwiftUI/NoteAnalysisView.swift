//
        //
    //  Project: SmartNotes_SwiftUI
    //  File: NoteAnalysisView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI
import FoundationModels

// View that lets a user enter a note and streams an AI-generated analysis (tags, action items, summary).

// Main SwiftUI view for note analysis
struct NoteAnalysisView: View {
    // Session used to communicate with the on-device language model
    @State private var session = LanguageModelSession(instructions: Instructions{ "You are a helpful notes assistant"
       "When using Acronyms provide definitions for clarity"
        "Never use slang language"
        
    }
    )
                                    
    // Holds the partially generated analysis as the model streams
    @State private var partial: NoteAnalysis.PartiallyGenerated?
    // Tracks whether an analysis is currently running
    @State private var isAnalyzing = false
    // The editable note text from the user
    @State private var note: String = ""
    
    // Initial note text passed in (used to seed the editor on appear)
    let noteText: String
    var body: some View {
        VStack{
            // Text editor for entering or pasting the note
            ZStack(alignment: .topLeading) {
                if note.isEmpty { // Simple placeholder when editor is empty
                    Text("Type or paste your note here…")
                        .foregroundStyle(.secondary)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 12)
                }
                TextEditor(text: $note)
                    .frame(minHeight: 140)
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.quaternary, lineWidth: 1)
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground))
                    )
            }
            .padding(.bottom)
            
            // Show generated topic tags
            if let tags = partial?.tags {
                ForEach(tags.compactMap(\.self), id: \.self) { tag in
                Text(tag)
                        .font(.caption)
                        .background(.blue.opacity(0.2))
                        .clipShape(Capsule())
                    
                }
            }
            
            // Show extracted action items
            if let items = partial?.actionItems {
                ForEach(items.compactMap(\.self), id:\.self) { item in
                Label(item, systemImage: "checkmark.circle")
                    
                }
            }
            
            // Show the AI-generated summary
            if let summary = partial?.summary {
                Text(summary)
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            
            // Button to trigger analysis using the current note
            Button(isAnalyzing ? "Analyzing..." : "Analyze note"){
                Task { await analyze() }
            }
            .buttonStyle(.borderedProminent)
            .disabled(isAnalyzing)
        }
        .animation(.smooth, value: partial?.summary)
        // Seed the editor with the incoming note text once
        .onAppear {
            if note.isEmpty { note = noteText }
        }
    }
    
    // Kicks off streaming analysis and updates partial results as they arrive
    private func analyze() async {
        // Reset previous results and set loading state
        partial = nil
        isAnalyzing = true
        
        
        do {
            // Ask the model to analyze the current note text
            let stream = session.streamResponse(generating: NoteAnalysis.self) {
                "Analyze this note: \(note)"
            }
            for try await snapshot in stream {
                partial = snapshot.content  // Update UI with the latest partial analysis
            }
        } catch {
            print("Streaming Failed \(error.localizedDescription)")
        }
        // Clear loading state when finished
        isAnalyzing = false
        
    }
}

#Preview {
    NoteAnalysisView(noteText: "Foundation models framework:Access to on device MML that powers apple intel - powered and bridged with SwiftUIpersonal search suggestions; create entirely new features such as generating itinerary in appDialogue on the fly Works offline Private data on devices no cost for developer or users - Built into OS Available through all iOS aside from watchOS")
}

