//
//  File.swift
//  
//
//  Created by Jean Niklas Neumann on 04.05.21.
//

import Vapor

struct ExtendPathMiddleware: Middleware {

     func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        let response = request.redirect(to: "/")
        return request.eventLoop.makeSucceededFuture(response)
        
    }

}


