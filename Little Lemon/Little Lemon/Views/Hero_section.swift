
import SwiftUI

struct Hero_section: View {
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading){
                
                Text("Little Lemon")
                    .font(.DisplayTitle())
                    .frame(alignment: .leading)
                    .padding(.bottom,-20)
                    .foregroundColor(.PrimaryColor2)
                
                HStack{
                    VStack(alignment: .leading){
                        
                        Text("Chicago")
                            .font(.SubTitle())
                            .frame(alignment: .leading)
                            .foregroundColor(.white)
                            .padding(.top,-20)
                        
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .font(.LeadText())
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundColor(.white)
                            .padding(.top,-30)
                    }
                    
                    Image("Hero image")
                        .resizable()
                        .frame(maxWidth: 130 ,maxHeight: 140)
                        .scaledToFill()
                        .cornerRadius(16)
                        .padding(.top,20)
                }
            }//VStack
            .padding([.leading,.trailing],20)
            .padding(.bottom,20)
            .background(Color("PrimaryColor1"))
        }//HStack
    }//body
}//struct

struct Hero_section_Previews: PreviewProvider {
    static var previews: some View {
        Hero_section()
    }
}
