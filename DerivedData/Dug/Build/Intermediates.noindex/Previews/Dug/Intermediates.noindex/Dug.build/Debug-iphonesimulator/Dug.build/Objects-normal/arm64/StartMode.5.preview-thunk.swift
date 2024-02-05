@_private(sourceFile: "StartMode.swift") import Dug
import Foundation
import SwiftUI
import SwiftUI

extension StartMode_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 125)
        __designTimeSelection(StartMode(), "#10123.[14].[0].property.[0].[0]")
    #sourceLocation()
    }
}

extension StartMode {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 113)
        __designTimeSelection(ZStack {
            __designTimeSelection(Circle().foregroundColor(__designTimeSelection(Color(__designTimeString("#10123.[13].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: "bubbles-background")), "#10123.[13].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value")), "#10123.[13].[0].property.[0].[0].arg[0].value.[0]")
            __designTimeSelection(Button(action:__designTimeSelection(onSpeechStart, "#10123.[13].[0].property.[0].[0].arg[0].value.[1].arg[0].value")){
                __designTimeSelection(Text(__designTimeString("#10123.[13].[0].property.[0].[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "Start Speaking")), "#10123.[13].[0].property.[0].[0].arg[0].value.[1].arg[1].value.[0]")
            }, "#10123.[13].[0].property.[0].[0].arg[0].value.[1]")
        }, "#10123.[13].[0].property.[0].[0]")
        
    #sourceLocation()
    }
}

@_dynamicReplacement(for: encodeWAV(audio:)) private func __preview__encodeWAV(audio: Data) -> Data {
#sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 105)
    // Implement the WAV encoding logic here
    return __designTimeSelection(Data(), "#10123.[12].[0]")
#sourceLocation()
}

@_dynamicReplacement(for: processAudio(audio:)) private func __preview__processAudio(audio: Data) {
#sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 97)
    let blob = createAudioBlob(audio: __designTimeSelection(audio, "#10123.[11].[0].value.arg[0].value"))
    let blobSize = blob.count
    __designTimeSelection(print("Blob Size: \(__designTimeSelection(blobSize, "#10123.[11].[2].arg[0].value.[1].value.arg[0].value"))"), "#10123.[11].[2]")
    __designTimeSelection(sendData(blob: __designTimeSelection(blob, "#10123.[11].[3].arg[0].value")), "#10123.[11].[3]")
#sourceLocation()
}

@_dynamicReplacement(for: createAudioBlob(audio:)) private func __preview__createAudioBlob(audio: Data) -> Data {
#sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 92)
    let wavBuffer = encodeWAV(audio: __designTimeSelection(audio, "#10123.[10].[0].value.arg[0].value"))
    return __designTimeSelection(Data(__designTimeSelection(wavBuffer, "#10123.[10].[1].arg[0].value")), "#10123.[10].[1]")
#sourceLocation()
}

@_dynamicReplacement(for: base64Encode(text:)) private func __preview__base64Encode(text: String?) -> String {
#sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 87)
    guard let text = text else { return "" }
    return __designTimeSelection(Data(__designTimeSelection(text.utf8, "#10123.[9].[1].arg[0].value")).base64EncodedString(), "#10123.[9].[1]")
#sourceLocation()
}

@_dynamicReplacement(for: base64Encode(json:)) private func __preview__base64Encode(json: AnyObject) -> String {
#sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 77)
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: json)
        return jsonData.base64EncodedString()
    } catch {
        print("Error encoding JSON: \(error)")
        return ""
    }
#sourceLocation()
}

@_dynamicReplacement(for: processText(textInput:)) private func __preview__processText(textInput: String) {
#sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 72)
#sourceLocation()
    // Implement processText functionality
}

@_dynamicReplacement(for: onSpeechEnd(audio:isMuted:)) private func __preview__onSpeechEnd(audio: Data, isMuted: Bool) {
#sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 63)
    if isMuted {
        __designTimeSelection(print(__designTimeString("#10123.[6].[0].[0].[0].arg[0].value", fallback: "isMuted = true, prevent audio from being sent")), "#10123.[6].[0].[0].[0]")
        return
    }
    
    __designTimeSelection(processAudio(audio: __designTimeSelection(audio, "#10123.[6].[1].arg[0].value")), "#10123.[6].[1]")
#sourceLocation()
}

@_dynamicReplacement(for: onSpeechStart()) private func __preview__onSpeechStart() {
#sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 59)
#sourceLocation()
    // Implement onSpeechStart functionality
}

@_dynamicReplacement(for: sendData(blob:)) private func __preview__sendData(blob: Data) {
#sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 25)
    let baseUrl = __designTimeString("#10123.[4].[0].value", fallback: "YourBaseURL")
    
    guard let url = URL(string: "\(baseUrl)/inference") else {
        print("Invalid URL")
        return
    }
    
    var request = URLRequest(url: __designTimeSelection(url, "#10123.[4].[2].value.arg[0].value"))
    request.httpMethod = __designTimeString("#10123.[4].[3].[0]", fallback: "POST")
    
    let body = createBody(data: __designTimeSelection(blob, "#10123.[4].[4].value.arg[0].value"))
    
    request.httpBody = body
    
    let task = URLSession.shared.dataTask(with: __designTimeSelection(request, "#10123.[4].[6].value.modifier[0].arg[0].value")) { data, response, error in
        if let error = error {
            __designTimeSelection(print("Error: \(__designTimeSelection(error, "#10123.[4].[6].value.modifier[0].arg[1].value.[0].[0].[0].arg[0].value.[1].value.arg[0].value"))"), "#10123.[4].[6].value.modifier[0].arg[1].value.[0].[0].[0]")
            // Handle error
        } else if let data = data {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                // Process JSON response
                print("JSON response: \(json)")
            } catch {
                print("Error decoding JSON: \(error)")
                // Handle error decoding JSON
            }
        }
    }
    
    __designTimeSelection(task.resume(), "#10123.[4].[7]")
#sourceLocation()
}

@_dynamicReplacement(for: createBody(data:)) private func __preview__createBody(data: Data) -> Data {
#sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 15)
    let formData = NSMutableData()
    let boundary = "Boundary-\(UUID().uuidString)"
    
    // Append audio data
    __designTimeSelection(formData.append(__designTimeSelection(data, "#10123.[3].[2].modifier[0].arg[0].value")), "#10123.[3].[2]")
    
    return formData as Data
#sourceLocation()
}

import struct Dug.StartMode
import struct Dug.StartMode_Previews