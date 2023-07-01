//
//  ConfirmCodeModel.swift
//  TennisBotTest
//
//  Created by Артем Соловьев on 01.07.2023.
//

import Foundation

struct ConfirmCodeModel: Encodable {
    let phone: Int
    let password: String
    let name: String
    let initial_rating: Int
    let is_male: Bool
    let code: Int
}

struct ConfirmCodeModelResponse: Codable {
    let success: Bool
    let message: String
    let data: ConfirmCodeModelResponseData
}

struct ConfirmCodeModelResponseData: Codable {
    let id: Int
    let token: String
}
