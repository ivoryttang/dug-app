//
//  HomeScreen.swift
//  Dug
//
//  Created by Ivory Tang on 2/3/24.
//

import SwiftUI

struct HomeScreen: View {
    @State private var signedIn = false
    
    func signIn(){
        signedIn = true
    }
    var body: some View {
        if signedIn {
            Voices()
        }else{
            ZStack{
                BubbleBackground().ignoresSafeArea()
                VStack(alignment: .center){
                    Text("Dug").font(.largeTitle).fontWeight(.bold)
                    Text("Give your furry friend a voice")
                    Button(action: signIn) {
                        Text("Sign In")
                    }
                }
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        HomeScreen()
        }
    }
}
