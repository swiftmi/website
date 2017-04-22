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
        let pageSize = 10;
        let articles = try Article.query().limit(pageSize, withOffset: (pn-1)*pageSize).run().makeNode()
        let totalCount = try Article.query().count()
        let pager = Util.calcPager(page: pn, size: pageSize, rows: totalCount)
        return try drop.view.make("article_list",["articles":articles,"pager":pager])
        
//        return try Article.all().makeNode().converted(to: JSON.self)
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
        return try drop.view.make("article_detail",["article":article!])
    }

}

