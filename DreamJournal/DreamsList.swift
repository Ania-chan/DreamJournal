//
//  DreamsList.swift
//  DreamJournal
//
//  Created by Anna Nakayama on 2019/05/29.
//  Copyright © 2019 Anna Nakayama. All rights reserved.
//

import Foundation

class DreamsList {
    var dreams: [DreamItem] = []
    init() {
        let firstDream = DreamItem()
        firstDream.text = "something"
        dreams.append(firstDream)
    }
    
    func addDream() -> DreamItem {
        let item = DreamItem()
        item.text = "random dream"
        dreams.append(item)
        return item
    }
}
