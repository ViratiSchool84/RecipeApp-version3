//
//  RecipeViewModel.swift
//  RecipeSaver
//
//  Created by Brandon on 2022-11-30.
//

import Foundation
import Combine

class RecipeViewModel: ObservableObject {
    @Published var recipesList  = [Recipe]()
    @Published var recipeRepository = RecipeRepository.shared
    @Published var toBeUpdatedRecipe = Recipe()
    
    private var cancellables: Set<AnyCancellable> = []
    
    //where you get data from database usually
    init (){
        self.recipeRepository.$list
            .assign(to: \.recipesList, on: self)
            .store(in: &cancellables)
    }
    
    func addRecipe(name: String, image: String, description: String, ingredients: String, directions: String, category: String, datePublished: String, url: String){
        let recipe = Recipe(name: name, image: image, description: description, ingredients: ingredients, directions: directions, category: category, datePublished: datePublished, url: url)
        self.recipeRepository.add(recipe)

    }
    
    func deleteRecipe(recipe: Recipe){
        self.recipeRepository.delete(recipe)
    }
    
    func updateRecipe(){
        self.recipeRepository.update(toBeUpdatedRecipe)
    }
    
}
