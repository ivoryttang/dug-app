//
//  Voices.swift
//  Dug
//
//  Created by Ivory Tang on 2/3/24.
//

import SwiftUI

struct Voices: View {
    
    @State private var showingSettings = true
    
    func activate() {
        showingSettings = false
    }
    
    enum Voice: String, CaseIterable, Identifiable {
        case matt, jen, steve, paula
        var id: Self { self }
    }


    @State private var selectedVoice: Voice = .matt
    
    enum Personality: String, CaseIterable, Identifiable {
        case funny, empathetic, didactic, friendly
        var id: Self { self }
    }


    @State private var selectedPersonality: Personality = .funny
    
    var body: some View {
        if showingSettings {
            ZStack {
                Color("bubbles-background").ignoresSafeArea()
                VStack {
                        Picker("Voice", selection: $selectedVoice) {
                            ForEach(Voice.allCases) { voice in
                                Text(voice.rawValue.capitalized)
                            }
                        }
                        Picker("Personality", selection: $selectedPersonality) {
                            ForEach(Personality.allCases) { personality in
                                Text(personality.rawValue.capitalized)
                            }
                        }
                    Button(action: activate) {
                        Label("Continue", systemImage: "arrow.right")
                    }
                    
                }
            }
        } else {
//            StartMode()
        }
        
        
    }
}

struct Voices_Previews: PreviewProvider {
    static var previews: some View {
        Voices()
    }
}
