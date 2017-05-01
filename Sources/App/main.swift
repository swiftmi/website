import Vapor
import VaporMySQL
import VaporStencilProvider

let drop = Droplet()

try drop.addProvider(VaporMySQL.Provider.self)
try drop.addProvider(VaporStencilProvider.self)
drop.preparations.append(Article.self)

var articleController  = ArticleController()
drop.get("articles",handler:articleController.index)
drop.get("articles",":id", handler:articleController.detail)
drop.run()
