@_private(sourceFile: "HomeScreen.swift") import Dug_WatchKit_Extension
import SwiftUI
import SwiftUI

extension HomeScreen_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug WatchKit Extension/HomeScreen.swift", line: 36)
        Group {
        HomeScreen()
        }
    #sourceLocation()
    }
}

extension HomeScreen {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug WatchKit Extension/HomeScreen.swift", line: 17)
        if signedIn {
            Voices()
        }else{
            ZStack{
                BubbleBackground().ignoresSafeArea()
                VStack(alignment: .center){
                    Text(__designTimeString("#8116.[1].[2].property.[0].[0].[1].[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "Dug")).font(.largeTitle).fontWeight(.bold)
                    Text(__designTimeString("#8116.[1].[2].property.[0].[0].[1].[0].arg[0].value.[1].arg[1].value.[1].arg[0].value", fallback: "Give your furry friend a voice"))
                    Button(action: signIn) {
                        Text(__designTimeString("#8116.[1].[2].property.[0].[0].[1].[0].arg[0].value.[1].arg[1].value.[2].arg[1].value.[0].arg[0].value", fallback: "Sign In"))
                    }
                }
            }
        }
    #sourceLocation()
    }
}

extension HomeScreen {
    @_dynamicReplacement(for: signIn()) private func __preview__signIn() {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug WatchKit Extension/HomeScreen.swift", line: 14)
        signedIn = true
    #sourceLocation()
    }
}

import struct Dug_WatchKit_Extension.HomeScreen
import struct Dug_WatchKit_Extension.HomeScreen_Previews