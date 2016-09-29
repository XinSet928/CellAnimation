//
//  NextViewController.swift
//  8.单元格动画
//
//  Created by mac on 16/9/17.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class NextViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableview : UITableView?
    
    override func viewWillAppear(_ animated: Bool) {
        animationTable()
    }
    //动画
    func animationTable() {
        self.tableview?.reloadData()
        let cells = tableview?.visibleCells
        let tableHeight: CGFloat = (tableview?.bounds.size.height)!
        for i in cells! {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX:0,y:tableHeight)
            
        }
        
        var index = 0
        for a in cells! {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.5, delay: 0.05*Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX:0,y:0)
                }, completion: nil)
            index += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview = UITableView.init(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        tableview?.delegate = self
        tableview?.dataSource = self
        self.view.addSubview(tableview!)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "CELLID"
        var cell = tableview?.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
             cell?.selectionStyle = UITableViewCellSelectionStyle.none
        }
        cell?.backgroundColor =  colorforIndex((indexPath as NSIndexPath).row)
        
        
        return cell!
    }
    
    func colorforIndex(_ index: Int) -> UIColor {
        
        let itemCount = 9
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController()
        self.present(vc, animated: true, completion: nil)
    }
    

}
