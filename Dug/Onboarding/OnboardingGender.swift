//
//  StartMode.swift
//  Dug
//
//  Created by Ivory Tang on 2/3/24.
//

import SwiftUI
import Foundation
import SwiftUI

struct OnboardingGender: View {
    @State private var isMaleSelected = false
    @State private var isFemaleSelected = false
    
    @AppStorage("onboard") var onboard: Bool = true
    @AppStorage("pet_gender") var pet_gender: String = ""
    
    func saveGender(){
        Task {
            do {
                let currentUser = try await supabase.auth.session.user
                
                let result = try await supabase.database
                    .from("pet_profiles")
                    .update([
                        "gender": pet_gender
                    ])
                    .eq("owner", value: currentUser.id)
                    .execute()
            } catch{
                debugPrint(error)
            }
        }
    }
    
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
                        pet_gender = "Male"
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
                        pet_gender = "Female"
                    }) {
                        Text("Female")
                    }
                    .padding()
                    .frame(maxWidth: .maximum(80, 350))
                    .background(isFemaleSelected ? Color.purple : Color.white)
                    .cornerRadius(10.0)
                    .foregroundColor(Color("bubbles-background"))
                
                if !onboard {
                    Button(action: {saveGender()}){
                        Text("Save").foregroundColor(.white)
                    }
                }
                    
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
