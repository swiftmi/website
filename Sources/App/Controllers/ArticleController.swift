import Vapor
import HTTP

final class ArticleController {

    func index(request: Request) throws -> ResponseRepresentable {
        return try Article.all().makeNode().converted(to: JSON.self)
    }

}

