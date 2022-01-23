//
//  File.swift
//  
//
//  Created by Роман Горбенко on 22.01.2022.
//

import Fluent
import Vapor

class UserController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let duties = routes.grouped("users")
        duties.get(use: index)
        duties.post(use: create)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[User]> {
        return User.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let user = try req.content.decode(User.self)
        return user.save(on: req.db).transform(to: .ok)
    }
    
}
