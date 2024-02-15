//
//  Settings.swift
//  Dug
//
//  Created by Ivory Tang on 2/7/24.
//

import SwiftUI
import Supabase

struct Settings: View {
    @AppStorage("loggedIn") var loggedIn: Bool = true
    let supabase = SupabaseClient(supabaseURL: URL(string: "https://cchxhrhiyjeuiqqkreaq.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNjaHhocmhpeWpldWlxcWtyZWFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc4NDk0MjQsImV4cCI6MjAyMzQyNTQyNH0.QjybPhjRB57dEQmbihopl7R_vTn2rNYUqZzcYUqOAL8")
    @State var result: Result<Void, Error>?
    func signOut(){
        Task {
            do {
                try await supabase.auth.signOut()
                result = .success(())
                loggedIn.toggle()
            } catch {
                result = .failure(error)
            }
        }
    }
    var body: some View {
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
                            Text("Access to your location").foregroundColor(.white)                       }.frame(width: 230)
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                            
                        }.fixedSize()
                        
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
                            Text("Access to your contacts").foregroundColor(.white)                       }.frame(width: 230)
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                            
                        }.fixedSize()
                        
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
                
                Text("Sign Out")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("bubbles-background"))
                    .cornerRadius(10.0)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        signOut()
                    }
            }.navigationBarBackButtonHidden(true)

    }

    
        
    
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
