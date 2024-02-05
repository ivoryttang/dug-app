@_private(sourceFile: "BubbleView.swift") import Dug_WatchKit_Extension
import SwiftUI
import SwiftUI

extension BubbleView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug WatchKit Extension/BubbleView.swift", line: 45)
        __designTimeSelection(ZStack {
            __designTimeSelection(ZStack {
                __designTimeSelection(BubbleView(opacity: __designTimeFloat("#8054.[2].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: 0.9)), "#8054.[2].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0]")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .foregroundStyle(.red), "#8054.[2].[0].property.[0].[0].arg[0].value.[0]")
            
            __designTimeSelection(ZStack {
                __designTimeSelection(BubbleView(opacity: __designTimeFloat("#8054.[2].[0].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: 0.9)), "#8054.[2].[0].property.[0].[0].arg[0].value.[1].arg[0].value.[0]")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .foregroundStyle(.blue), "#8054.[2].[0].property.[0].[0].arg[0].value.[1]")
            
            __designTimeSelection(ZStack {
                __designTimeSelection(BubbleView(size: __designTimeInteger("#8054.[2].[0].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value", fallback: 300), yOffset: __designTimeInteger("#8054.[2].[0].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value", fallback: -150)), "#8054.[2].[0].property.[0].[0].arg[0].value.[2].arg[0].value.[0]")
                __designTimeSelection(BubbleView(size: __designTimeInteger("#8054.[2].[0].property.[0].[0].arg[0].value.[2].arg[0].value.[1].arg[0].value", fallback: 260), xOffset: __designTimeInteger("#8054.[2].[0].property.[0].[0].arg[0].value.[2].arg[0].value.[1].arg[1].value", fallback: 40), yOffset: __designTimeInteger("#8054.[2].[0].property.[0].[0].arg[0].value.[2].arg[0].value.[1].arg[2].value", fallback: -60)), "#8054.[2].[0].property.[0].[0].arg[0].value.[2].arg[0].value.[1]")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top), "#8054.[2].[0].property.[0].[0].arg[0].value.[2]")
            
            __designTimeSelection(BubbleView(size: __designTimeInteger("#8054.[2].[0].property.[0].[0].arg[0].value.[3].arg[0].value", fallback: 100), xOffset: __designTimeInteger("#8054.[2].[0].property.[0].[0].arg[0].value.[3].arg[1].value", fallback: -40), yOffset: __designTimeInteger("#8054.[2].[0].property.[0].[0].arg[0].value.[3].arg[2].value", fallback: 50)), "#8054.[2].[0].property.[0].[0].arg[0].value.[3]")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity), "#8054.[2].[0].property.[0].[0]")
    #sourceLocation()
    }
}

extension BubbleView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug WatchKit Extension/BubbleView.swift", line: 23)
        __designTimeSelection(Circle()
            .blendMode(.overlay)
            .opacity(__designTimeSelection(shimmer, "#8054.[1].[8].property.[0].[0].modifier[1].arg[0].value.if") ? opacity * __designTimeInteger("#8054.[1].[8].property.[0].[0].modifier[1].arg[0].value.then.[0]", fallback: 2) : __designTimeSelection(opacity, "#8054.[1].[8].property.[0].[0].modifier[1].arg[0].value.else"))
            .frame(width: __designTimeSelection(size, "#8054.[1].[8].property.[0].[0].modifier[2].arg[0].value"), height: __designTimeSelection(size, "#8054.[1].[8].property.[0].[0].modifier[2].arg[1].value"))
            .scaleEffect(__designTimeSelection(shimmer, "#8054.[1].[8].property.[0].[0].modifier[3].arg[0].value.if") ? __designTimeFloat("#8054.[1].[8].property.[0].[0].modifier[3].arg[0].value.then", fallback: 1.1) : __designTimeInteger("#8054.[1].[8].property.[0].[0].modifier[3].arg[0].value.else", fallback: 1))
            .offset(x: __designTimeSelection(xOffset, "#8054.[1].[8].property.[0].[0].modifier[4].arg[0].value"), y: __designTimeSelection(yOffset, "#8054.[1].[8].property.[0].[0].modifier[4].arg[1].value"))
            .offset(y: __designTimeSelection(float, "#8054.[1].[8].property.[0].[0].modifier[5].arg[0].value.if") ? __designTimeInteger("#8054.[1].[8].property.[0].[0].modifier[5].arg[0].value.then", fallback: 4) : __designTimeInteger("#8054.[1].[8].property.[0].[0].modifier[5].arg[0].value.else", fallback: 0))
            .onAppear {
                #if !os(macOS)
                __designTimeSelection(withAnimation(__designTimeSelection(Animation.easeInOut(duration: 4 - shimmerDelay).repeatForever().delay(__designTimeSelection(__designTimeSelection(shimmerDelay, "#8054.[1].[8].property.[0].[0].modifier[6].arg[0].value.[0].[0].[0].arg[0].value.modifier[1].arg[0].value"), "#8054.[1].[8].property.[0].[0].modifier[6].arg[0].value.[0].[0].[0].arg[0].value.arg[0].value")), "#8054.[1].[8].property.[0].[0].modifier[6].arg[0].value.[0].[0].[0].arg[0].value")) {
                    __designTimeSelection(shimmer.toggle(), "#8054.[1].[8].property.[0].[0].modifier[6].arg[0].value.[0].[0].[0].arg[1].value.[0]")
                }, "#8054.[1].[8].property.[0].[0].modifier[6].arg[0].value.[0].[0].[0]")
                __designTimeSelection(withAnimation(__designTimeSelection(Animation.easeInOut(duration: 8 - floatDelay).repeatForever().delay(__designTimeSelection(__designTimeSelection(floatDelay, "#8054.[1].[8].property.[0].[0].modifier[6].arg[0].value.[0].[0].[1].arg[0].value.modifier[1].arg[0].value"), "#8054.[1].[8].property.[0].[0].modifier[6].arg[0].value.[0].[0].[1].arg[0].value.arg[0].value")), "#8054.[1].[8].property.[0].[0].modifier[6].arg[0].value.[0].[0].[1].arg[0].value")) {
                    __designTimeSelection(float.toggle(), "#8054.[1].[8].property.[0].[0].modifier[6].arg[0].value.[0].[0].[1].arg[1].value.[0]")
                }, "#8054.[1].[8].property.[0].[0].modifier[6].arg[0].value.[0].[0].[1]")
                #endif
            }, "#8054.[1].[8].property.[0].[0]")
    #sourceLocation()
    }
}

import struct Dug_WatchKit_Extension.BubbleView
import struct Dug_WatchKit_Extension.BubbleView_Previews