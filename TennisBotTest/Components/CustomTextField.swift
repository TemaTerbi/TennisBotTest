//
//  CustomTextField.swift
//  TennisBotTest
//
//  Created by Артем Соловьев on 01.07.2023.
//

import SwiftUI

struct CustomTextField: View {
    
    @State var textFieldText = ""
    @State var placeHolder = ""
    var someFunc: (String) -> ()
    
    var body: some View {
        HStack {
            TextField(placeHolder, text: $textFieldText)
                .onChange(of: textFieldText, perform: { oldValue in
                    someFunc(oldValue)
                })
                .padding(.horizontal, 15)
                .frame(height: 50)
                .foregroundColor(.black)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 3)
                }
        }
        .background(Color.white)
        .frame(width: .infinity, height: 48)
        .cornerRadius(15)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(textFieldText: "test", placeHolder: "Test", someFunc: { value in
            
        })
    }
}
