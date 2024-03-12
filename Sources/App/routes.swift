import Vapor

func routes(_ app: Application) throws {
    let file = FileMiddleware(publicDirectory: app.directory.publicDirectory)
    app.middleware.use(file)
    
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get("users") { req async -> String in
        
//        let limit = 5
//        let url = URL(string: "https://jsonplaceholder.typicode.com/users?_limit=\(limit)")!
//        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
//            guard let data = data else { return }
//            print(String(data: data, encoding: .utf8)!)
//        }
//        task.resume()
        
        let users = ["Biff", "Axel", "Marty"]
        let userHTML = users.map { (user) -> String in
            return "<div>\(user)</div>"
        }.joined(separator: "")
        
        print(userHTML)
        
        return userHTML
    }
}
