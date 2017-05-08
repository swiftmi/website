import Foundation
import Fluent
import FluentMySQL

class ArticleRepository {
    
    class func GetArticleList(_ pageIndex:Int,pageSize:Int) throws -> Node {
        
        let articles = try Article.query().limit(pageSize,withOffset: (pageIndex-1)*pageSize).run().makeNode()
        let totalCount = try Article.query().count()
        
        let pager = Util.calcPager(page: pageIndex, size: pageSize, rows: totalCount)

        return ["articles":articles,"pager":pager]
        
    }
}
