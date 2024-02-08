import SwiftUI
import CoreBluetooth
import AVFoundation
import Speech
//import Vapi


struct PetItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
}

struct Discover: View {
    
    @State private var isBluetoothOn = false
    let microphoneAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .audio)
    @State private var isMicConnected = false
    @State private var isDeviceConnected = false
    
    
    func accessMic() async {
        let status =  AVCaptureDevice.authorizationStatus(for: .audio)
                
        switch(status){
        case .authorized:
            isMicConnected = true
            print("mic on")
        case .notDetermined:
            await AVCaptureDevice.requestAccess(for: .audio)
            isMicConnected = true
            print("requested access")
        case .denied:
            isMicConnected = false
        case .restricted:
            isMicConnected = false
            
            
        @unknown default:
            isMicConnected = false
        }
        
        SFSpeechRecognizer.requestAuthorization { (authState) in
                DispatchQueue.main.async {
                    if authState == .authorized {
                        print("is authorized") // <---- is printed!
                        isMicConnected = true
                    } else {
                        isMicConnected = false
                    }
                }
            }
    }

    func getMic() {
        Task {
            await accessMic()
        }
    }
    
    let petItems = [
        PetItem(name: "10 Tips for Healthy, Happy Dogs", description: "12 min read", imageName: "dog_health"),
        PetItem(name: "Shop", description: "Search dog food, accessories, care, and more", imageName: "dog_shop")
        // Add more pet items as needed
    ]
    
    func createSession(){
        do {
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default, options: [.allowBluetooth, .defaultToSpeaker])
            
        } catch {
            // Handle the error
            print("Error setting audio session category: \(error.localizedDescription)")
        }
    }
    func startSession(){
        do{
            try AVAudioSession.sharedInstance().setActive(true)
            isDeviceConnected.toggle()
            getMic()
            if isDeviceConnected {
                guard let url = URL(string: "https://api.vapi.ai/call/web") else { return }
                            
                // Define the request body
                let parameters : [String: Any] = [
                    "assistantId": "b5cc5a76-f7c8-4816-8aa0-63e8bc699f60"
                ]
                let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
                
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.httpBody = jsonData
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue("Bearer f8f37a2e-4c9f-4b25-a1a5-f61575406a40", forHTTPHeaderField: "Authorization")
                
                // Perform the POST request
                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        print("Error: \(error)")
                    } else if let data = data {
                        // Handle the response data
                        if let responseString = String(data: data, encoding: .utf8) {
                            print("Response: \(responseString)")
                        }
                    }
                }.resume()
            }
        }catch{
            print("error starting")
        }
    }
    
    var body: some View {
        ScrollView {
            Text("Connect")
                .font(.largeTitle)
            VStack {
                Text("Bluetooth Status: \(isBluetoothOn ? "On" : "Off")")
                Text("Microphone Access: \(isMicConnected ? "On" : "Off")")
                Text("Device Connected: \(isDeviceConnected ? "Yes" : "No")")
                ZStack {
                    Circle()
                        .fill(isDeviceConnected ? .purple : Color("bubbles-background"))
                        .frame(width: 250, height: 250)
                        
                    
                    Button(action: {startSession()}) {
                        isDeviceConnected ? Text("Speaker Active") : Text("Speaker Inactive")
                    }.foregroundColor(.white)
            
                }

                
                
            }
            .onAppear {
                startSession()
            }
            Text("Discover")
                .font(.largeTitle)
            LazyVStack(spacing: 20) {
                ForEach(petItems) { item in
                    NavigationLink(destination: Text(item.description)) {
                        PetItemRow(petItem: item)
                    }
                }
            }
            .padding()
        }
    }
}

struct PetItemRow: View {
    let petItem: PetItem
    
    var body: some View {
        HStack {
            Image(petItem.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(petItem.name)
                    .font(.title)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                
                Text(petItem.description)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}


struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
    }
}
