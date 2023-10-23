
let kOrderStatus : String = "key for orderStatus"
let kPasswordChange : String = "key for password Change"
let kSpecialOffer : String = "key for special Offer"
let kNewsletter: String = "key for newsletter"


import SwiftUI



struct OnboardingLast: View {
    
    @State var isLoggedIn = false
    @Environment(\.presentationMode) var presentation
    @StateObject private var viewModel = ViewModel()
    
    @State var email: String = ""
    @State var phoneNumber: String = ""
    
    @State var orderStatus = true
    @State var passwordChange = true
    @State var specialOffer = true
    @State var newsletter = true
    @State var isEmailCorrect = false
    
    
    var body: some View {
        
        @State var isLogged = isLoggedIn
        
        NavigationStack(){
            ScrollView(.vertical){
                HStack(alignment: .top){
                    VStack{
                        Header_section(enableBackButton: false)
                            .frame(maxHeight: 50,alignment: .top)
                            .padding(.bottom,-30)
                        Hero_section()
                            .frame(alignment: .top)
                        
                        ScrollView(.vertical,showsIndicators: false)
                        {
                            VStack(){
                                
                                Text ("Enter your Email")
                                    .padding(20)
                                    .font(.custom("MarkaziText-Medium", size: 42))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.PrimaryColor1)
                                
                                VStack(alignment: .leading){
                                    
                                    Text("Email *")
                                        .font(.OnboardingText())
                                        .foregroundColor(.gray)
                                        .padding(.bottom,4)
                                    
                                    TextField("Email", text: $email)
                                        .padding(.bottom,8)
                                        .keyboardType(.emailAddress)
                                        .textContentType(.emailAddress)
                                        .disableAutocorrection(true)
                                        .autocapitalization(.none)
                                    
                                }
                                .textFieldStyle(InputField())
                                Spacer()
                            }
                            .padding()
                            Spacer()
                            
                            HStack(alignment: .center){
                                
                                Button(action:
                                        {self.presentation.wrappedValue.dismiss()},
                                       label: {
                                    Text("Back").bold()
                                }).buttonStyle(YellowSmallButton())
                                
                                Button(action: {
                                    if (viewModel.validateForm(email: email)){
                                        
                                        UserDefaults.standard.set(email, forKey: kEmail)
                                        UserDefaults.standard.set(orderStatus, forKey: kOrderStatus)
                                        UserDefaults.standard.set(passwordChange, forKey: kPasswordChange)
                                        UserDefaults.standard.set(specialOffer, forKey: kSpecialOffer)
                                        UserDefaults.standard.set(newsletter, forKey: kNewsletter)
                                        isEmailCorrect = true
                                        isLoggedIn = true
                                        UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
                                    }//if
                                    
                                }, label: {Text("Register")
                                        .bold()
                                })//button
                                .buttonStyle(YellowSmallButton())
                                
                            }
                        }//ScrollViewInside
                    }//VStack
                }
            }//ScrollView
            .navigationDestination(isPresented: $isLoggedIn){
                Home()
            }
        }//NavigationView
        .navigationBarBackButtonHidden(true)
        
        //Error Message showing
        .alert("ERROR", isPresented: $viewModel.showFormInvalidMessage, actions: {
            Button("OK", role: .cancel) { }
        }, message: {
            Text(viewModel.errorMessage)
        })
    }//Body
}//Struct


struct OnboardingLast_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingLast()
    }
}

