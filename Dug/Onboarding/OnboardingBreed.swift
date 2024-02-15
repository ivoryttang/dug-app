//
//  OnboardingBreed.swift
//  Dug
//
//  Created by Ivory Tang on 2/7/24.
//

import SwiftUI

struct DogBreed: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

struct OnboardingBreed: View {
    let dogBreeds = [
        DogBreed(name: "Labrador Retriever", image: "labrador"),
        DogBreed(name: "German Shepherd", image: "german_shepherd"),
        DogBreed(name: "Golden Retriever", image: "golden_retriever"),
        // Add more dog breeds as needed
    ]
    
    @AppStorage("onboard") var onboard: Bool = true
    @AppStorage("pet_breed") var pet_breed: String = ""
    
    func saveBreed(){
        Task {
            do {
                let currentUser = try await supabase.auth.session.user
                
                let result = try await supabase.database
                    .from("pet_profiles")
                    .update([
                        "breed": pet_breed
                    ])
                    .eq("owner", value: currentUser.id)
                    .execute()
            } catch{
                debugPrint(error)
            }
        }
    }
    
    var body: some View {
        
        ScrollView {
            ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 30, height: 30)
                            
                        
                        Text("4")
                            .font(.title)
                            .foregroundColor(Color("bubbles-background"))
                
                    }
            Text("What is Your Dog's Breed?").font(.title)
                .padding()
                .foregroundColor(Color.white)
                LazyVStack(spacing: 20) {
                    ForEach(dogBreeds) { breed in
                        Button(action: {
                                pet_breed = breed.name
                            }) {
                                VStack {
                                    Image(breed.image)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                        .padding()
                                    
                                    Text(breed.name)
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }.background(pet_breed == breed.name ? Color.purple : .clear)
                            }.cornerRadius(10)
                    }
                }
                .padding()
                
                if !onboard {
                    Button(action: {saveBreed()}){
                        Text("Save").foregroundColor(.white)
                    }
                }
            
            }
            .background(Color("bubbles-background"))
    }
}

struct OnboardingBreed_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingBreed()
    }
}
