//
//  Result.swift
//  TMDB
//
//  Created by Yaser on 10.02.2024.
//

import Foundation

enum Result<T> {
    case success(value: T)
    case failure(error: String)
}
