//
//  File.swift
//  
//
//  Created by Роман Горбенко on 22.01.2022.
//

import Vapor
import FluentKit

final class Duty: Model, Content {
    static let schema = "duties"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "user_id")
    var user: User
    
    @Field(key: "Amount")
    var amount: Int32
    
    init() {
        
    }
    init(id: UUID? = nil, userId: Int32, amount: Int32) {
        self.id = id
        self.$user.id = userId
        self.amount = amount
    }
}
