//
//  Settings.swift
//  Dug
//
//  Created by Ivory Tang on 2/7/24.
//

import SwiftUI

struct Settings: View {
    @State private var showVoice = false
    func viewVoiceOptions(){
        showVoice = true
    }
    @State private var showCharacter = false
    func viewCharacterOptions(){
        showCharacter = true
    }
    var body: some View {
        if showVoice{
            Voices()
        }else if showCharacter{
            Character()
        }else{
            
            ScrollView {
                Text("Settings")
                    .font(.largeTitle)
                Text("Personalization").font(.subheadline).foregroundColor(Color("bubbles-background"))
                
//                voice
                VStack {
                    
                    HStack{
                        Image(systemName: "mic").frame(width: 10)
                        VStack(alignment: .leading){
                            Text("Voice").bold()
                            Text("Customize your pet's voice").foregroundColor(.white)                        }.frame(width: 260)
                        NavigationLink(destination: {Voices()}) {
                                
                            Image(systemName: "chevron.right")
                            }
                        
                        
                    }
                    
                }
                    .frame(width: 360,height: 80) // Set the fixed width
                    .background(Color("bubbles-background"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
//                personality
                VStack {
                    
                    HStack{
                        Image(systemName: "person.3.sequence").frame(width: 0)
                        VStack(alignment: .leading){
                            Text("Character").bold()
                            Text("Customize pet personality").foregroundColor(.white)                       }.frame(width: 260)
                        NavigationLink(destination: {Character()}) {
                                
                            Image(systemName: "chevron.right")
                            }
                        
                    }
                    
                }
                    .frame(width: 360,height: 80) // Set the fixed width
                    .background(Color("bubbles-background"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
    //          Skills
                VStack {
                    
                    HStack{
                        Image(systemName: "paintbrush.pointed").frame(width: 10)
                        VStack(alignment: .leading){
                            Text("Skills").bold()
                            Text("Teach your pet some skills").foregroundColor(.white)                       }.frame(width: 260)
                        NavigationLink(destination: {Skills()}) {
                                
                            Image(systemName: "chevron.right")
                        }
                        
                    }
                    
                }
                    .frame(width: 360,height: 80) // Set the fixed width
                    .background(Color("bubbles-background"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                
                Text("Access").font(.subheadline).foregroundColor(Color("bubbles-background"))
                
                VStack {
                    
                    HStack{
                        Image(systemName: "map").frame(width: 10)
                        VStack(alignment: .leading){
                            Text("Location Access").bold()
                            Text("Access to your location").foregroundColor(.white)                       }.frame(width: 260)
                        Button(action: viewVoiceOptions){
                            Image(systemName: "chevron.right")
                        }
                        
                    }
                    
                }
                    .frame(width: 360,height: 80) // Set the fixed width
                    .background(Color("bubbles-background"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                
                VStack {
                    
                    HStack{
                        Image(systemName: "person").frame(width: 10)
                        VStack(alignment: .leading){
                            Text("Contacts Access").bold()
                            Text("Access to your contacts").foregroundColor(.white)                       }.frame(width: 260)
                        Button(action: viewVoiceOptions){
                            Image(systemName: "chevron.right")
                        }
                        
                    }
                    
                }
                    .frame(width: 360,height: 80) // Set the fixed width
                    .background(Color("bubbles-background"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                Text("Notifications").font(.subheadline).foregroundColor(Color("bubbles-background"))
                VStack {
                    
                    HStack{
                        Image(systemName: "bell").frame(width: 10)
                        VStack(alignment: .leading){
                            Text("App Notifications").bold()
                            Text("Get Push Notifications").foregroundColor(.white)                       }.frame(width: 230)
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                              
                        }.fixedSize()
                        
                    }
                    
                }
                    .frame(width: 360,height: 80) // Set the fixed width
                    .background(Color("bubbles-background"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }.navigationBarBackButtonHidden(true)
            }

    }
        
    
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
