//
//  LoadNamesView.swift
//  cleanSample
//
//  Created by Ajith-pt4498 on 21/04/22.
//

import Foundation
import UIKit

//view controller
//protocol
//ref to presenter

protocol loadNamesViewProtocol{
    var presenter:LoadNamesPresenterProtocol? { get set }
    
    func update(with users:[User])
    func update(with error:String)
}

class loadNamesView:UIViewController,loadNamesViewProtocol {
   
    var presenter: LoadNamesPresenterProtocol?
    
    private var tableView:UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        return tableView
    }()
    
    private var textLabel :UILabel = {
        let text = UILabel()
        text.textAlignment = .center
        text.isHidden = true
        return text
    }()
    
    var users:[User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(textLabel)
        tableView.dataSource = self
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        textLabel.frame = CGRect(x: 0, y: 0, width: 280, height: 50)
        textLabel.center = view.center
    }
    
    
    func update(with users: [User]) {
        DispatchQueue.main.async {
            self.users = users
            self.tableView.reloadData()
            self.tableView.isHidden = false
            self.textLabel.isHidden = true
        }
    }
    
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.tableView.isHidden = true
            self.users = []
            self.textLabel.isHidden = false
            self.textLabel.text = error
        }
    }
    
}

extension loadNamesView:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
}
