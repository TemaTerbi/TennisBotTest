//
//  PhoneModel.swift
//  TennisBotTest
//
//  Created by Артем Соловьев on 01.07.2023.
//

import Foundation

struct PhoneModel: Encodable {
    let phone: Int
}

struct PhoneModelRespone: Codable {
    let success: Bool
    let message: String
    let data: PhoneModelResponeData
}

struct PhoneModelResponeData: Codable {
    let phone: Int
    let code: Int
}
