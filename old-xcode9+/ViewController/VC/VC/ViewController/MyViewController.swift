//
//  MyViewController.swift
//  VC
//
//  Created by geonhui Yu on 2022/08/13.
//  Copyright © 2022 Keun young Kim. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func fromCode(_ sender: Any) {
        
        let vc = UIViewController()
        vc.view.backgroundColor = .systemYellow
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
