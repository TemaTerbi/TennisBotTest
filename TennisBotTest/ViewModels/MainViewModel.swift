//
//  MainViewModel.swift
//  TennisBotTest
//
//  Created by Артем Соловьев on 01.07.2023.
//

import Foundation
import SwiftUI

final class MainViewModel: ObservableObject {
    
    @Published var nameUser: String = ""
    @Published var lastNameUser: String = ""
    @Published var stage: CGFloat = 1
    @Published var buttonText: String = "Завершить"
    @AppStorage("token") var token = ""
    @Published var showLoadingView: Bool = false
    @Published var poweOfUser = 0
    @Published var goNext: Bool? = false
    
    var answerArray: [Int] = [0,0,0,0,0,0,0,0,0]
    var indexSelectedButton: Int = 0
    
    private var firstQuestion = [
        ChoseeModel(name: "Новичок", check: false),
        ChoseeModel(name: "Любитель", check: false),
        ChoseeModel(name: "Продвинутный", check: false),
        ChoseeModel(name: "Профессионал", check: false),
    ]
    
    private var secondQuestion = [
        ChoseeModel(name: "Слабый", check: false),
        ChoseeModel(name: "Средний", check: false),
        ChoseeModel(name: "Сильный", check: false),
    ]
    
    private var thirdQuestion = [
        ChoseeModel(name: "Да", check: false),
        ChoseeModel(name: "Нет", check: false)
    ]
    
    func showQuestion() -> some View {
        switch stage {
        case 1:
            return Question(buttonArray: firstQuestion, name: "Оцените свой уровень игры", vm: self)
        case 2:
            return Question(buttonArray: secondQuestion, name: "Оцените свой форхенд", vm: self)
        case 3:
            return Question(buttonArray: secondQuestion, name: "Оцените свой бэкхенд", vm: self)
        case 4:
            return Question(buttonArray: secondQuestion, name: "Оцените свой резаный удар", vm: self)
        case 5:
            return Question(buttonArray: secondQuestion, name: "Оцените свою подачу", vm: self)
        case 6:
            return Question(buttonArray: secondQuestion, name: "Оцените свою игру у сетки", vm: self)
        case 7:
            return Question(buttonArray: secondQuestion, name: "Оцените свою скорость игры", vm: self)
        case 8:
            return Question(buttonArray: thirdQuestion, name: "Вы учавствовали в трунирах?", vm: self)
        case 9:
            return Question(buttonArray: thirdQuestion, name: "Вы занимали призовые места в турнирах?", vm: self)
        default:
            return Question(buttonArray: firstQuestion, name: "Оцените свой уровень игры", vm: self)
        }
    }
    
    func putAnswerToArray() {
        if stage == 8 || stage == 9 {
            answerArray[Int(stage) - 1] = indexSelectedButton == 0 ? indexSelectedButton + 1 : indexSelectedButton - 1
            stage += 1
        } else {
            answerArray[Int(stage) - 1] = indexSelectedButton + 1
            stage += 1
        }
    }
    
    func getToken() {
        let phone = Int.random(in: 3..<100)
        let phoneModel: PhoneModel = PhoneModel(phone: phone)
        
        ApiManager.shared.getCode(parametrs: phoneModel) { response in
            let confirmModel: ConfirmCodeModel = ConfirmCodeModel(phone: phone, password: "12345678", name: self.nameUser, initial_rating: 0, is_male: true, code: response.data.code)
            ApiManager.shared.confirmCode(parametrs: confirmModel) { response in
                print(response.data.token)
                self.token = response.data.token
            }
        }
    }
    
    func sendAnswers() {
        let resultModel = ResultModel(answers: answerArray)
        
        ApiManager.shared.sendAnswers(token: token, parametrs: resultModel) { reponse in
            self.poweOfUser = reponse.data.rating
            self.goNext = true
        }
    }
}
