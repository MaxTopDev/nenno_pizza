//
//  PizzaCell.swift
//  NennoPizza
//
//  Created by Maxim Ohrimenko on 4/25/19.
//  Copyright © 2019 Com. All rights reserved.
//

import UIKit
import SDWebImage

class PizzaCell: UITableViewCell {
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var pizzaImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var priceButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure(pizza: Pizza, ingredients: [Ingredient], basePrice: Double) {
        titleLabel.text = pizza.name
        let pizzaIngredients = ingredients.filter({pizza.ingredients.contains($0.id)})
        subTitleLabel.text = pizzaIngredients.map({$0.name}).joined(separator: ", ")
        let price = basePrice + pizzaIngredients.map({$0.price}).reduce(0, +)
        priceButton.setTitle("$\(price)", for: .normal)
        pizzaImageView.sd_setImage(with: URL(string: pizza.imageUrl ?? ""), placeholderImage: UIImage())
    }
}
