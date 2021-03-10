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
    var colorDetailVC = ColorDetailVC()
    
    struct Cells {
        static let colorCell = "ColorCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Colors"
        
        //set up UI
        configureUI()
        
        populateColors()
    }
    
    func populateColors() {
        for _ in 0..<50 {
            colors.append(UIColor.random())
        }
    }
    
    func configureUI(){
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        setTableViewDelegates()
        
        tableView.rowHeight = 50
        tableView.register(ColorCell.self, forCellReuseIdentifier: Cells.colorCell)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension RandomColorsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) as! ColorCell
        cell.set(color: colors[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(colors[indexPath.row])
        colorDetailVC.color = colors[indexPath.row]
        show(colorDetailVC, sender: nil)
    }
    
}
