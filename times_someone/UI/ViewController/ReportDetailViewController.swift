//
//  ReportDetailController.swift
//  times_someone
//
//  Created by 能美龍星 on 2019/11/18.
//  Copyright © 2019 Ryusei Nomi. All rights reserved.
//

import UIKit

class ReportDetailViewController: UIViewController {

    let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titleLabel.frame = view.bounds
    }

}

