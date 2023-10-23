//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Sameer Ghauri on 19/09/2023.
//

import SwiftUI

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    
    @State var userFirstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @State var userLastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State var userEmail = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @State var userPhoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""

    @State private var disableTextField = true
    @State var checkOrderStatus = UserDefaults.standard.bool(forKey: kOrderStatus)
    @State var checkPasswordChange = UserDefaults.standard.bool(forKey: kPasswordChange)
    @State var checkSpecialOffer = UserDefaults.standard.bool(forKey: kSpecialOffer)
    @State var checkNewsletter = UserDefaults.standard.bool(forKey: kNewsletter)
    @State var userIsLoggedOut = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            NavigationStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 380, height: 710)
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading){
                        
                        VStack(alignment: .leading){
                            Text("Personal information")
                                .font(.custom("Karla-Bold", size: 24))
                                .padding(.bottom,10)
                                .padding(.leading,10)
                            
                            Text("Avatar")
                                .font(.headline)
                                .foregroundColor(.HighlightColor2)
                                .padding(.leading,10)
                            
                            //Profile and buttons
                            HStack{
                                Image("Profile-image-placeholder")
                                    .resizable().frame(width: 90,height: 90,alignment: .leading)
                                    .padding(.leading,10)
                                    .clipShape(Circle())
                                
                                Button(action: {}, label:{ Text("Change")})
                                    .buttonStyle(ChangeButton())
                                
                                Button(action: {}, label:{ Text("Remove")})
                                    .buttonStyle(RemoveButton())
                            }
                        }.padding(10)
                        
                        //Forms Details
                        VStack(alignment: .leading){
                            Text("First name")
                            .foregroundColor(.HighlightColor2)
                            TextField("",text: $userFirstName)
                                .textFieldStyle(InputField())
                                .disabled(disableTextField)

                            Text("Last name")
                                .padding(.top,20)
                                .foregroundColor(.HighlightColor2)
                            //Text(userLastName ?? "")
                            TextField("",text: $userLastName)
                                .textFieldStyle(InputField())
                                .disabled(disableTextField)
                            
                            Text("Email")
                                .padding(.top,20)
                                .foregroundColor(.HighlightColor2)
                            TextField("",text: $userEmail)
                                .textFieldStyle(InputField())
                                .disabled(disableTextField)
                            
                            Text("Phone number")
                                .padding(.top,20)
                                .foregroundColor(.HighlightColor2)
                            //Text(userLastName ?? "")
                            TextField("",text: $userPhoneNumber)
                                .textFieldStyle(InputField())

                        }.padding([.leading,.trailing],20)
                        
                        //Email notifications
                        
                        VStack(alignment: .leading){
                            Text("Email notifications")
                                //.font(.SectionTitle())
                                .font(.custom("Karla-Bold", size: 24))
                                .padding([.top,.bottom],10)
                            
                            Toggle(isOn: $checkOrderStatus) { Text("Order statuses") }
                                .toggleStyle(ChecboxButton())
                            
                            Toggle(isOn: $checkPasswordChange) { Text("Password changes")}
                                .toggleStyle(ChecboxButton())
                            
                            Toggle(isOn: $checkSpecialOffer) { Text("Special offers") }
                                .toggleStyle(ChecboxButton())
                            
                            Toggle(isOn: $checkNewsletter) { Text("Newsletter") }
                                .toggleStyle(ChecboxButton())
                        }
                            .padding(20)
                        
                        //Logout and changes save button
                        VStack{
                            Button (action:
                                        {
                                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                                UserDefaults.standard.set("", forKey: kFirstName)
                                UserDefaults.standard.set("", forKey: kLastName)
                                UserDefaults.standard.set("", forKey: kEmail)
                                UserDefaults.standard.set("", forKey: kPhoneNumber)
                                UserDefaults.standard.set(false, forKey: kOrderStatus)
                                UserDefaults.standard.set(false, forKey: kPasswordChange)
                                UserDefaults.standard.set(false, forKey: kSpecialOffer)
                                UserDefaults.standard.set(false, forKey: kNewsletter)
                                userIsLoggedOut = true
                                self.presentation.wrappedValue.dismiss()
                                
                            }, label: {
                                Text("Log out")
                                    .bold()
                            })
                            .buttonStyle(YellowButton())
                            .padding(.bottom,10)
                            
                            HStack(alignment: .center){
                                Button(action:
                                        {self.presentation.wrappedValue.dismiss()},
                                       label:{ Text("Discard changes")})
                                    .buttonStyle(DiscardChangesButton())
                                
                                Button(action:
                                        {
                                    UserDefaults.standard.set(checkOrderStatus, forKey: kOrderStatus)
                                    UserDefaults.standard.set(checkPasswordChange, forKey: kPasswordChange)
                                    UserDefaults.standard.set(checkSpecialOffer, forKey: kSpecialOffer)
                                    UserDefaults.standard.set(checkNewsletter, forKey: kNewsletter)
                                    UserDefaults.standard.set(userPhoneNumber, forKey: kPhoneNumber)
                                    self.presentation.wrappedValue.dismiss()
                                }, label:{ Text("Save changes")})
                                    .buttonStyle(SaveChangesButton())
                            }
                        }//logout VStack
                    }//page VStack
                }//ZStack
                .padding(20)
                .navigationDestination(isPresented: $userIsLoggedOut){
                    OnboardingFirst()
                }
            }//NavigationStack
        }//Scrollview
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar(){
            ToolbarItem(placement: .navigationBarLeading){
                Button (action: { self.presentation.wrappedValue.dismiss()},
                         label: { Image("Back Button") })
                .buttonStyle(BackButton())}
            
            ToolbarItem(placement: .principal){
                VStack{ Image("LittleLemonLogo")}}
            
            ToolbarItem(placement: .navigationBarTrailing){
                Image("Profile-image-placeholder").resizable().frame(width: 50,height: 50)
                    .clipShape(Circle())}
        }//Toolbar
    }//body
}//Struct

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}

