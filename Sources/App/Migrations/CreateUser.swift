//
//  File.swift
//  
//
//  Created by Роман Горбенко on 22.01.2022.
//

import Foundation
import FluentKit

class CreateUser: Migration {
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("users")
            .delete()
    }
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("users")
            .field("id", .int32, .identifier(auto: true))
            .field("FirstName", .string, .required)
            .field("SecondName", .string, .required)
            .field("ProfileImage", .data)
            .create()
    }
}
