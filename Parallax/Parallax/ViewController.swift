//
//  ViewController.swift
//  Parallax
//
//  Created by zhi zhou on 2017/3/5.
//  Copyright © 2017年 zhi zhou. All rights reserved.
//

import UIKit

private let cellIdentifier = "parallaxCell"

class ViewController: UIViewController {
    
    // MARK:- 属性
    /// Table View
    let tableView = UITableView()
    
    /// 图片数组
    let images = [#imageLiteral(resourceName: "img1"), #imageLiteral(resourceName: "img2"), #imageLiteral(resourceName: "img3"), #imageLiteral(resourceName: "img4"), #imageLiteral(resourceName: "img5"), #imageLiteral(resourceName: "img6"), #imageLiteral(resourceName: "img7"), #imageLiteral(resourceName: "img8"), #imageLiteral(resourceName: "img9")]
    
    
    // MARK:-  方法函数
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func setupInterface() {
        UIApplication.shared.statusBarStyle = .lightContent
        
        tableView.frame = self.view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .black
        tableView.separatorInset = .zero
        
        tableView.register(parallaxTableCell.self, forCellReuseIdentifier: cellIdentifier)
        
        self.view.addSubview(tableView)
    }

}

// MARK:- Table View 数据源、代理方法
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! parallaxTableCell
        
        tableView.rowHeight = cell.cellHeight
        cell.parallaxImageView.image = images[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! parallaxTableCell).parallax(offsetY: tableView.contentOffset.y, tableViewHeight: tableView.bounds.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for case let (cell as parallaxTableCell) in tableView.visibleCells {
            cell.parallax(offsetY: scrollView.contentOffset.y, tableViewHeight: tableView.bounds.height)
        }
    }
    
}
