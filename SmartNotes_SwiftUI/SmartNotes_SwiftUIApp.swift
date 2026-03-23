//
        //
    //  Project: SmartNotes_SwiftUI
    //  File: SmartNotes_SwiftUIApp.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

@main
struct SmartNotes_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NoteAnalysisView(noteText: """
                             Team Sync — March 23
                             • Met with design to review onboarding flow; agreed to simplify the permissions screen and defer location access until after the first task is created.
                             • Customer feedback highlights confusion around “Workspaces” vs “Projects”; propose renaming “Workspaces” to “Teams” and adding a short tooltip on first use.
                             • iOS app crash rate down 18% after 1.2.3; primary fix was the background sync race condition.
                             • Q2 goals: ship offline mode MVP by May 15; finalize pricing experiments; prepare launch materials for v2.0.
                             • Action items:
                                1. Sarah: Draft updated onboarding copy by Friday.
                             2. Dev: Implement deferred location prompt (behind feature flag) by next sprint.
                             3. PM: Set up 5 user interviews focusing on project organization terminology.
                             4. QA: Add regression tests for background sync on low connectivity.
 """)
        }
    }
}
