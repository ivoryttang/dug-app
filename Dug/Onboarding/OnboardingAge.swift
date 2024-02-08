//
//  StartMode.swift
//  Dug
//
//  Created by Ivory Tang on 2/3/24.
//

import SwiftUI

struct OnboardingAge: View {
    @State private var selectedAge = 1
        
        let ages: [Int] = Array(1...30)
        
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
                    
                    Picker("Age", selection: $selectedAge) {
                        ForEach(ages, id: \.self) { age in
                            Text("\(age)")
                            .foregroundColor(Color.white)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding()
                
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
