@_private(sourceFile: "HomeScreen.swift") import Dug_WatchKit_Extension
import SwiftUI
import SwiftUI

extension HomeScreen_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug WatchKit Extension/HomeScreen.swift", line: 36)
        __designTimeSelection(Group {
        __designTimeSelection(HomeScreen(), "#8116.[2].[0].property.[0].[0].arg[0].value.[0]")
        }, "#8116.[2].[0].property.[0].[0]")
    #sourceLocation()
    }
}

extension HomeScreen {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug WatchKit Extension/HomeScreen.swift", line: 17)
        if signedIn {
            __designTimeSelection(Voices(), "#8116.[1].[2].property.[0].[0].[0].[0]")
        }else{
            __designTimeSelection(ZStack{
                __designTimeSelection(BubbleBackground().ignoresSafeArea(), "#8116.[1].[2].property.[0].[0].[1].[0].arg[0].value.[0]")
                __designTimeSelection(VStack(alignment: .center){
                    __designTimeSelection(Text(__designTimeString("#8116.[1].[2].property.[0].[0].[1].[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "Dug")).font(.largeTitle).fontWeight(.bold), "#8116.[1].[2].property.[0].[0].[1].[0].arg[0].value.[1].arg[1].value.[0]")
                    __designTimeSelection(Text(__designTimeString("#8116.[1].[2].property.[0].[0].[1].[0].arg[0].value.[1].arg[1].value.[1].arg[0].value", fallback: "Give your furry friend a voice")), "#8116.[1].[2].property.[0].[0].[1].[0].arg[0].value.[1].arg[1].value.[1]")
                    __designTimeSelection(Button(action: __designTimeSelection(signIn, "#8116.[1].[2].property.[0].[0].[1].[0].arg[0].value.[1].arg[1].value.[2].arg[0].value")) {
                        __designTimeSelection(Text(__designTimeString("#8116.[1].[2].property.[0].[0].[1].[0].arg[0].value.[1].arg[1].value.[2].arg[1].value.[0].arg[0].value", fallback: "Sign In")), "#8116.[1].[2].property.[0].[0].[1].[0].arg[0].value.[1].arg[1].value.[2].arg[1].value.[0]")
                    }, "#8116.[1].[2].property.[0].[0].[1].[0].arg[0].value.[1].arg[1].value.[2]")
                }, "#8116.[1].[2].property.[0].[0].[1].[0].arg[0].value.[1]")
            }, "#8116.[1].[2].property.[0].[0].[1].[0]")
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