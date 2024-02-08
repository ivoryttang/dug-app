//
//  Profile.swift
//  Dug
//
//  Created by Ivory Tang on 2/7/24.
//

import SwiftUI

struct Profile: View {
    var body: some View {
            VStack {
                Text("Profile")
                    .font(.largeTitle)
                Image("profile_pic")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding(.bottom, 20)
                
                Text("Ivory Tang")
                    .font(.title)
                
                Text("ivoryttang@gmail.com")
                    .font(.subheadline)
                    .foregroundColor(Color("bubbles-background"))
                
                HStack {
                    Text("New York, USA")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Button(action: {
                        // Handle edit profile action
                    }) {
                        Text("Edit Profile")
                            .padding(8)
                            .background(Color("bubbles-background"))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding(.top, 20)
                
                Text("Active Pet Profiles: 3")
                
                VStack {
                    HStack{
                        VStack{
                            Text("Maxi")
                            Text("Dog | Labrador").foregroundColor(.gray)
                        }
                        Image("labrador").resizable()
                            .frame(width: 100, height: 100)
                            .padding(.bottom, 20)
                    }
                }
                    .frame(width: 360,height: 140) // Set the fixed width
                    .background(Color("bubbles-background"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
                
                HStack{
                    VStack {
                        Text("Health Card")
                        Text("3 new updates").foregroundColor(.gray)
                        Image(systemName: "bolt.heart.fill").resizable()
                    }
                        .padding(20)
                        .frame(width: 180,height: 180) // Set the fixed width
                        .background(Color("bubbles-background"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    VStack{
                        Text("Activities")
                        Text("2 Hours").foregroundColor(.gray)
                        Image(systemName: "figure.walk").resizable()
                    }
                        .padding(20)
                        .frame(width: 180, height: 180) // Set the fixed width
                        .background(Color("bubbles-background"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding().navigationBarBackButtonHidden(true)
        }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
