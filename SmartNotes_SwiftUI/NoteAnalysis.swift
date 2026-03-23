//
        //
    //  Project: SmartNotes_SwiftUI
    //  File: NoteAnalysis.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

import FoundationModels

// Structured output model for analyzing a note into tags, action items, and a summary.

// Mark this type as generable by the language model for structured outputs
@Generable

// Represents the AI-generated analysis of a note
struct NoteAnalysis {
    
    // 3–5 topic tags to categorize the note
    @Guide(description: "3-5 relevant topic tags for categorization", .count(5))
    let tags: [String]

    // Actionable items extracted from the note (may be empty)
    @Guide(description: "Actionalbe items extracted from the note, if any")
    let actionItems: [String]
//    
//    @Guide(description: "Relevance Score", .range(1...10))
//    let score: Int
    
    // A concise 1–2 sentence summary of the note
    @Guide(description: "A concise 1-2 sentence summary of the note")
    let summary: String
    
}

