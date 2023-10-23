
import SwiftUI

let kFirstName : String = "key for First"
let kLastName : String = "key for last"
let kEmail : String = "key for email"
let kPhoneNumber: String = "key for phone number"
let kIsLoggedIn: String = "key for logged in"

struct OnboardingFirst: View {
    @State var initialCheckIsLoggedIn = false
    @State var firstName: String = ""
    @State var isFirstNameCorrect = false
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
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
                                Text("Welcome")
                                    .padding(.top,10)
                                    .font(.custom("MarkaziText-Medium", size: 42))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.PrimaryColor1)
                                
                                Text ("Enter your First Name")
                                    .padding(.bottom,20)
                                    .font(.custom("MarkaziText-Medium", size: 42))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.PrimaryColor1)
                                
                                VStack(alignment: .leading){
                                    Text("First Name *")
                                        .font(.OnboardingText())
                                        .foregroundColor(.gray)
                                        .padding(.bottom,4)
                                    
                                    TextField("First Name", text: $firstName)
                                        .padding(.bottom,8)
                                    
                                }
                                .textFieldStyle(InputField())
                                Spacer()
                            }.padding()
                            Spacer()
                            
                            Button(action: {
                                
                                if (viewModel.validateForm(firstName: firstName)){
                                    
                                    UserDefaults.standard.set(firstName, forKey: kFirstName)
                                    isFirstNameCorrect = true
                                    
                                }//if
                                else{
                                    isFirstNameCorrect = false
                                }
                                
                            }, label: {Text("Next")
                                    .bold()
                            })//button
                            .buttonStyle(YellowButton())
                            
                        }//ScrollViewInside
                    }//VStack
                }
            }//ScrollView
            .navigationDestination(isPresented: $initialCheckIsLoggedIn){
                Home()
            }
            .navigationDestination(isPresented: $isFirstNameCorrect){
                OnboardingSecond()
            }
            
        }//NavigationView
        .navigationBarBackButtonHidden(true)
        .onAppear(){
            if ((UserDefaults.standard.bool(forKey: kIsLoggedIn) == true)){
                initialCheckIsLoggedIn = true
                print("onAppear")
            }else {
                initialCheckIsLoggedIn = false
                isFirstNameCorrect = false
                print("Else OnAppear")
            }
        }//onAppear
        .alert("ERROR", isPresented: $viewModel.showFormInvalidMessage, actions: {
            Button("OK", role: .cancel) { }
        }, message: {
            Text(viewModel.errorMessage)
        })//Alert
        
    }//Body
}//Struct
