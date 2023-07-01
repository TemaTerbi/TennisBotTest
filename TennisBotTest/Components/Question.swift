//
//  Question.swift
//  TennisBotTest
//
//  Created by Артем Соловьев on 01.07.2023.
//

import SwiftUI

struct Question: View {
    
    @State var selectedItem: ChoseeModel?
    @State var buttonArray: [ChoseeModel]
    @State var name: String = "Игра у сетки"
    var vm: MainViewModel
    
    var body: some View {
        VStack {
            Text(name)
                .font(.system(size: 26))
                .bold()
                .padding(.bottom, 25)
            ForEach(buttonArray.indices, id: \.self) { index in
                ChoseButton(model: buttonArray[index], selectedItem: $selectedItem) {
                    selectedItem = buttonArray[index]
                    vm.indexSelectedButton = index
                }
                .padding(.bottom, 16)
            }
        }
        .padding(.horizontal, 16)
    }
}

struct Question_Previews: PreviewProvider {
    static var previews: some View {
        Question(buttonArray: [ChoseeModel(name: "Да", check: false), ChoseeModel(name: "Нет", check: false)], vm: MainViewModel())
    }
}
