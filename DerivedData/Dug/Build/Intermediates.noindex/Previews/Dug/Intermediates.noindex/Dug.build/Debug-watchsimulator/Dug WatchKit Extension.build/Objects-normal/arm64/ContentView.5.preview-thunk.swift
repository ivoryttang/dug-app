@_private(sourceFile: "ContentView.swift") import Dug_WatchKit_Extension
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug WatchKit Extension/ContentView.swift", line: 18)
        __designTimeSelection(Group {
            __designTimeSelection(ContentView(), "#7948.[2].[0].property.[0].[0].arg[0].value.[0]")
        }, "#7948.[2].[0].property.[0].[0]")
    #sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug WatchKit Extension/ContentView.swift", line: 12)
        __designTimeSelection(AppTabNavigation(), "#7948.[1].[0].property.[0].[0]")
    #sourceLocation()
    }
}

import struct Dug_WatchKit_Extension.ContentView
import struct Dug_WatchKit_Extension.ContentView_Previews