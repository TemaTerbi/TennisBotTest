//
//  ApiManager.swift
//  TennisBotTest
//
//  Created by Артем Соловьев on 01.07.2023.
//

import Foundation
import Alamofire

var baseUrl: String {
    return "http://bugz.su:8000"
}

var userDomen: String {
    return "/user"
}

var registrationDomen: String {
    return "/registration_code"
}

var confirmCodeDomen: String {
    return "/confirmCode"
}

var testAnswersDomen: String {
    return "/test/result"
}

final class ApiManager {
    static let shared = ApiManager()
    
    func getCode(parametrs: PhoneModel, completition: @escaping(PhoneModelRespone) -> Void) {
        AF.request(baseUrl + userDomen + registrationDomen, method: .post, parameters: parametrs, encoder: JSONParameterEncoder.default).responseData { responseData in
            guard let data = responseData.data else { return }
            if let codeResponse = try? JSONDecoder().decode(PhoneModelRespone.self, from: data) {
                completition(codeResponse)
            } else {
                print("Parse error")
            }
        }
    }
    
    func confirmCode(parametrs: ConfirmCodeModel, completition: @escaping(ConfirmCodeModelResponse) -> Void) {
        AF.request(baseUrl + userDomen + confirmCodeDomen, method: .post, parameters: parametrs, encoder: JSONParameterEncoder.default).responseData { responseData in
            guard let data = responseData.data else { return }
            if let confirm = try? JSONDecoder().decode(ConfirmCodeModelResponse.self, from: data) {
                completition(confirm)
            } else {
                print("Parse error")
            }
        }
    }
    
    func sendAnswers(token: String, parametrs: ResultModel, completition: @escaping(ResultModelResponse) -> Void) {
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        AF.request(baseUrl + testAnswersDomen, method: .post, parameters: parametrs, encoder: JSONParameterEncoder.default, headers: headers).responseData { responseData in
            guard let data = responseData.data else { return }
            if let result = try? JSONDecoder().decode(ResultModelResponse.self, from: data) {
                completition(result)
            } else {
                print("Parse error")
            }
        }
    }
}
