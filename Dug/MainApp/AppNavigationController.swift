//
//  AppNavigationController.swift
//  Dug
//
//  Created by Ivory Tang on 2/7/24.
//

import SwiftUI

struct AppNavigationController: View {
    var body: some View {
        
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
    }
}

struct AppNavigationController_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigationController()
    }
}
