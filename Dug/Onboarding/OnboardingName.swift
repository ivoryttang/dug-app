//
//  OnboardingName.swift
//  Dug
//
//  Created by Ivory Tang on 2/7/24.
//

import SwiftUI

struct OnboardingName: View {
    @State private var name: String = ""
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
                    
                    
                    
                TextField("Name", text: $name)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                    .frame(maxWidth: .maximum(80, 300))
                    .padding(.bottom, 20)
            }
        .background(Color("bubbles-background"))
    
    }
}

struct OnboardingName_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingName()
    }
}
