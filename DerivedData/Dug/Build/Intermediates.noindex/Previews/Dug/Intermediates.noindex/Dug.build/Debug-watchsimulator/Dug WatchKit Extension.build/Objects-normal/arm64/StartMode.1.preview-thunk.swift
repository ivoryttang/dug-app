@_private(sourceFile: "StartMode.swift") import Dug_WatchKit_Extension
import SwiftUI
import SwiftUI

extension StartMode_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug WatchKit Extension/StartMode.swift", line: 48)
        StartMode()
    #sourceLocation()
    }
}

extension StartMode {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug WatchKit Extension/StartMode.swift", line: 18)
        if settings{
            Voices()
        }else{
        
            ZStack {
                VStack{
                    Button(action: showSettings) {
                        Label(__designTimeString("#8368.[1].[3].property.[0].[0].[1].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "Settings"), systemImage: __designTimeString("#8368.[1].[3].property.[0].[0].[1].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value", fallback: "arrow.left"))
                    }
                    Button {
                                Task {
                                    let (data, _) = try await URLSession.shared.data(from: URL(string:"https://api.chucknorris.io/jokes/random")!)
                                    let decodedResponse = try? JSONDecoder().decode(Speech.self, from: data)
                                    speech = decodedResponse?.value ?? __designTimeString("#8368.[1].[3].property.[0].[0].[1].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[0].value.[2].[0]", fallback: "")
                                }
                            } label: {
                                Text(__designTimeString("#8368.[1].[3].property.[0].[0].[1].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "Start Speaking"))
                            }
                }
            }.foregroundColor(Color(__designTimeString("#8368.[1].[3].property.[0].[0].[1].[0].modifier[0].arg[0].value.arg[0].value", fallback: "bubbles-background")))
        }
    #sourceLocation()
    }
}

extension StartMode {
    @_dynamicReplacement(for: showSettings()) private func __preview__showSettings() {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug WatchKit Extension/StartMode.swift", line: 15)
        settings = true
    #sourceLocation()
    }
}

import struct Dug_WatchKit_Extension.StartMode
import struct Dug_WatchKit_Extension.Speech
import struct Dug_WatchKit_Extension.StartMode_Previews