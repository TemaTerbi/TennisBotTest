//
//  StatusLine.swift
//  TennisBotTest
//
//  Created by Артем Соловьев on 01.07.2023.
//

import SwiftUI

struct StatusLine: View {
    
    var stage: CGFloat
    
    var body: some View {
        GeometryReader { gr in
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 4)
                .foregroundColor(.gray.opacity(0.4))
                .overlay {
                    HStack {
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundColor(Color.mainOrangeColor)
                            .frame(width: (gr.size.width)/9 * stage)
                            .animation(.linear, value: stage)
                        
                        Spacer()
                    }
                }
        }
    }
}

struct StatusLine_Previews: PreviewProvider {
    static var previews: some View {
        StatusLine(stage: 1)
    }
}
