//
//  StartMode.swift
//  Dug
//
//  Created by Ivory Tang on 2/3/24.
//

import SwiftUI

struct OnboardingAge: View {
    @AppStorage("pet_age") var pet_age: Int = 1
        
    let ages: [Int] = Array(1...30)
    
    @AppStorage("onboard") var onboard: Bool = true
    
    func saveAge(){
        Task {
            do {
                let currentUser = try await supabase.auth.session.user
                
                let result = try await supabase.database
                        .from("pet_profiles")
                        .update([
                            "age": pet_age
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
                            
                        
                        Text("3")
                            .font(.title)
                            .foregroundColor(Color("bubbles-background"))
                
                    }
                Text("What is Your Dog's Age?")
                    .font(.title)
                    .foregroundColor(Color.white)
                
                Picker("Age", selection: $pet_age) {
                    ForEach(ages, id: \.self) { age in
                        Text("\(age)")
                        .foregroundColor(Color.white)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .padding()
            
                if !onboard {
                    Button(action: {saveAge()}){
                        Text("Save").foregroundColor(.white)
                    }
                }
            
        }
        .foregroundColor(Color.white)
        .background(Color("bubbles-background"))
        .ignoresSafeArea()
    }
}

struct OnboardingAge_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingAge()
    }
}
