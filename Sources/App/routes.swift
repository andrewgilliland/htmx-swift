import Vapor

func routes(_ app: Application) throws {
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.get { req async in
        let publicDir = "Public"

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: app.directory.workingDirectory)
                .appendingPathComponent(publicDir, isDirectory: true)
                .appendingPathComponent("index.html", isDirectory: false))
            
            print(data)

        } catch {
            print(error)
        }
        
        return "It works"
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
            "<li>\(user)</li>"
        }.joined(separator: "")
        
        return userHTML
    }
}
