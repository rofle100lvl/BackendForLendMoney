//
//  File.swift
//  
//
//  Created by Роман Горбенко on 22.01.2022.
//

import Fluent
import Vapor

struct CreateUserData: Content {
    let amount: Int32
    let userId: Int32
}

class DutyController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let duties = routes.grouped("duties")
        duties.get(use: index)
        duties.post(use: create)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Duty]> {
        return Duty.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<Duty> {
        let data = try req.content.decode(CreateUserData.self)
        let duty = Duty(userId: data.userId, amount: data.amount)
        return duty.save(on: req.db).map { duty }
    }
}
