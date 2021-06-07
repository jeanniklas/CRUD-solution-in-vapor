import Fluent
import Vapor
import Leaf

func routes(_ app: Application) throws {
    struct First: Content{
        var names: [Todo]
    }
    struct Hello: Content {
        var name: String!
    }
    
    
    app.get { req in
        // Fetch all users from the database.
        Todo.query(on: req.db).all().flatMapThrowing { users in
            return req.view.render("index", First(names: users))
        }
    }
    
    app.post("users"){req -> Response in
            
            
            let galaxy = try req.content.decode(Todo.self)
            galaxy.create(on: req.db)
                .map{ galaxy }
        return req.redirect(to: "/")

        }
    
//    create authorization with restriction
//    create timestamp and delete record which is older than 24h
    app.post("todos"){req -> Response in
        let hello = try req.content.decode(Hello.self)
        Todo.query(on: req.db)
            .filter(\.$title == hello.name)
            .delete()
        return req.redirect(to: "/")
        
    }
    
    

    
    app.get("x"){req in
        return Todo.query(on: req.db).all()
        
    }
        
    
    
    
        
    


}

