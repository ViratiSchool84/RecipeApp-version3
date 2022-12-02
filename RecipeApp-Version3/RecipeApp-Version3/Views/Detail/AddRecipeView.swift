
import SwiftUI

struct AddRecipeView: View {    
    @StateObject var viewModel = RecipeViewModel()
    
    
    @State var name = ""
    @State var image = ""
    @State var description = ""
    @State var ingredients = ""
    @State var directions = ""
    @State var selectedCategory = ""
    @State var datePublished = ""
    @State var url = ""
    

    @State private var navigateToRecipe = false
    
    var body: some View {
        
        VStack {
            List(viewModel.recipesList) { item in
                HStack {
                    Text(item.name)
                    Text(item.description)
                    
                    Spacer()
                    
                    Button(action: {
                        name = item.name
                        description = item.description
                        viewModel.toBeUpdatedRecipe = item
                    }, label: {
                        Image(systemName: "pencil")
                    })
                    .buttonStyle(BorderedButtonStyle())
                    
                    Button(action: {
                        viewModel.deleteRecipe(recipe: item)
                    }, label: {
                        Image(systemName: "trash")
                    })
                    .buttonStyle(BorderedButtonStyle())
                }
                
            }
        
        
        Divider()
        VStack(spacing: 5){
            TextField("Enter a name", text: $name)
                .accessibilityIdentifier("EnterATitleTextField")
            TextField("Enter a description", text: $description)
                .accessibilityIdentifier("EnterADescriptionTextField")
            
            Button( action: {
          
                viewModel.addRecipe(name:name, image:image, description: description, ingredients:ingredients, directions:directions, category: selectedCategory, datePublished:datePublished, url:url)
                name = ""
                image = ""
                description = ""
                ingredients = ""
                directions = ""
                selectedCategory = ""
                datePublished = ""
                url = ""
            }, label: {
                Text("Add Recipe")
                    .accessibilityIdentifier("EnterARecipeTextField")
            })
            
            Button( action: {
                viewModel.toBeUpdatedRecipe.name = name
                viewModel.toBeUpdatedRecipe.image = image
                viewModel.toBeUpdatedRecipe.description = description
                viewModel.toBeUpdatedRecipe.ingredients = ingredients
                viewModel.toBeUpdatedRecipe.directions = directions
                viewModel.toBeUpdatedRecipe.category = selectedCategory
                viewModel.toBeUpdatedRecipe.datePublished = datePublished
                viewModel.toBeUpdatedRecipe.url = url
            
                viewModel.updateRecipe()
                
                image = ""
                description = ""
                ingredients = ""
                directions = ""
                selectedCategory = ""
                datePublished = ""
                url = ""
                
            }, label: {
                Text("Update Recipe")
            })
            .buttonStyle(BorderedButtonStyle())
                .accessibilityIdentifier("update")
        }
    }
    }
}
struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
