//
//  APError.swift
//  Apptizers
//
//  Created by Denis Coder on 2/17/24.
//

import Foundation

//:Error ? means that our enum conformes Swift Error Protocol

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
