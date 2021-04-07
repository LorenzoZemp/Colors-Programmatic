//
//  RandomColorsVC.swift
//  Colors-Programmatic
//
//  Created by Lorenzo Zemp on 9/03/21.
//

import UIKit

class RandomColorsVC: UIViewController {
    
    var colors: [UIColor] = []
    var tableView: UITableView = UITableView()
    
    struct Cells {
        static let colorCell = "ColorCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Colors"
        
        //set up UI
        configureTableView()
        populateColors()
    }
    
    func populateColors() {
        for _ in 0..<50 {
            colors.append(UIColor.random())
        }
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 50
        tableView.register(ColorCell.self, forCellReuseIdentifier: Cells.colorCell)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.frame = view.bounds
    }
}

extension RandomColorsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) as! ColorCell
        cell.set(color: colors[indexPath.row])
        cell.contentView.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let colorDetailVC = ColorDetailVC()
        colorDetailVC.color = colors[indexPath.row]
        show(colorDetailVC, sender: nil)
    }
}
