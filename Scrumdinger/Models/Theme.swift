//
//  Theme.swift
//  Scrumdinger
//
//  Created by bMatheron on 07/04/2023.
//

import Foundation
import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable {
    case pastelBlue, pastelGreen, pastelPurple, pastelRed, pastelYellow
    
    var accentColor: Color {
        switch self {
        case .pastelBlue, .pastelGreen, .pastelPurple: return .black
        default: return .green
        }
    }
    
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String {
        name
    }
}
