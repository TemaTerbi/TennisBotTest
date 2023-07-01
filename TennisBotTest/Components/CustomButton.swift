//
//  CustomButton.swift
//  TennisBotTest
//
//  Created by Артем Соловьев on 01.07.2023.
//

import SwiftUI

struct CustomButton: View {
    
    var textButton = ""
    var someFunc: () -> ()
    
    var body: some View {
        HStack {
           Text(textButton)
                .foregroundColor(.white)
                .padding(.vertical, 18)
                .font(.system(size: 20))
                .bold()
        }
        .frame(maxWidth: .infinity)
        .background(Color.mainOrangeColor)
        .cornerRadius(15)
        .onTapGesture {
            someFunc()
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(textButton: "Далее", someFunc: {})
    }
}
