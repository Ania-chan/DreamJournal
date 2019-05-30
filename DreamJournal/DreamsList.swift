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
    

    func addDream() -> DreamItem {
        let dream = DreamItem()
        dream.text = "dream"
        dreams.append(dream)
        return dream
    }
    
    func move(item: DreamItem, to index: Int) {
        guard let currentIndex = dreams.firstIndex(of: item) else {
            return
        }
        dreams.remove(at: currentIndex)
        dreams.insert(item, at: index)
    }
    
    func remove(items: [DreamItem]) {
        for item in items {
            if let index = dreams.firstIndex(of: item) {
                dreams.remove(at: index)
            }
        }
    }
}
