//
//  ColorDetailVC.swift
//  Colors-Programmatic
//
//  Created by Lorenzo Zemp on 10/03/21.
//

import UIKit

class ColorDetailVC: UIViewController {
    
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color ?? .black
        title = color?.accessibilityName
        
        print(view.backgroundColor!)
    }
    
    

}
