//
//  HomeViewController.swift
//  NennoPizza
//
//  Created by Maxim Ohrimenko on 4/25/19.
//  Copyright © 2019 Com. All rights reserved.
//

import UIKit
import SVProgressHUD

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.estimatedRowHeight = 178.0
            tableView.rowHeight = UITableView.automaticDimension
            tableView.separatorStyle = .none
            tableView.tableFooterView = UIView()
        }
    }
    
    private let pizzaProvider = PizzaProvider()
    private let ingredientsProvider = IngredientsProvider()
    private var pizzaArray = [Pizza]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Nenno's Pizza".uppercased()
        adjustUI()
        updatePizzaList()
    }
    
    // MARK: - Private
    
    private func adjustUI() {
        let cartButton = UIBarButtonItem(image: UIImage(named: "ic_cart_navbar") ?? UIImage(), style: .plain, target: self, action: #selector(cartButtonPressed))
        navigationItem.leftBarButtonItem = cartButton
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        navigationItem.rightBarButtonItem = addButton
    }
    
    private func updatePizzaList() {
        SVProgressHUD.show()
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        pizzaProvider.fetch { [weak self] (pizzaList, error) in
            if let array = pizzaList?.pizzas {
                self?.pizzaArray = array
            }
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        ingredientsProvider.fetch { (_, _) in
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            SVProgressHUD.dismiss()
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Actions
    
    @objc private func cartButtonPressed() {
        // TODO: - cart screen
    }
    
    @objc private func addButtonPressed() {
        // TODO: - add screen
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzaArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PizzaCell.reuseIdentifier, for: indexPath) as? PizzaCell else { return UITableViewCell() }
        let pizza = pizzaArray[indexPath.row]
        cell.configure(pizza: pizza, ingredients: ingredientsProvider.result, basePrice: pizzaProvider.result.basePrice)
        return cell
    }
}
