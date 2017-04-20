import Vapor
import HTTP
import Fluent
import FluentMySQL

final class ArticleController {

    func index(request: Request) throws -> ResponseRepresentable {
        let articles = try Article.query().limit(10).run().makeNode()
        return try drop.view.make("article_list",["articles":articles])
        
//        return try Article.all().makeNode().converted(to: JSON.self)
    }

}

