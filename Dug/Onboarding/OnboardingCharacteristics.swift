//
//  OnboardingCharacteristics.swift
//  Dug
//
//  Created by Ivory Tang on 2/7/24.
//

import SwiftUI


struct OnboardingCharacteristics: View {
    @State private var enter = false
    
    func setEnter(){
        enter = true
    }
    
    let characteristics = [
        "Energetic","Funny","Calm","Empathetic","Aggressive","Soft","Outgoing"
    ]
    @State private var selectedItems = Set<String>()
        
    @AppStorage("onboard") var onboard: Bool = true
    @AppStorage("pet_characteristics") var pet_characteristics: String = ""
    
    func saveCharacteristics(){
        Task {
            do {
                pet_characteristics = selectedItems.first ?? ""
                let currentUser = try await supabase.auth.session.user
                
                let result = try await supabase.database
                    .from("pet_profiles")
                    .update([
                        "characteristics": pet_characteristics
                    ])
                    .eq("owner", value: currentUser.id)
                    .execute()
            } catch{
                debugPrint(error)
            }
        }
    }
    
    var body: some View {
        if enter{
            AppNavigationController()
        }else{
            
        VStack {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 30, height: 30)
                    
                
                Text("5")
                    .font(.title)
                    .foregroundColor(Color("bubbles-background"))
        
            }
                Text("How Would You Characterize Your Dog? (Please Select All That Apply)")
                    .font(.title)
                    .padding()
                    .foregroundColor(Color.white)
                
                        
            List {
                    ForEach(characteristics, id: \.self) { item in
                        MultipleSelectionRow(title: item, isSelected: self.selectedItems.contains(item)) {
                            if self.selectedItems.contains(item) {
                                self.selectedItems.remove(item)
                            } else {
                                self.selectedItems.insert(item)
                            }
                        }
                        
                    }
                }
            
            .listStyle(PlainListStyle())
            .foregroundColor(Color("bubbles-background"))
                    
            if !onboard {
                Button(action: {saveCharacteristics()}){
                    Text("Save").foregroundColor(.white)
                }
            }
            
                        
                }.background(Color("bubbles-background"))
    
        }
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title).foregroundColor(Color("bubbles-background"))
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark").foregroundColor(Color("bubbles-background"))
                }
            }
            
        }
    }
}

struct OnboardingCharacteristics_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCharacteristics()
    }
}
