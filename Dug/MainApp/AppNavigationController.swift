//
//  AppNavigationController.swift
//  Dug
//
//  Created by Ivory Tang on 2/7/24.
//

import SwiftUI
import Supabase

struct AppNavigationController: View {
    @AppStorage("loggedIn") var loggedIn: Bool = true
    var body: some View {
        if loggedIn {
            NavigationView{
                TabView {
                    Discover()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    Maps()
                        .tabItem {
                            Image(systemName: "map")
                            Text("Maps")
                        }
                    Settings()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                    Profile()
                        .tabItem {
                            Image(systemName: "person.crop.square")
                            Text("Profile")
                        }
                }
            }.navigationBarBackButtonHidden(true)
        }else{
            Login()
        }
    }
}

struct AppNavigationController_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigationController()
    }
}
