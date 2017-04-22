//
//  Util.swift
//  swiftmi-web
//
//
//
import Vapor
import Foundation

class Util:NSObject  {
    
   class func calcPager(page pageIndex:Int, size pageSize:Int, rows records:Int) -> Node  {
        var pages = Int(records / pageSize)
        if pages * pageSize < records {
            pages += 1
        }
        return ["totalPage":Node(pages),"pageSize":Node(pageSize), "currentPage":Node(pageIndex), "totalCount":Node(records)]
    }
}
