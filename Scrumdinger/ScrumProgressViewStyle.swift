//
//  ScrumProgressViewStyle.swift
//  Scrumdinger
//
//  Created by bMatheron on 10/04/2023.
//

import SwiftUI

struct ScrumProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.currentValueLabel
        }
    }
}

//extension LabelStyle where Self == ScrumProgressViewStyle {
//    static var trailingIcon: Self { Self() }
//}
