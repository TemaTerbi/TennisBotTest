//
//  ResultModel.swift
//  TennisBotTest
//
//  Created by Артем Соловьев on 01.07.2023.
//

import Foundation

struct ResultModel: Encodable {
    var answers: [Int]
}

struct ResultModelResponse: Codable {
    var success: Bool
    var message: String
    var data: ResultModelResponseData
}

struct ResultModelResponseData: Codable {
    var rating: Int
}
