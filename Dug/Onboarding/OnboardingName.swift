//
//  OnboardingName.swift
//  Dug
//
//  Created by Ivory Tang on 2/7/24.
//

import SwiftUI

struct OnboardingName: View {
    @AppStorage("pet_name") var pet_name: String = ""
    @AppStorage("onboard") var onboard: Bool = true
    
    func saveName(){
        Task {
            do {
                let currentUser = try await supabase.auth.session.user
                
                let result = try await supabase.database
                        .from("pet_profiles")
                        .update([
                            "name": pet_name
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
                                
                            
                            Text("1")
                                .font(.title)
                                .foregroundColor(Color("bubbles-background"))
                    
                        }
                    Text("What is Your Dog's Name?")
                        .font(.title)
                        .padding()
                        .foregroundColor(Color.white)
                    
                
                    
                TextField("Name", text: $pet_name)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                    .frame(maxWidth: .maximum(80, 300))
                    .padding(.bottom, 20)
                
                if !onboard {
                    Button(action: {saveName()}){
                        Text("Save").foregroundColor(.white)
                    }
                }
            }
        .background(Color("bubbles-background"))
    
    }
}

struct OnboardingName_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingName()
    }
}
