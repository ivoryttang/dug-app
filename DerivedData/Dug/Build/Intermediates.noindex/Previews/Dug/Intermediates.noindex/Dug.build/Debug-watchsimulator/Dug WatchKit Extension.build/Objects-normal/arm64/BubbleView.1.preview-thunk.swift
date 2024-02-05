@_private(sourceFile: "BubbleView.swift") import Dug_WatchKit_Extension
import SwiftUI
import SwiftUI

extension BubbleView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug WatchKit Extension/BubbleView.swift", line: 45)
        ZStack {
            ZStack {
                BubbleView(opacity: __designTimeFloat("#8054.[2].[0].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: 0.9))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .foregroundStyle(.red)
            
            ZStack {
                BubbleView(opacity: __designTimeFloat("#8054.[2].[0].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: 0.9))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .foregroundStyle(.blue)
            
            ZStack {
                BubbleView(size: __designTimeInteger("#8054.[2].[0].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value", fallback: 300), yOffset: __designTimeInteger("#8054.[2].[0].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[1].value", fallback: -150))
                BubbleView(size: __designTimeInteger("#8054.[2].[0].property.[0].[0].arg[0].value.[2].arg[0].value.[1].arg[0].value", fallback: 260), xOffset: __designTimeInteger("#8054.[2].[0].property.[0].[0].arg[0].value.[2].arg[0].value.[1].arg[1].value", fallback: 40), yOffset: __designTimeInteger("#8054.[2].[0].property.[0].[0].arg[0].value.[2].arg[0].value.[1].arg[2].value", fallback: -60))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            BubbleView(size: __designTimeInteger("#8054.[2].[0].property.[0].[0].arg[0].value.[3].arg[0].value", fallback: 100), xOffset: __designTimeInteger("#8054.[2].[0].property.[0].[0].arg[0].value.[3].arg[1].value", fallback: -40), yOffset: __designTimeInteger("#8054.[2].[0].property.[0].[0].arg[0].value.[3].arg[2].value", fallback: 50))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    #sourceLocation()
    }
}

extension BubbleView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug WatchKit Extension/BubbleView.swift", line: 23)
        Circle()
            .blendMode(.overlay)
            .opacity(shimmer ? opacity * __designTimeInteger("#8054.[1].[8].property.[0].[0].modifier[1].arg[0].value.then.[0]", fallback: 2) : opacity)
            .frame(width: size, height: size)
            .scaleEffect(shimmer ? __designTimeFloat("#8054.[1].[8].property.[0].[0].modifier[3].arg[0].value.then", fallback: 1.1) : __designTimeInteger("#8054.[1].[8].property.[0].[0].modifier[3].arg[0].value.else", fallback: 1))
            .offset(x: xOffset, y: yOffset)
            .offset(y: float ? __designTimeInteger("#8054.[1].[8].property.[0].[0].modifier[5].arg[0].value.then", fallback: 4) : __designTimeInteger("#8054.[1].[8].property.[0].[0].modifier[5].arg[0].value.else", fallback: 0))
            .onAppear {
                #if !os(macOS)
                withAnimation(Animation.easeInOut(duration: 4 - shimmerDelay).repeatForever().delay(shimmerDelay)) {
                    shimmer.toggle()
                }
                withAnimation(Animation.easeInOut(duration: 8 - floatDelay).repeatForever().delay(floatDelay)) {
                    float.toggle()
                }
                #endif
            }
    #sourceLocation()
    }
}

import struct Dug_WatchKit_Extension.BubbleView
import struct Dug_WatchKit_Extension.BubbleView_Previews