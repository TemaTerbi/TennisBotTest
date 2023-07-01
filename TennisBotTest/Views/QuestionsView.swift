//
//  QuestionsView.swift
//  TennisBotTest
//
//  Created by Артем Соловьев on 01.07.2023.
//

import SwiftUI

struct QuestionsView: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    @State var opacity: Double = 1
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            ZStack {
                
                NavigationLink(tag: true, selection: $viewModel.goNext) {
                    ResultView()
                } label: {
                    EmptyView()
                }
                
                if viewModel.showLoadingView {
                    VStack {
                        Text("Отлично! Считаем показатель вашей силы...")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 25))
                        
                        Image("loadIcon")
                            .padding(.top, 105)
                    }
                    .background(.white)
                }
                
                VStack {
                    VStack(spacing: 16) {
                        HStack(alignment: .center) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.mainOrangeColor)
                                .font(.system(size: 16))
                                .bold()
                                .onTapGesture {
                                    if viewModel.stage == 1 {
                                        presentationMode.wrappedValue.dismiss()
                                    } else {
                                        viewModel.stage -= 1
                                    }
                                }
                            
                            Spacer()
                            
                            Text("Опрос")
                                .font(.system(size: 20))
                                .bold()
                            
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        
                        StatusLine(stage: viewModel.stage)
                            .frame(maxHeight: 4)
                    }
                    .padding(.top, 50)
                    
                    switch viewModel.stage {
                    case 1:
                        viewModel.showQuestion()
                            .padding(.top, 56)
                    case 2:
                        viewModel.showQuestion()
                            .padding(.top, 56)
                    case 3:
                        viewModel.showQuestion()
                            .padding(.top, 56)
                    case 4:
                        viewModel.showQuestion()
                            .padding(.top, 56)
                    case 5:
                        viewModel.showQuestion()
                            .padding(.top, 56)
                    case 6:
                        viewModel.showQuestion()
                            .padding(.top, 56)
                    case 7:
                        viewModel.showQuestion()
                            .padding(.top, 56)
                    case 8:
                        viewModel.showQuestion()
                            .padding(.top, 56)
                    case 9:
                        viewModel.showQuestion()
                            .padding(.top, 56)
                    default:
                        viewModel.showQuestion()
                            .padding(.top, 56)
                    }
                    
                    Spacer()
                    
                    CustomButton(textButton: viewModel.stage == 9 ? viewModel   .buttonText : "Далее") {
                        viewModel.putAnswerToArray()
                        
                        if viewModel.stage == 9 && viewModel.indexSelectedButton == 1 {
                            withAnimation(.easeIn) {
                                viewModel.showLoadingView = true
                                opacity = 0
                            }
                            viewModel.sendAnswers()
                        } else if viewModel.stage == 10 {
                            withAnimation(.easeIn) {
                                viewModel.showLoadingView = true
                                opacity = 0
                                print(viewModel.answerArray)
                            }
                            viewModel.sendAnswers()
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .opacity(opacity)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView()
    }
}
