//
//  StartMode.swift
//  Dug WatchKit Extension
//
//  Created by Ivory Tang on 2/3/24.
//

import SwiftUI

struct StartMode: View {
    @State private var settings = false
    @State private var speech: String = ""
    
    func showSettings(){
        settings = true
    }
    var body: some View {
        if settings{
            Voices()
        }else{
        
            ZStack {
                VStack{
                    Button(action: showSettings) {
                        Label("Settings", systemImage: "arrow.left")
                    }
                    Button {
                                Task {
                                    let (data, _) = try await URLSession.shared.data(from: URL(string:"https://api.chucknorris.io/jokes/random")!)
                                    let decodedResponse = try? JSONDecoder().decode(Speech.self, from: data)
                                    speech = decodedResponse?.value ?? ""
                                }
                            } label: {
                                Text("Start Speaking")
                            }
                }
            }.foregroundColor(Color("bubbles-background"))
        }
    }
}

struct Speech: Codable {
    let value: String
}

struct StartMode_Previews: PreviewProvider {
    static var previews: some View {
        StartMode()
    }
}
