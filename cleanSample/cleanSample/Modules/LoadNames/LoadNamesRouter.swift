//
//  LoadNamesRouter.swift
//  cleanSample
//
//  Created by Ajith-pt4498 on 21/04/22.
//

import Foundation
import UIKit

//object
//entry point

typealias EntryPoint = loadNamesViewProtocol & UIViewController

protocol loadNamesRouterProtocol{
    
    var entry: EntryPoint? { get }
    static func start() -> loadNamesRouterProtocol
    
}


class LoadNamesRouter:loadNamesRouterProtocol{
    
    var entry: EntryPoint?
    

    static func start() -> loadNamesRouterProtocol {
        
        let router = LoadNamesRouter()
        
        var view:loadNamesViewProtocol = loadNamesView()
        var intracter:loadNamesIntracterProtocol = loadNamesIntracter()
        var presenter:LoadNamesPresenterProtocol = LoadNamesPresenter()
        
        view.presenter = presenter
        
        intracter.presenter = presenter
        
        presenter.intracter = intracter
        presenter.router = router
        presenter.view = view
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
    
}
