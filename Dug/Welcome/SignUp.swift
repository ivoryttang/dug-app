import SwiftUI
import Supabase


struct SignUp: View {
    
    func setLogin(){
        login = true
    }
    let supabase = SupabaseClient(supabaseURL: URL(string: "https://cchxhrhiyjeuiqqkreaq.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNjaHhocmhpeWpldWlxcWtyZWFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc4NDk0MjQsImV4cCI6MjAyMzQyNTQyNH0.QjybPhjRB57dEQmbihopl7R_vTn2rNYUqZzcYUqOAL8")
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    @State var result: Result<Void, Error>?
    @State private var login = false
    
    
    var body: some View {
        if login {
            Login()
        } else {
            Form {
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
                    TextField("Email", text: $email)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    
                    Text("Create Account")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("bubbles-background"))
                        .cornerRadius(10.0)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            signUpButtonTapped()
                        }
                    Text("Already have an account?")
                        .foregroundColor(.black)
                        .onTapGesture {
                            setLogin()
                        }
                        .padding()
                }
                }
            
                if isLoading {
                    ProgressView()
                }
                
                
                if let result {
                    Section {
                        switch result {
                        case .success:
                            Text("Check your inbox.")
                        case .failure(let error):
                            Text(error.localizedDescription).foregroundStyle(.red)
                        }
                    }
                }
            }
        }
    
    
    func signUpButtonTapped() {
        Task {
            isLoading = true
            defer { isLoading = false }
            
            do {
                try await supabase.auth.signUp(
                    email: email,
                    password: password
                )
                result = .success(())
            } catch {
                result = .failure(error)
            }
        }
    }
}
//
//struct SignUp: View {
//    @State private var username: String = ""
//    @State private var password: String = ""
//    @State private var confirm_password: String = ""
//    
//    @State private var login = false
//    @State private var signUp = false
//    
//    func setSignUp(){
//        signUp = true
//    }
//    func setLogin(){
//        login = true
//    }
//    
//    
//    
//    var body: some View {
//        if signUp {
//            HomeScreen()
//        } else if login {
//            Login()
//        }
//        else{
//            VStack {
//                Image("Logo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 200, height: 200)
//                Text("Sign Up").font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//                    .padding()
//                    .cornerRadius(10)
//                
//                TextField("Email", text: $username)
//                    .padding()
//                    .background(Color(.secondarySystemBackground))
//                    .cornerRadius(5.0)
//                    .padding(.bottom, 20)
//                
//                TextField("Username", text: $username)
//                    .padding()
//                    .background(Color(.secondarySystemBackground))
//                    .cornerRadius(5.0)
//                    .padding(.bottom, 20)
//                
//                SecureField("Password", text: $password)
//                    .padding()
//                    .background(Color(.secondarySystemBackground))
//                    .cornerRadius(5.0)
//                    .padding(.bottom, 20)
//                
//                SecureField("Confirm Password", text: $confirm_password)
//                    .padding()
//                    .background(Color(.secondarySystemBackground))
//                    .cornerRadius(5.0)
//                    .padding(.bottom, 20)
//                
//                Button(action: setSignUp) {
//                    Text("Create Account")
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color("bubbles-background"))
//                        .cornerRadius(10.0)
//                }
//                Button(action: setLogin) {
//                    Text("Already have an account?")
//                        .foregroundColor(.black)
//                        .frame(maxWidth: .infinity)
//                }
//            }
//            .padding()
//        }
//    }
//}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
