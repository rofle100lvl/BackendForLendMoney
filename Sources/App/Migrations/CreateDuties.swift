//
//  CreateTable.swift
//  
//
//  Created by Роман Горбенко on 22.01.2022.
//

import FluentKit

class CreateDuties: Migration {
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("duties")
            .delete()
    }
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("duties")
            .id()
            .field("user_id", .int32, .required, .references("users", "id"))
            .field("Amount", .int32, .required)
            .create()
    }
}
