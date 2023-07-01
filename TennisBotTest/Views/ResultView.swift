//
//  ResultView.swift
//  TennisBotTest
//
//  Created by Артем Соловьев on 01.07.2023.
//

import SwiftUI

struct ResultView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.mainBlueColor.ignoresSafeArea()
                
                Image("resultBg")
                    .resizable()
                    .padding(.bottom, 90)
                
                VStack(spacing: 10) {
                    
                    Spacer()
                    
                    VStack(spacing: -4) {
                        HStack {
                            Text(viewModel.nameUser + ",")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .bold()
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("Ваша сила:")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .bold()
                            
                            Text(String(viewModel.poweOfUser))
                                .foregroundColor(.mainOrangeColor)
                                .font(.system(size: 30))
                                .bold()
                            
                            Spacer()
                        }
                    }
                    
                    HStack {
                        Text("Теперь вы можете найти партнера  для игры")
                            .foregroundColor(.white.opacity(0.9))
                            .font(.system(size: 20))
                        
                        Spacer()
                    }
                    
                    CustomButton(textButton: "Начать играть") {
                        //
                    }
                    .padding(.top, 6)
                    .padding(.bottom, 20)
                }
                .padding(.horizontal, 16)
                
            }
        }
        .environmentObject(viewModel)
        .navigationBarBackButtonHidden(true)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
