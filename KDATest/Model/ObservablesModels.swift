//
//  ObservablesModels.swift
//  KDATest
//
//  Created by Sufiandy Elmy on 07/11/23.
//

import Foundation


//specific class for observing the tab selection
class CategorySelectedObservable: ObservableObject {
    @Published var selectedId: String?
}

// products change observables
class ProductObservable: ObservableObject {
    @Published var productsList: [GroceryItemModel] = []
}

// products change observables
class CategoryObservable: ObservableObject {
    @Published var categoryList: [CategoryItemModel] = []
}

// progress change observables
class ProgressObservable: ObservableObject {
    @Published var isLoading: Bool = true
}

// search text change observables
class SearchTextChangeObservable: ObservableObject {
    
    var searchChangeDelegate: SearchChangeDelegate?
    
    @Published var searchText: String = "" {
        didSet {
            searchChangeDelegate?.onKeyChange(text: searchText.description)
        }
    }
}

