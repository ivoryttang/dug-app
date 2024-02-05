@_private(sourceFile: "ContentView.swift") import Dug_WatchKit_Extension
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug WatchKit Extension/ContentView.swift", line: 18)
        Group {
            ContentView()
        }
    #sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug WatchKit Extension/ContentView.swift", line: 12)
        AppTabNavigation()
    #sourceLocation()
    }
}

import struct Dug_WatchKit_Extension.ContentView
import struct Dug_WatchKit_Extension.ContentView_Previews