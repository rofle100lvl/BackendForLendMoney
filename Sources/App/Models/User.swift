//
//  File.swift
//  
//
//  Created by Роман Горбенко on 22.01.2022.
//

import Vapor
import FluentKit

final class User: Model, Content {
    static let schema = "users"
    
    @ID(custom: "id", generatedBy: .database)
    var id: Int32?
    
    @Field(key: "FirstName")
    var firstName: String
    
    @Field(key: "SecondName")
    var secondName: String

    @OptionalField(key: "ProfileImage")
    var profileImage: Data?
    
    @Children(for: \.$user)
    var childrenArray: [Duty]
    
    init() {
        
    }
    
    init(id: Int32, firstName: String, secondName: String, profileImage: Data? = nil) {
        self.id = id
        self.firstName = firstName
        self.secondName = secondName
        self.profileImage = profileImage
    }
    
    init(id: Int32, firstName: String, secondName: String) {
        self.id = id
        self.firstName = firstName
        self.secondName = secondName
        self.profileImage = nil
    }
}
