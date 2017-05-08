import Vapor
import HTTP
import Fluent
import FluentMySQL

final class ArticleController {

    func index(request: Request) throws -> ResponseRepresentable {
        
        var pn = 1
        if let page = request.query?["pn"]?.int {
            pn = page
        }
        let result = try ArticleRepository.GetArticleList(pn, pageSize: 10)
        
        return try drop.view.make("article_list.stencil", result)
        
    }
    
    func detail(request: Request)  throws -> ResponseRepresentable {
        var articleId = 0
        if let id = request.parameters["id"]?.int {
            articleId = id
        }
        if(articleId == 0) {
            throw Abort.notFound
        }
        
        let article = try Article.find(articleId)?.makeNode()
        if article == nil {
            throw Abort.notFound
        }
        return try drop.view.make("article_detail.stencil",["article":article!])
    }

}

