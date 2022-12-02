
import Foundation
import AVFoundation
import FirebaseFirestoreSwift

struct Recipe: Identifiable, Codable{
    
    @DocumentID var id: String?
    
    var name: String = ""
    var image: String = ""
    var description: String = ""
    var ingredients: String = ""
    var directions: String = ""
    var category: String = ""
    var datePublished: String = ""
    var url: String = ""
    
    init(){
        
    }
    
    init(name:String, image:String, description:String, ingredients:String, directions:String, category:String,  datePublished:String, url:String){
        self.name = name
        self.image = image
        self.description = description
        self.ingredients = ingredients
        self.directions = directions
        self.category = category
        self.datePublished = datePublished
        self.url = url
    }
}


//create enum to enumerate all the preset meal course
enum Category: String, CaseIterable, Identifiable{
    var id: String { self.rawValue }
    
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
    
}
