import SwiftUI
import Supabase

struct Login: View {
    let supabase = SupabaseClient(supabaseURL: URL(string: "https://cchxhrhiyjeuiqqkreaq.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNjaHhocmhpeWpldWlxcWtyZWFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc4NDk0MjQsImV4cCI6MjAyMzQyNTQyNH0.QjybPhjRB57dEQmbihopl7R_vTn2rNYUqZzcYUqOAL8")

    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var signUp = false
    @AppStorage("loggedIn") var loggedIn: Bool = false
    @AppStorage("onboard") var onboard: Bool = true
    @State var isLoading = false
    @State var result: Result<Void, Error>?
    
    func setLoggedIn(){
        Task {
            isLoading = true
            defer { isLoading = false }
            
            do {
                try await supabase.auth.signIn(
                    email: email,
                    password: password
                )
                result = .success(())
                
                let currentUser = try await supabase.auth.session.user
                
                do {
                    let petResult = try await supabase.database
                        .from("pet_profiles")
                        .select()
                        .eq("owner", value: currentUser.id)
                        .single()
                        .execute()
                    onboard = false
                }catch{
                    onboard = true
                }
                
                
                loggedIn = true
            } catch {
                result = .failure(error)
            }
        }
    }
    
    var body: some View {
        
        if signUp{
            SignUp()
        } 
        else if onboard && loggedIn {
            OnboardingController()
        }
        else if loggedIn{
            AppNavigationController()
        }
        else{
            Form {
                VStack{
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    Text("Login").font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                        .cornerRadius(10)
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                    Text("Sign In")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("bubbles-background"))
                        .cornerRadius(10.0)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            setLoggedIn()
                        }
                    
                    if let result {
                        Section {
                            switch result {
                            case .success:
                                Text("success")
                            case .failure(let error):
                                Text(error.localizedDescription).foregroundStyle(.red)
                            }
                        }
                    }
                    Text("Don't have an account? Sign Up")
                        .foregroundColor(.black)
                        .onTapGesture {
                            signUp.toggle()
                        }
                }
                .padding()
            }
        }
    }
}

struct PetProfile: Encodable, Decodable {
    let name: String?
    let age: Int?
    let gender: String?
    let breed: String?
    let characteristics: String?
    let owner: UUID?
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
