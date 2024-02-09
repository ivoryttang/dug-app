//
//  Voices.swift
//  Dug
//
//  Created by Ivory Tang on 2/7/24.
//

import SwiftUI
import AVFoundation

class AudioPlayerViewModel: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false

    func playOrPause() {
        if let player = audioPlayer {
            if player.isPlaying {
                player.pause()
                isPlaying = false
            } else {
                player.play()
                isPlaying = true
            }
        }
    }

    init(audiofile:String) {
        if let sound = Bundle.main.path(forResource: audiofile, ofType: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            } catch {
                print("Error initializing AVAudioPlayer")
            }
        }
    }
}


struct PlayAudioButton: View {
    @ObservedObject var audioPlayer: AudioPlayerViewModel

    var body: some View {
        Button(action: { audioPlayer.playOrPause() }) {
            if audioPlayer.isPlaying {
                Image(systemName: "pause")
                    .foregroundColor(.white)
                    .padding()
            } else {
                Image(systemName: "play")
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}

struct Voice: Identifiable {
    var id = UUID()
    let name: String
    let description: String
//    let image: String
}
struct Voices: View {
    
    @StateObject var audioPlayerViewModelJennifer = AudioPlayerViewModel(audiofile: "jennifer")
    @StateObject var audioPlayerViewModelPaula = AudioPlayerViewModel(audiofile: "paula")
    @StateObject var audioPlayerViewModelMark = AudioPlayerViewModel(audiofile: "mark")
    @StateObject var audioPlayerViewModelMiriam = AudioPlayerViewModel(audiofile: "miriam")
    @StateObject var audioPlayerViewModelJoseph = AudioPlayerViewModel(audiofile: "joseph")
    @StateObject var audioPlayerViewModelJames = AudioPlayerViewModel(audiofile: "james")
    @StateObject var audioPlayerViewModelNatasia = AudioPlayerViewModel(audiofile: "natasia")
    
    let voices = [
        Voice(name:"paula",description: "young female"),
        Voice(name:"mark",description: "young male"),
        Voice(name:"jennifer",description: "young female"),
        Voice(name:"joseph",description: "chill male"),
        Voice(name:"miriam",description: "casual and wry"),
        Voice(name:"james",description: "tough guy"),
        Voice(name:"natasia",description: "snarky and mature")
    ]
    @AppStorage("selectedVoice") var selectedVoice: String = ""
    
    @State private var playing = ""
        
    var body: some View {
       
        VStack {
            Text("Pick a Voice")
                .font(.title)
                .padding()
                .foregroundColor(Color.white)
                        
                        
            LazyVStack(spacing: 20) {
                ForEach(voices) { voice in
                    HStack{
                        
                        Button(action: {
                            selectedVoice = voice.name
                            }) {
                                VStack {
    //                                Image(breed.image)
    //                                    .resizable()
    //                                    .frame(width: 100, height: 100)
    //                                    .cornerRadius(10)
    //                                    .padding()
                                    
                                    Text(voice.name + " - " + voice.description)
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                        .padding()
                                }.background(selectedVoice == voice.name ? Color.purple : .clear)
                            }.cornerRadius(10)
                        

                        PlayAudioButton(audioPlayer: voice.name == "paula" ? audioPlayerViewModelPaula :
                                            voice.name == "mark" ?
                                        audioPlayerViewModelMark :
                                            voice.name == "jennifer" ?
                                        audioPlayerViewModelJennifer :
                                            voice.name == "natasia" ?
                                        audioPlayerViewModelNatasia :
                                            voice.name == "james" ?
                                        audioPlayerViewModelJames :
                                            voice.name == "joseph" ?
                                        audioPlayerViewModelJoseph :
                                            audioPlayerViewModelMiriam
                        )
                        
                    }
                }
            }
            .padding()
                            
         }.background(Color("bubbles-background")).ignoresSafeArea()
        
        
    }
}

struct Voices_Previews: PreviewProvider {
    static var previews: some View {
        Voices()
    }
}
