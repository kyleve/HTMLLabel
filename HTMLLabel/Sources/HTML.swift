//
//  HTML.swift
//  HTMLLabel
//
//  Created by Kyle Van Essen on 12/24/20.
//

import Foundation


struct HTML : Equatable {
        
    var root : Tag
}


extension HTML {
    
    struct Tag : Equatable {
        
        init(
            name: String,
            attributes: [String : String]? = nil,
            children: [HTML.Tag.Child] = []
        ) {
            self.name = name
            self.attributes = attributes
            self.children = children
        }
        
        static let rootName = "html-label-root"
        
        static func root(wrapping wrapped : () -> Tag) -> Tag {
            Tag(name: self.rootName, children: [.tag(wrapped())])
        }
        
        static func root(with children : () -> [Child]) -> Tag {
            Tag(name: self.rootName, children: children())
        }
        
        var name : String
        var attributes : [String:String]?
        
        var children : [Child]
        
        enum Child : Equatable {
            case characters(String)
            case tag(Tag)
        }
        
        func toAttributed() -> NSAttributedString {
            fatalError()
        }
    }
}


extension HTML.Tag {
    
    struct Format : Equatable {
        var attributes : [NSAttributedString.Key:AnyEquatable]
    }
}


struct AnyEquatable : Equatable {
    
    let base : Any
    
    let isEqual : (Any) -> Bool
    
    init<Value:Equatable>(_ base : Value) {
        self.base = base
        
        self.isEqual = { ($0 as? Value) == base }
    }
    
    static func == (lhs : AnyEquatable, rhs : AnyEquatable) -> Bool {
        lhs.isEqual(rhs.base)
    }
}
