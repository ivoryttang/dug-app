import SwiftUI
import Storage
import _PhotosUI_SwiftUI

struct EditProfile: View {
    @State private var username = ""
    @State private var fullname = ""
    @State private var email = ""
    @State private var imageSelection: PhotosPickerItem?
    @State private var avatarImage: AvatarImage?
    @State private var isLoading = false
    @AppStorage("onboard") var onboard: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack(alignment: .leading) {
                        if let avatarImage = avatarImage {
                            avatarImage.image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                        } else {
                            Color.clear
                                .frame(width: 80, height: 80)
                        }
                        
                        PhotosPicker(selection: $imageSelection, matching: .images) {
                            Image(systemName: "pencil.circle.fill")
                                .symbolRenderingMode(.multicolor)
                                .font(.system(size: 30))
                                .foregroundColor(.accentColor)
                        }
                    }
                }
                
                Section {
                    TextField("Username", text: $username)
                        .textContentType(.username)
                        .disableAutocorrection(true)
                    
                    TextField("Full name", text: $fullname)
                        .textContentType(.name)
                    
                    TextField("Email", text: $email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                }
                
                Section {
                    Button("Update profile") {
//                        updateProfileButtonTapped()
                    }
                    
                    if isLoading {
                        ProgressView()
                    }
                }
                
                NavigationLink(destination:OnboardingController()){
                    Text("Edit Pet Profile")
                }.navigationBarBackButtonHidden(true).onAppear(perform: {onboard = false})
            }
            .navigationTitle("Edit Profile")
            .navigationBarBackButtonHidden(true)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button("Sign out") {
//                        Task {
//                            try? await supabase.auth.signOut()
//                        }
//                    }
//                }
//            }
        }
        .task {
            await getInitialProfile()
        }
    }
    
    private func loadTransferable(from imageSelection: PhotosPickerItem) {
        Task {
            do {
                avatarImage = try await imageSelection.loadTransferable(type: AvatarImage.self)
            } catch {
                debugPrint(error)
            }
        }
    }
    
    private func downloadImage(path: String) async {
        do {
            let data = try await supabase.storage.from("avatars").download(path: path)
            avatarImage = AvatarImage(data: data)
        } catch {
            debugPrint(error)
        }
    }
    
    private func uploadImage() async throws -> String? {
        guard let data = avatarImage?.data else { return nil }
        
        let filePath = "\(UUID().uuidString).jpeg"
        
        try await supabase.storage
            .from("avatars")
            .upload(
                path: filePath,
                file: data,
                options: FileOptions(contentType: "image/jpeg")
            )
        
        return filePath
    }
    
    private func getInitialProfile() async {
        do {
            let currentUser = try await supabase.auth.session.user
            
            let profile: ProfileElements? = try await supabase.database
                .from("profiles")
                .select()
                .eq("id", value: currentUser.id)
                .single()
                .execute()
                .value
            
            if let profile = profile {
                username = profile.username ?? ""
                fullname = profile.fullname ?? ""
                email = profile.email ?? ""
            }
        } catch {
            debugPrint(error)
        }
    }
    
//    private func updateProfileButtonTapped() {
//        Task{
//            isLoading = true
//            defer { isLoading = false }
//            do {
//                let currentUser = try await supabase.auth.session.user
//                
//                try await supabase.database
//                    .from("profiles")
//                    .update(
//                        ProfileElements(
//                            username: username,
//                            fullname: fullname,
//                            email: email,
//                            avatarURL: avatarImage?.image
//                        )
//                    )
//                    .eq("id", value: currentUser.id)
//                    .execute()
//            } catch {
//                debugPrint(error)
//            }
//        }
//        
//    }
}

struct ProfileElements: Decodable {
//    let id: UUID
    let username: String?
    let fullname: String?
    let email: String?
//    let avatarURL: String?
//    let pets: Array<String>
        
    enum CodingKeys: String, CodingKey {
//        case id
        case fullname
        case username
        case email
//        case avatarURL
//        case pets
      }
}

struct AvatarImage: Transferable, Equatable {
  let image: Image
  let data: Data

  static var transferRepresentation: some TransferRepresentation {
    DataRepresentation(importedContentType: .image) { data in
      guard let image = AvatarImage(data: data) else {
        throw TransferError.importFailed
      }

      return image
    }
  }
}

extension AvatarImage {
  init?(data: Data) {
    guard let uiImage = UIImage(data: data) else {
      return nil
    }

    let image = Image(uiImage: uiImage)
    self.init(image: image, data: data)
  }
}

enum TransferError: Error {
    case importFailed
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
