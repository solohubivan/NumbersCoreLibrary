//
//  NumberFactType.swift
//
//
//  Created by Ivan Solohub on 27.05.2024.
//

import Foundation

public enum NumberFactType {
    case trivia(requestedNumber: String)
    case range(min: String, max: String)
    
    func urlString() -> String {
        switch self {
        case .trivia(let requestedNumber):
            return "\(requestedNumber)/trivia"
        case .range(let min, let max):
            return "random?min=\(min)&max=\(max)"
        }
    }
}
