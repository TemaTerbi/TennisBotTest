//
//  ChoseButton.swift
//  TennisBotTest
//
//  Created by Артем Соловьев on 01.07.2023.
//

import SwiftUI

struct ChoseButton: View {
    
    @State var model: ChoseeModel
    @Binding var selectedItem: ChoseeModel?
    var someFunc: () -> ()
    
    var body: some View {
        HStack {
            Text(model.name)
                .font(.system(size: 16))
                .bold()
                .padding(.vertical, 12)
                .foregroundColor(model == selectedItem ? .mainGreenColor : .black)
        }
        .frame(maxWidth: .infinity)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(model == selectedItem ? .mainGreenColor : Color.gray.opacity(0.4), lineWidth: 1)
        }
        .onTapGesture {
            someFunc()
        }
        .animation(.easeIn(duration: 0.18), value: model == selectedItem)
    }
}

struct ChoseButton_Previews: PreviewProvider {
    static var previews: some View {
        ChoseButton(model: ChoseeModel(name: "Новичок", check: true), selectedItem: .constant(ChoseeModel(name: "fd", check: false)), someFunc: {})
    }
}
