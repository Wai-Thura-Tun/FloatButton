//
//  ViewController.swift
//  FloatButton
//
//  Created by Wai Thura Tun on 7/25/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblCoffee: UITableView!
    
    private var coffees: [CoffeeVO] = [] {
        didSet {
            self.updateSnapShot()
        }
    }
    
    private var cartCount: Int = 1
    
    private var dataSource: UITableViewDiffableDataSource<Int, CoffeeVO>!
    
    private lazy var floatButton: FloatingButton = {
        let button = FloatingButton(image: .init(systemName: "cart"))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        setUpDataSource()
        coffees = [
            CoffeeVO(name: "Espresso", price: 2.50),
            CoffeeVO(name: "Americano", price: 2.75),
            CoffeeVO(name: "Cappuccino", price: 3.25),
            CoffeeVO(name: "Latte", price: 3.50),
            CoffeeVO(name: "Mocha", price: 3.75),
            CoffeeVO(name: "Macchiato", price: 3.00),
            CoffeeVO(name: "Flat White", price: 3.20),
            CoffeeVO(name: "Affogato", price: 4.00),
            CoffeeVO(name: "Cold Brew", price: 3.50),
            CoffeeVO(name: "Iced Coffee", price: 3.00)
        ]
    }
    
    private func setUpViews() {
        if self.cartCount > 0 {
            floatButton.add(self.view)
        }
        else {
            floatButton.remove()
        }
    }
    
    private func setUpDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: self.tblCoffee) { tableView, indexPath, coffeeVO in
            let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeCell", for: indexPath) as? CoffeeCell
            guard let cell = cell else { return UITableViewCell.init() }
            cell.data = coffeeVO
            return cell
        }
        
        self.tblCoffee.register(UINib.init(nibName: "CoffeeCell", bundle: nil), forCellReuseIdentifier: "CoffeeCell")
    }
    
    private func updateSnapShot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CoffeeVO>()
        snapshot.appendSections([0])
        snapshot.appendItems(self.coffees, toSection: 0)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

