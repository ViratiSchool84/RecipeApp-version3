//
//  RecipeRepository.swift
//  RecipeApp-Version3
//
//  Created by macuser on 2022-12-02.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

final class RecipeRepository : ObservableObject{
    static var shared = RecipeRepository()
    
    @Published var list: [Recipe] = []
    
    //database name = recipes
    private let path = "recipes"
    private let store = Firestore.firestore()
    
    
    init() {
        get()
    }
    
    func get(){
        store.collection(path).addSnapshotListener { snapshot, error in
            
            if let error = error {
                print(error)
                return
            }
            
            self.list = snapshot?.documents.compactMap{
                try? $0.data(as: Recipe.self)
                
            } ?? []
            
            print("In repo")
            print(self.list.count)
            
        }
    }
    
    
    
    
    
    func delete(_ recipe: Recipe){
        if let documentId = recipe.id {
            store.collection(path).document(documentId).delete() { error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    func update(_ recipe:Recipe){
        if let documentId = recipe.id{
            store.collection(path).document(documentId).setData(["name": recipe.name, "image": recipe.image, "description": recipe.description, "ingredients": recipe.ingredients, "category": recipe.category, "datePublished": recipe.datePublished, "url": recipe.url], merge: true)
        }
    }
    
    func add(_ recipe: Recipe) {
        do{
            _ = try store.collection(path).addDocument(from: recipe)
        } catch {
            print(error)
        }
    }
}
