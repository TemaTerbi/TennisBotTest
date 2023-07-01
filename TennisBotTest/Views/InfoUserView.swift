//
//  InfoUserView.swift
//  TennisBotTest
//
//  Created by Артем Соловьев on 30.06.2023.
//

import SwiftUI

struct InfoUserView: View {
    
    @StateObject private var viewModel: MainViewModel = MainViewModel()
    @State private var goNext: Bool? = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink(tag: true, selection: $goNext) {
                    QuestionsView()
                } label: {
                    EmptyView()
                }
                
                VStack {
                    HStack {
                        Text("Расскажи о себе")
                            .foregroundColor(.black)
                            .bold()
                            .font(.system(size: 30))
                        
                        Spacer()
                    }
                    
                    VStack(spacing: 16) {
                        CustomTextField(placeHolder: "Имя") { value in
                            viewModel.nameUser = value
                        }
                        
                        CustomTextField(placeHolder: "Фамилия") { value in
                            viewModel.lastNameUser = value
                        }
                    }
                }
                .padding(.top, 50)
                
                Spacer()
                
                CustomButton(textButton: "Продолжить") {
                    goNext = true
                    viewModel.getToken()
                }
            }
            .padding(.horizontal, 16)
        }
        .environmentObject(viewModel)
    }
}

struct InfoUserView_Previews: PreviewProvider {
    static var previews: some View {
        InfoUserView()
    }
}
