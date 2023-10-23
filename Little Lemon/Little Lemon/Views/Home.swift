//
//  Home.swift
//  Little Lemon
//
//  Created by Sameer Ghauri on 19/09/2023.
//

import Foundation
import SwiftUI
import CoreData

struct Home: View {
    
    let persistence = PersistenceController.shared
    
    @State var showUserProfile : Bool = false
    @State var searchText = ""
    
    var body: some View {
        
        NavigationStack{
            VStack(alignment: .leading){
                VStack(){
                    Header_section(enableBackButton: false)
                        .padding(.bottom,-30)
                    
                    VStack(alignment: .leading){
                        Hero_section()
                            .frame(alignment: .topLeading)
                            .padding(.bottom,-10)
                    }
                }
                Menu()
                    .environment(\.managedObjectContext, persistence.container.viewContext)
            }
        }//Navigation
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }//body
}//struct

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
