//
//  Buttons_style.swift
//  Little Lemon
//
//  Created by Sameer Ghauri on 20/09/2023.
//

import SwiftUI

struct YellowButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 360,height: 50,alignment: .center)
            .background(Color(configuration.isPressed ? "PrimaryColor1" : "PrimaryColor2"))
            .foregroundColor(configuration.isPressed ? .white : .black)
            .cornerRadius(8)
            .padding()
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct YellowSmallButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 150,height: 50,alignment: .center)
            .background(Color(configuration.isPressed ? "PrimaryColor1" : "PrimaryColor2"))
            .foregroundColor(configuration.isPressed ? .white : .black)
            .cornerRadius(8)
            .padding()
            .bold()
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


struct BackButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 40,height: 40)
            .foregroundColor(.HighlightColor2)
            .clipShape(Circle())
        
    }
}

struct ChangeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 90,height: 50)
            .background(Color(configuration.isPressed ? "HighlightColor2": "PrimaryColor1"))
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding([.leading,.trailing],6)
            .bold()
    }
}

struct RemoveButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 90,height: 50)
            .background(Color(configuration.isPressed ? "HighlightColor1": "WhiteColor"))
            .foregroundColor(.HighlightColor2)
            .border(.black)
            .padding(.leading,2)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("HighlightColor2"), lineWidth: 1))
    }
}

struct DiscardChangesButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 150,height: 40)
            .background(Color(configuration.isPressed ? "HighlightColor1": "WhiteColor"))
            .foregroundColor(.HighlightColor2)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("HighlightColor2"), lineWidth: 1))
            .padding(.leading,-10)
    }
}

struct SaveChangesButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 140,height: 40)
            .background(Color(configuration.isPressed ? "HighlightColor2": "PrimaryColor1"))
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.leading,10)
            .bold()
    }
}

struct CategoryToggleButton: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle()},
               label: {
            configuration.label
                .padding(10)
                .foregroundColor(configuration.isOn ? .HighlightColor3 :.PrimaryColor1)
                .background(Color(configuration.isOn ? "PrimaryColor1" :"HighlightColor3"))
                .cornerRadius(16)
                .bold()
                .padding([.trailing],5)
        })
    }
}

struct ChecboxButton: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle()},
               label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .resizable()
                    .foregroundColor(.PrimaryColor1)
                    .frame(width: 25,height: 25)
                
                configuration.label
                    .foregroundColor(.PrimaryColor1)
                    .font(.custom("Karla-Regular", size: 18))
                    .padding(.leading,8)
                
            }})
        .padding(.bottom,10)
    }
}

struct InputField: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("HighlightColor2"), lineWidth: 1))
    }
}
