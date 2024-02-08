//
//  Voices.swift
//  Dug
//
//  Created by Ivory Tang on 2/7/24.
//

import SwiftUI

struct Descriptor: Identifiable {
    var id = UUID()
    let name: String
//    let image: String
}
struct Character: View {
    
    let voices = [
        Descriptor(name:"Witty and humorous"),
        Descriptor(name:"Playful and exuberant"),
        Descriptor(name:"Chill and calm"),
        Descriptor(name:"Sarcastic and smart"),
        Descriptor(name:"Empathetic and thoughtful"),
        Descriptor(name:"Friendly and welcoming"),
        Descriptor(name:"Posh and proper")
    ]
    @State private var selectedVoice = ""
        
    var body: some View {
            
        VStack {
            
            Text("Pick a Character")
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
                                    
                                    Text(voice.name)
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }.background(selectedVoice == voice.name ? Color.purple : .clear)
                            }.cornerRadius(10)
                    }
                }
            }
            .padding()
                            
            
            
                        
        }.background(Color("bubbles-background")).ignoresSafeArea()
    
        
    }
}

struct Character_Previews: PreviewProvider {
    static var previews: some View {
        Character()
    }
}
