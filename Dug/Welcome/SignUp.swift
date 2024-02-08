import SwiftUI

struct SignUp: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirm_password: String = ""
    
    @State private var login = false
    @State private var signUp = false
    
    func setSignUp(){
        signUp = true
    }
    func setLogin(){
        login = true
    }
    
    var body: some View {
        if signUp {
            HomeScreen()
        } else if login {
            Login()
        }
        else{
            VStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                Text("Sign Up").font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .cornerRadius(10)
                
                TextField("Email", text: $username)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                SecureField("Confirm Password", text: $confirm_password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                Button(action: setSignUp) {
                    Text("Create Account")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("bubbles-background"))
                        .cornerRadius(10.0)
                }
                Button(action: setLogin) {
                    Text("Already have an account?")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding()
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
