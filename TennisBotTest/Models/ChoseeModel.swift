//
//  ChoseeModel.swift
//  TennisBotTest
//
//  Created by Артем Соловьев on 01.07.2023.
//

import Foundation

struct ChoseeModel: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var check: Bool
}
