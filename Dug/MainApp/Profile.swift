//
//  Profile.swift
//  Dug
//
//  Created by Ivory Tang on 2/7/24.
//

import SwiftUI
import Supabase


struct Profile: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var avatarUrl: String = ""
    @State private var edit: Bool = false
    @State private var pet_breed: String = "labrador"
    @AppStorage("pet_name") var pet_name: String = ""
    
    let supabase = SupabaseClient(supabaseURL: URL(string: "https://cchxhrhiyjeuiqqkreaq.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNjaHhocmhpeWpldWlxcWtyZWFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc4NDk0MjQsImV4cCI6MjAyMzQyNTQyNH0.QjybPhjRB57dEQmbihopl7R_vTn2rNYUqZzcYUqOAL8")

    let itemWidth: CGFloat = 300
   let itemSpacing: CGFloat = 10
   let scaleDownAmount: CGFloat = 0.8
    
    func getUser() async{
        
        do{
            let currentUser = try await supabase.auth.session.user
            
            email = currentUser.email ?? ""
        
        }
        catch{
//            error: somehow profile cannot be read
            print(error.localizedDescription)
        }
        
    }
    
    private func scaleEffect(for geometry: GeometryProxy) -> CGFloat {
            var scale = 1.0
            let midPoint = UIScreen.main.bounds.width / 2
            let itemMidPoint = geometry.frame(in: .global).midX
            let distanceFromCenter = abs(midPoint - itemMidPoint)
            if distanceFromCenter < itemWidth {
                scale = 1 + (1 - scaleDownAmount) * (1 - distanceFromCenter / itemWidth)
            } else {
                scale = scaleDownAmount
            }
            return scale
        }
    
    
    var body: some View {
        if edit{
            EditProfile()
        }else{
            NavigationView{
                VStack {
                    Text("Profile")
                        .font(.largeTitle)
                    Image(avatarUrl)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .padding(.bottom, 20)
                    
                    Text(username)
                        .font(.title)
                    
                    Text(email)
                        .font(.subheadline)
                        .foregroundColor(Color("bubbles-background"))
                    
                    
                    HStack {
                        
                        NavigationLink(destination: EditProfile()) {
                            Text("Edit Profile")
                                .padding(8)
                                .background(Color("bubbles-background"))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    
                    Text("Active Pet Profile(s): 1")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: itemSpacing) {
                            GeometryReader { geometry in
                                VStack {
                                    HStack{
                                        VStack{
                                            Text(pet_name)
                                            Text("Dog | \(pet_breed)").foregroundColor(.gray)
                                        }
                                        Image(pet_breed)
                                            .frame(width: 100, height:80)
                                            .padding(.bottom, 20)
                                            .padding(.leading, 20)
                                    }
                                }
                                .frame(width: 300,height: 140) // Set the fixed width
                                .background(Color("bubbles-background"))
                                .foregroundColor(.white)
                                .cornerRadius(8)
//                                VStack {
//                                    HStack{
//                                        VStack{
//                                            Text("Mini")
//                                            Text("Dog | Labrador").foregroundColor(.gray)
//                                        }
//                                        Image("labrador").resizable()
//                                            .frame(width: 100, height:80)
//                                            .padding(.bottom, 20)
//                                            .padding(.leading, 20)
//                                    }
//                                }
//                                .frame(width: 350,height: 180) // Set the fixed width
//                                .background(Color("bubbles-background"))
//                                .foregroundColor(.white)
//                                .cornerRadius(8)
                            }
//                            .frame(width: itemWidth)
                            
                        }
                        .padding(.horizontal, (UIScreen.main.bounds.width - itemWidth) / 2)
                    }
                    
                    
                    Text("View Statistics")
                    HStack{
                        VStack {
                            Text("Health Card")
                            Text("3 new updates").foregroundColor(.gray).padding(.bottom,20)
                            Image(systemName: "bolt.heart.fill").imageScale(.large)
                        }
                        .padding(20)
                        .frame(width: 180,height: 200) // Set the fixed width
                        .background(Color("bubbles-background"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        VStack{
                            Text("Activities")
                            Text("2 Hours").foregroundColor(.gray).padding(.bottom,20)
                            Image(systemName: "figure.walk").imageScale(.large)
                        }
                        .padding(20)
                        .frame(width: 180, height: 200) // Set the fixed width
                        .background(Color("bubbles-background"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .task {
                await getUser()
            }
                
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
