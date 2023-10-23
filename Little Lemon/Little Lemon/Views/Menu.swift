//
//  Menu.swift
//  Little Lemon
//
//  Created by Sameer Ghauri on 19/09/2023.
//

import SwiftUI

let checkIsLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn) == true
var menuItems = [MenuItem] ()

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    
    var categories = ["Starters", "Mains","Desserts", "Drinks"]
    @State var searchText = ""
    @State var isListAdded = false
    
    @State var isStartersOptionOn = false
    @State var isDessertsOptionOn = false
    @State var isDrinksOptionOn = false
    @State var isMainsOptionOn = false
    @State var categoryEnable: String = ""
    
    init() {
        UITextField.appearance().clearButtonMode = .whileEditing
    }
    
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading){
                
                //Search bar
                TextField("Search menu", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .cornerRadius(10)
                    .padding(10)
                    .padding(.bottom,10)
                    .background(Color("PrimaryColor1"))
                
                
                //Category Section
                
                Text("ORDER FOR DELIVERY!")
                    .font(.SectionTitle())
                
                    .padding([.vertical],20)
                    .padding(.horizontal,20)
                    .foregroundColor(.black)
                
                ScrollView (.horizontal,showsIndicators: false) {
                    HStack {
                        
                        //1
                        Toggle(isOn: $isStartersOptionOn){
                            Text("\(categories[0])")
                        }
                        .toggleStyle(CategoryToggleButton())
                        .onChange(of: isStartersOptionOn) {newValue in
                            categoryCheck(newValue,1)
                        }
                        
                        //2
                        Toggle(isOn: $isMainsOptionOn){
                            Text("\(categories[1])")
                        }
                        .toggleStyle(CategoryToggleButton())
                        .onChange(of: isMainsOptionOn) {newValue in
                            categoryCheck(newValue,2)
                        }
                        
                        //3
                        Toggle(isOn: $isDessertsOptionOn){
                            Text("\(categories[2])")
                        }
                        .toggleStyle(CategoryToggleButton())
                        .onChange(of: isDessertsOptionOn) {newValue in
                            categoryCheck(newValue,3)
                        }
                        
                        //4
                        Toggle(isOn: $isDrinksOptionOn){
                            Text("\(categories[3])")
                        }
                        .toggleStyle(CategoryToggleButton())
                        .onChange(of: isDrinksOptionOn) {newValue in
                            categoryCheck(newValue,4)
                        }
                    }//HStack
                }//Scrollview
                //.font(.SectionTitle())
                .padding([.leading,.trailing],20)
                .padding(.bottom,10)
                
                Divider()
                    .padding([.leading,.trailing],20)
                
                //Menu List
                Spacer()
                FetchedObjects(predicate: buildPredicate(),sortDescriptors: buildSortDescriptors()){
                    (dishes: [Dish]) in
                    List(){
                        ForEach(dishes, id: \.self){ dish in
                            if ((dish.category == categoryEnable) || (!isStartersOptionOn && !isMainsOptionOn && !isDessertsOptionOn && !isDrinksOptionOn)){
                                
                                NavigationLink(destination: MenuItemDetail(foodList: dish) ) {
                                    FoodItems(foodList: dish)
                                }
                            }//if
                        }//forEach
                    }//List
                    .listStyle(.plain)
                    .padding(.leading,10)
                    .padding(.trailing,10)
                }//FetchObject
            }//VStack
        }//navigation
        .onAppear()
        {
            if isListAdded == false {
                getMenuData()
                isListAdded = true
            }
        }//onAppear
    }//body
    
    private func getMenuData(){
        PersistenceController.shared.clear()
        
        let littleLemonAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: littleLemonAddress)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data {
                let fullMenu = try! JSONDecoder().decode(MenuList.self, from: data)
                
                //mapping menu items into database
                
                for dish in fullMenu.menu {
                    let newDish = Dish(context: viewContext)
                    newDish.title = dish.title
                    newDish.descriptionText = dish.descriptionText
                    newDish.price = String(dish.price)
                    newDish.image = dish.image
                    newDish.category = dish.category
                }
                try? viewContext.save()}
        }//task
        task.resume()
    }//getMenuData
    
    private func buildPredicate() -> NSPredicate {
        return searchText == "" ?
        NSPredicate(value: true):
        NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }//buildPredicate
    
    private func buildSortDescriptors() -> [NSSortDescriptor] {
        return(
            [NSSortDescriptor(key: "title",
                              ascending: true,
                              selector: #selector(NSString.localizedStandardCompare))]
        )
    }//buildSort
    
    private func categoryCheck(_ newValue: Bool, _ ToggleButton: Int) {
        
        if newValue {
            switch (ToggleButton){
                
            case 1:
                isMainsOptionOn = false
                isDessertsOptionOn = false
                isDrinksOptionOn = false
                categoryEnable = "starters"
                
            case 2:
                isStartersOptionOn = false
                isDessertsOptionOn = false
                isDrinksOptionOn = false
                categoryEnable = "mains"
                
            case 3:
                isStartersOptionOn = false
                isMainsOptionOn = false
                isDrinksOptionOn = false
                categoryEnable = "desserts"
                
            case 4:
                isStartersOptionOn = false
                isMainsOptionOn = false
                isDessertsOptionOn = false
                categoryEnable = "drinks"
            default:
                categoryEnable = ""
            }
        }
    }//categoryCheck
}//struct

extension String: Identifiable {

    public var id: String {

        self

    }

}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
