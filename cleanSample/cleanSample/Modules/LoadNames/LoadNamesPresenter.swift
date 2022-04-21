//
//  LoadNamesPresenter.swift
//  cleanSample
//
//  Created by Ajith-pt4498 on 21/04/22.
//

import Foundation

//object
//protocol
//ref to interactor,router,view

enum fetchError:Error {
    case failed
}

protocol LoadNamesPresenterProtocol{
    var router:loadNamesRouterProtocol? { get set }
    var intracter:loadNamesIntracterProtocol? { get set }
    var view:loadNamesViewProtocol? { get set }
    
    func IntracterDidFetchUser(with result:Result<[User],Error>)
}

class LoadNamesPresenter:LoadNamesPresenterProtocol {
    

    func IntracterDidFetchUser(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure:
            view?.update(with: "Failed fetching user!")
        }
    }
    
    
    var router: loadNamesRouterProtocol?
    
    var intracter: loadNamesIntracterProtocol? {
        didSet{
            intracter?.getUsers()
        }
    }
    
    var view: loadNamesViewProtocol?
    
}
