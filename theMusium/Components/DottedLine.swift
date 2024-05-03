//
//  DottedLine.swift
//  theMusium
//
//  Created by sseungwonnn on 4/13/24.
//

import SwiftUI

struct DottedLine: View {
    var body: some View {
        Line()
            .stroke(style: .init(dash: [5]))
            .foregroundStyle(Color("TextColor"))
            .frame(height: 1)
    }
}

struct Line: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
#Preview {
    DottedLine()
}
