//
//  ApiBuilder.swift
//  
//
//  Created by Ivan Solohub on 27.05.2024.
//

import Foundation

public class APIBuilder {
    
    public init() {}
    
    public func createLinkForRequest(type: NumberFactType) -> String {
        return "http://numbersapi.com/\(type.urlString())"
    }
    
    public func orderingRequestString(from input: String) -> String {
        var trimmedInput = input
        while let lastCharacter = trimmedInput.last, !CharacterSet.decimalDigits.contains(lastCharacter.unicodeScalars.first!) {
            trimmedInput.removeLast()
        }
        while let firstCharacter = trimmedInput.first, !CharacterSet.decimalDigits.contains(firstCharacter.unicodeScalars.first!) {
            trimmedInput.removeFirst()
        }
        return trimmedInput
    }
}
