//
//  HomeScreen.swift
//  Dug
//
//  Created by Ivory Tang on 2/3/24.
//

import SwiftUI

struct HomeScreen: View {
    @State private var login = false
    @State private var signUp = false
    
    func setSignUp(){
        signUp = true
    }
    func setLogin(){
        login = true
    }
    
    var body: some View {
        if login {
            Login()
        } else if signUp {
            SignUp()
        }else{
            ZStack{
                BubbleBackground().ignoresSafeArea()
                VStack(alignment: .center){
                    Text("Hi Dug").font(.largeTitle).fontWeight(.bold).foregroundColor(.white)
                    Text("Talk to your furry friend").font(.subheadline).foregroundColor(.white).italic()
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .cornerRadius(200.0)
                        .padding()
                    Button(action: setLogin) {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .maximum(80, 350))
                            .background(Color("bubbles-background"))
                            .cornerRadius(20.0)
                    }.padding()
                    Button(action: setSignUp) {
                        Text("Sign Up")
                            .foregroundColor(Color("bubbles-background"))
                            .padding()
                            .frame(maxWidth: .maximum(80, 350))
                            .background(Color.white)
                            .cornerRadius(20.0)
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
