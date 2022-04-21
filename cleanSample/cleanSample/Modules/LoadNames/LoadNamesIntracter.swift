//
//  LoadNamesIntracter.swift
//  cleanSample
//
//  Created by Ajith-pt4498 on 21/04/22.
//

import Foundation

//object
//protocol
//ref to presenter

protocol loadNamesIntracterProtocol{
    var presenter:LoadNamesPresenterProtocol? { get set }
    
    func getUsers()
}

class loadNamesIntracter:loadNamesIntracterProtocol{
    
    var presenter: LoadNamesPresenterProtocol?
    
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data,error == nil else {
                self?.presenter?.IntracterDidFetchUser(with: .failure(fetchError.failed))
                return
            }
            do{
                let entities = try JSONDecoder().decode([User].self, from: data)
                self?.presenter?.IntracterDidFetchUser(with: .success(entities))
            }catch{
                self?.presenter?.IntracterDidFetchUser(with: .failure(fetchError.failed))
            }

        }
        task.resume()
    }
    
   
    
    
}
