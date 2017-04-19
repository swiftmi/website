import Vapor
import Fluent
import Foundation

final class Article: Model {
    var id: Node?
    var content: String
    var title: String
    static let entity = "article"
    static let idKey = "articleId"
    var exists: Bool = true
    
    init(title:String, content: String) {
        self.title = title
        self.content = content
    }

    init(node: Node, in context: Context) throws {
        id = try node.extract("articleId")
        content = try node.extract("content")
        title = try node.extract("title")
    }

    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "articleId": id,
            "content": content,
            "title":title
        ])
    }
}


extension Article: Preparation {
    static func prepare(_ database: Database) throws {
        //
    }

    static func revert(_ database: Database) throws {
        //
    }
}
