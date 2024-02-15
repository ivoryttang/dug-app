//
//  AppView.swift
//  Dug
//
//  Created by Ivory Tang on 2/13/24.
//

import SwiftUI

struct AppView: View {
    @State var isAuthenticated = false
    
    var body: some View {
        Group {
            if isAuthenticated {
                Profile()
            } else {
                Login()
            }
        }
        .task {
            for await state in await supabase.auth.authStateChanges {
                if [.initialSession, .signedIn, .signedOut].contains(state.event) {
                    isAuthenticated = state.session != nil
                }
            }
        }
    }
}
