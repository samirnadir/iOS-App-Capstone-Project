
import SwiftUI

struct OnboardingSecond: View {
    
    @Environment(\.presentationMode) var presentation
    @StateObject private var viewModel = ViewModel()
    @State var lastName: String = ""
    @State var isLastNameCorrect = false
    
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
                                
                                Text ("Enter your Last Name")
                                    .padding(20)
                                    .font(.custom("MarkaziText-Medium", size: 42))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.PrimaryColor1)
                                
                                VStack(alignment: .leading){
                                    
                                    Text("Last Name *")
                                        .font(.title3)
                                        .font(.OnboardingText())
                                        .foregroundColor(.gray)
                                        .padding(.bottom,4)
                                    
                                    TextField("Last Name", text: $lastName)
                                        .padding(.bottom,8)
                                    
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
                                    if (viewModel.validateForm(lastName: lastName)){
                                        UserDefaults.standard.set(lastName, forKey: kLastName)
                                        isLastNameCorrect = true
                                        return
                                    }//if
                                    
                                }, label: {Text("Next")
                                        .bold()
                                })//button
                                .buttonStyle(YellowSmallButton())
                            }
                        }//ScrollViewInside
                    }//VStack
                }
            }//ScrollView
        }//NavigationView
        .navigationDestination(isPresented: $isLastNameCorrect){
            OnboardingLast()
        }
        .navigationBarBackButtonHidden(true)
        .alert("ERROR", isPresented: $viewModel.showFormInvalidMessage, actions: {
            Button("OK", role: .cancel) { }
        }, message: {
            Text(viewModel.errorMessage)
        })
    }//Body
}//Struct
