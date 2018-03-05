//
//  ViewController.swift
//  tableviewmvvm
//
//  Created by jianwei on 05/03/2018.
//  Copyright © 2018 jianwei. All rights reserved.
//

import UIKit
protocol TodoView:class {//協定：定義函式
    func insertTodoItem() ->  ()
}
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
        
        viewModel = TodoViewModel(view: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //畫面上的按鈕事件
    @IBAction func onAddItem(_ sender: UIButton) {
        guard let newTodoValue = textFieldViewItem.text else {
            print("No Value entered")
            return
        }
        viewModel?.newTodoItem = newTodoValue
        viewModel?.onAddTodoItem()
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
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let iteViewModel = viewModel?.items[indexPath.row]
        let iv = iteViewModel as? TodoItemViewDelegate
        iv?.onItemSelected()
    }
}
extension ViewController:TodoView{
    func insertTodoItem() {
        guard let items = viewModel?.items else {
            print("items object is empty")
            return
        }
        self.textFieldViewItem.text = viewModel?.newTodoItem
        
        self.tableViewItems.beginUpdates()
        self.tableViewItems.insertRows(at: [IndexPath(row: items.count - 1 ,section: 0)], with: .automatic)
        self.tableViewItems.endUpdates()
    }
    
    
}
