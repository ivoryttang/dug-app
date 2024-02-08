//
//  OnboardingController.swift
//  Dug
//
//  Created by Ivory Tang on 2/7/24.
//

import SwiftUI

struct OnboardingController: View {
    var body: some View {
        NavigationView{
        TabView{
            OnboardingName()
            OnboardingGender()
            OnboardingAge()
            OnboardingBreed()
            OnboardingCharacteristics()
            NavigationLink(destination: AppNavigationController()) {
                Text("Get Started")
                    .foregroundColor(.white)
            }
        
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color("bubbles-background"))
        }
    }
}

struct OnboardingController_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingController()
    }
}
