//
//  RecipeApp_Version3App.swift
//  RecipeApp-Version3
//
//  Created by macuser on 2022-12-02.
//

import SwiftUI
import Firebase

@main
struct RecipeApp_Version3App: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AddRecipeView()
        }
    }
}
