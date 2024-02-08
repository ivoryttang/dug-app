import SwiftUI

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var loggedIn = false
    @State private var signUp = false
    
    func setSignUp(){
        signUp = true
    }
    func setLoggedIn(){
        loggedIn = true
    }
    
    var body: some View {
        if loggedIn {
            OnboardingController()
        }
        else if signUp{
            SignUp()
        }
        else{
            VStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                Text("Login").font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .cornerRadius(10)
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
                
                Button(action: setLoggedIn) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("bubbles-background"))
                        .cornerRadius(10.0)
                }
                Button(action: setSignUp) {
                    Text("Don't have an account? Sign Up")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
