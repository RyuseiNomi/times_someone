//
//  ReportListViewController.swift
//  times_someone
//
//  Created by 能美龍星 on 2019/11/23.
//  Copyright © 2019 Ryusei Nomi. All rights reserved.
//

import Foundation
import UIKit

class ReportListViewController: UITableViewController
{
    let createReportButton = UIButton()
    let reportPostPresenter = ReportPostPresenter()
    
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 100
    }
    
    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "row \(indexPath.row)"
        return cell
    }
    
    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ReportDetailViewController()
        vc.titleLabel.text = "row \(indexPath.row)"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        let buttonView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        buttonView.layer.position = CGPoint(x: view.frame.width - view.frame.width/10*2, y: view.frame.height - view.frame.height/12)
        navigationController?.view.addSubview(buttonView)
        //TODO: ターゲットをReportPostPresenterに向ける
        createReportButton.addTarget(self, action: #selector(reportPostPresenter.postReport), for: .touchUpInside)
        buttonView.addSubview(createReportButton)
        buttonView.bringSubviewToFront(view)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        createReportButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        createReportButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        createReportButton.backgroundColor = UIColor(red: 0.3, green: 0.7, blue: 0.6, alpha: 1)
        createReportButton.setTitle("投稿", for: UIControl.State.normal)
    }
}
