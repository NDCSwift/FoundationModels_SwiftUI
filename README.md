# 🧠 SmartNotes — Apple FoundationModels + SwiftUI

A SwiftUI notes app that uses Apple's on-device `FoundationModels` framework to stream AI-generated analysis of your notes — tags, action items, and a plain-English summary — entirely on-device with no API keys or internet required.

---

## 🤔 What this is

SmartNotes hooks into Apple Intelligence's on-device language model via the `FoundationModels` framework. You type or paste a note, hit "Analyze", and the app streams back structured output — topic tags, extracted action items, and a summary — as the model generates it. No server, no cost, no data leaving the device.

## ✅ Why you'd use it

- **Apple Intelligence integration from scratch** — shows `LanguageModelSession`, structured generation, and streaming in one complete example
- **Structured output pattern** — `NoteAnalysis` uses `@Generable` to get typed tags, action items, and summary back from the model
- **Live streaming UI** — partial results update the view as the model generates, using `.animation(.smooth)` for a polished feel
- **Zero dependencies, zero cost** — runs on any Apple Intelligence-capable device without an API key or backend

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/GuOzhtChwT8)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding97). Subscribe for weekly SwiftUI tutorials.

---

## 🚀 Getting Started

### 1. Clone the Repo
```bash
git clone https://github.com/NDCSwift/FoundationModels_SwiftUI.git
cd FoundationModels_SwiftUI
```
Or select "Clone Git Repository…" when Xcode launches.

### 2. Open in Xcode
- Double-click `SmartNotes_SwiftUI.xcodeproj`.

### 3. Set Your Development Team

In Xcode, navigate to: **TARGET → Signing & Capabilities → Team**
- Select your personal or organizational team.

### 4. Update the Bundle Identifier
- Change `com.example.MyApp` to a unique identifier.

### 5. Run
Requires a device with Apple Intelligence enabled (iPhone 15 Pro / iPhone 16 or later, iOS 18.1+).

---

## 🛠️ Notes

- Apple Intelligence must be enabled in **Settings** on the test device
- `FoundationModels` is not available on the Simulator
- If you see a code signing error, check that Team and Bundle ID are set

## 📦 Requirements

- Xcode 16+
- iOS 18.1+
- Apple Intelligence-capable device (iPhone 15 Pro or later)

📺 [Watch the guide on YouTube](https://youtu.be/GuOzhtChwT8)
