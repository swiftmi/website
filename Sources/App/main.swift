import Vapor
import VaporMySQL

let drop = Droplet()
try drop.addProvider(VaporMySQL.Provider.self)
drop.preparations.append(Article.self)

var articleController  = ArticleController()
drop.get("articles",handler:articleController.index)
drop.get("articles",":id", handler:articleController.detail)
drop.run()
