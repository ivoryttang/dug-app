@_private(sourceFile: "StartMode.swift") import Dug
import Foundation
import SwiftUI
import SwiftUI

extension StartMode_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 125)
        StartMode()
    #sourceLocation()
    }
}

extension StartMode {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 113)
        ZStack {
            Circle().foregroundColor(Color(__designTimeString("#10123.[13].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: "bubbles-background")))
            Button(action:onSpeechStart){
                Text(__designTimeString("#10123.[13].[0].property.[0].[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "Start Speaking"))
            }
        }
        
    #sourceLocation()
    }
}

@_dynamicReplacement(for: encodeWAV(audio:)) private func __preview__encodeWAV(audio: Data) -> Data {
#sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 105)
    // Implement the WAV encoding logic here
    return Data()
#sourceLocation()
}

@_dynamicReplacement(for: processAudio(audio:)) private func __preview__processAudio(audio: Data) {
#sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 97)
    let blob = createAudioBlob(audio: audio)
    let blobSize = blob.count
    print("Blob Size: \(blobSize)")
    sendData(blob: blob)
#sourceLocation()
}

@_dynamicReplacement(for: createAudioBlob(audio:)) private func __preview__createAudioBlob(audio: Data) -> Data {
#sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 92)
    let wavBuffer = encodeWAV(audio: audio)
    return Data(wavBuffer)
#sourceLocation()
}

@_dynamicReplacement(for: base64Encode(text:)) private func __preview__base64Encode(text: String?) -> String {
#sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 87)
    guard let text = text else { return "" }
    return Data(text.utf8).base64EncodedString()
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
        print(__designTimeString("#10123.[6].[0].[0].[0].arg[0].value", fallback: "isMuted = true, prevent audio from being sent"))
        return
    }
    
    processAudio(audio: audio)
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
    
    var request = URLRequest(url: url)
    request.httpMethod = __designTimeString("#10123.[4].[3].[0]", fallback: "POST")
    
    let body = createBody(data: blob)
    
    request.httpBody = body
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error)")
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
    
    task.resume()
#sourceLocation()
}

@_dynamicReplacement(for: createBody(data:)) private func __preview__createBody(data: Data) -> Data {
#sourceLocation(file: "/Users/ivorytang/Desktop/Dug/Dug/Welcome/StartMode.swift", line: 15)
    let formData = NSMutableData()
    let boundary = "Boundary-\(UUID().uuidString)"
    
    // Append audio data
    formData.append(data)
    
    return formData as Data
#sourceLocation()
}

import struct Dug.StartMode
import struct Dug.StartMode_Previews