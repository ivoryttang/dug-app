//
//  StartMode.swift
//  Dug
//
//  Created by Ivory Tang on 2/3/24.
//

import SwiftUI
import Foundation
//import Porcupine
//
////let keywordPath = Bundle.main.path(forResource: "Hey Dug", ofType: "ppn")
//
//let wakeWordCallback: ((Int32) -> Void) = { keywordIndex in
//                if keywordIndex == 0 {
//                    // porcupine detected
//                } else if keywordIndex == 1 {
//                    // bumblebee detected
//                }
//            }
//
//func wakeWordDetection() {
//    do {
//        let porcupineManager = try PorcupineManager(
//            accessKey: "oCVygcpj6QFlpPyZuzK9llsUoMfPXzXaL7r5Tzlfk2RP7l2VUaA3+A==",
//            keywords: [Porcupine.BuiltInKeyword.porcupine, Porcupine.BuiltInKeyword.bumblebee],
//            onDetection: wakeWordCallback)
//    } catch { }
//}
//
//func createBody(data: Data) -> Data {
//    let formData = NSMutableData()
//    _ = "Boundary-\(UUID().uuidString)"
//
//    // Append audio data
//    formData.append(data)
//
//    return formData as Data
//}
//
//func sendData(blob: Data) {
//    let baseUrl = "YourBaseURL"
//
//    guard let url = URL(string: "\(baseUrl)/inference") else {
//        print("Invalid URL")
//        return
//    }
//
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//
//    let body = createBody(data: blob)
//
//    request.httpBody = body
//
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//        if let error = error {
//            print("Error: \(error)")
//            // Handle error
//        } else if let data = data {
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                // Process JSON response
//                print("JSON response: \(json)")
//            } catch {
//                print("Error decoding JSON: \(error)")
//                // Handle error decoding JSON
//            }
//        }
//    }
//
//    task.resume()
//}
//
//func onSpeechStart() {
//    // Implement onSpeechStart functionality
//}
//
//func onSpeechEnd(audio: Data, isMuted: Bool) {
//    if isMuted {
//        print("isMuted = true, prevent audio from being sent")
//        return
//    }
//
//    processAudio(audio: audio)
//}
//
//func processText(textInput: String) {
//    // Implement processText functionality
//}
//
//// Helper functions
//func base64Encode(json: AnyObject) -> String {
//    do {
//        let jsonData = try JSONSerialization.data(withJSONObject: json)
//        return jsonData.base64EncodedString()
//    } catch {
//        print("Error encoding JSON: \(error)")
//        return ""
//    }
//}
//
//func base64Encode(text: String?) -> String {
//    guard let text = text else { return "" }
//    return Data(text.utf8).base64EncodedString()
//}
//
//func createAudioBlob(audio: Data) -> Data {
//    let wavBuffer = encodeWAV(audio: audio)
//    return Data(wavBuffer)
//}
//
//func processAudio(audio: Data) {
//    let blob = createAudioBlob(audio: audio)
//    let blobSize = blob.count
//    print("Blob Size: \(blobSize)")
//    sendData(blob: blob)
//}
//
//// Assuming there is a function encodeWAV for encoding WAV data
//func encodeWAV(audio: Data) -> Data {
//    // Implement the WAV encoding logic here
//    return Data()
//}


import SwiftUI

struct OnboardingGender: View {
    @State private var isMaleSelected = false
    @State private var isFemaleSelected = false
    
    var body: some View {
            VStack {
                ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 30, height: 30)
                                
                            
                            Text("2")
                                .font(.title)
                                .foregroundColor(Color("bubbles-background"))
                    
                        }
                    Text("What is your Dog's Gender?")
                        .font(.title)
                        .padding()
                        .foregroundColor(Color.white)
                    
                    // Add your multiple-choice answers here
                    // For example:
                    Button(action: {
                        
                            isMaleSelected = true
                            isFemaleSelected = false
                        
                    }) {
                        Text("Male")
                    }
                    .padding()
                    .frame(maxWidth: .maximum(80, 350))
                    .background(isMaleSelected ? Color.purple : Color.white)
                    .cornerRadius(10.0)
                    .foregroundColor(Color("bubbles-background"))
                    
                    Button(action: {
                        isMaleSelected = false
                        isFemaleSelected = true
                    }) {
                        Text("Female")
                    }
                    .padding()
                    .frame(maxWidth: .maximum(80, 350))
                    .background(isFemaleSelected ? Color.purple : Color.white)
                    .cornerRadius(10.0)
                    .foregroundColor(Color("bubbles-background"))
                    
            }
        .background(Color("bubbles-background"))
        .ignoresSafeArea()
    }
}

struct OnboardingGender_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingGender()
    }
}
