//
//  OnboardingController.swift
//  Dug
//
//  Created by Ivory Tang on 2/7/24.
//

import SwiftUI

struct OnboardingController: View {
    @AppStorage("onboard") var onboard: Bool = true
    @AppStorage("pet_name") var pet_name: String = ""
    @AppStorage("pet_age") var pet_age: Int = 0
    @AppStorage("pet_gender") var pet_gender: String = ""
    @AppStorage("pet_breed") var pet_breed: String = ""
    @AppStorage("pet_characteristics") var pet_characteristics: String = ""
    
    func savePetProfile(){
        Task {
            do {
                let currentUser = try await supabase.auth.session.user
                
                try await supabase.database
                    .from("pet_profiles")
                    .insert(
                        PetProfile(
                            name: pet_name,
                            age: pet_age,
                            gender: pet_gender,
                            breed: pet_breed,
                            characteristics: pet_characteristics,
                            owner: currentUser.id
                        )
                    )
                    .execute()
                
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        NavigationView{
            TabView{
                OnboardingName()
                OnboardingGender()
                OnboardingAge()
                OnboardingBreed()
                OnboardingCharacteristics()
                if onboard{
                    VStack{
                        Image("Logo")
                        Text("Whether you're looking for a compassionate companion, a hilarious comedian, or a wise advisor to get you through life's ups and downs, Dug has got your back :)").foregroundColor(.white).font(.title).multilineTextAlignment(.center).padding(30)
                        
                    Button(action: {savePetProfile()}){
                            HStack{
                                
                                Text("Save").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.leading, 20).padding(.top, 10).padding(.trailing, 20).padding(.bottom, 10)
                                    .foregroundColor(.white)
                                    .background(.purple)
                                    .cornerRadius(80)
                            }
                        NavigationLink(destination: AppNavigationController())
                        {
                            HStack{
                                
                                Image(systemName: "arrowshape.right").padding(.leading, 20)
                                    .padding(.trailing, 20)
                            }.foregroundColor(.white).padding(.top, 10).padding(.bottom, 10)
                                .font(.title)
                                
                            }
                        }
                    }
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
