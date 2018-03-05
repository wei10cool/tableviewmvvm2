//
//  ViewController.swift
//  tableviewmvvm
//
//  Created by jianwei on 05/03/2018.
//  Copyright © 2018 jianwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //畫面上的tableView
    @IBOutlet weak var tableViewItems: UITableView!
    //畫面上的輸入框
    @IBOutlet weak var textFieldViewItem: UITextField!
    
    let identifier = "todoItemCellIdentifier"
    var viewModel: TodoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ---------
        //指定tableview的datasource、delegate在哪實現
        tableViewItems.dataSource = self as? UITableViewDataSource
        tableViewItems.delegate = self as? UITableViewDelegate
        //註冊nib
        let myNib = UINib(nibName: "TodoItemTableViewCell", bundle: nil)
        tableViewItems.register(myNib, forCellReuseIdentifier: identifier)
        
        viewModel = TodoViewModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //畫面上的按鈕事件
    @IBAction func onAddItem(_ sender: UIButton) {
        
    }
}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //把資料指定宣告為TodoItemTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TodoItemTableViewCell
        //設定cell的內容
        let itemViewModel = viewModel?.items[indexPath.row] //逐筆把viewModel模型內的資料帶入
        cell.configure(withViewModel: itemViewModel!)
        return cell
    }
    
    
}
