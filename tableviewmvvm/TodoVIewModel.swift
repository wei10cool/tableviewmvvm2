// ViewModel
//  TodoVIewModel.swift
//  tableviewmvvm
//
//  Created by jianwei on 05/03/2018.
//  Copyright © 2018 jianwei. All rights reserved.
//

//import Foundation
/*
 協定(protocol)是 Swift 一個重要的特性，它會定義出為了完成某項任務或功能所需的方法、屬性，協定本身不會實作這些任務跟功能，而僅僅只是表達出該任務或功能的名稱。這些功能則都交由遵循協定的型別來實作，列舉、結構及類別都可以遵循協定，遵循協定表示這個型別必須實作出協定定義的方法、屬性或其他功能。
 有點像是協定定義出一個To Do List，而所有遵循協定的型別都必須照表操課，將需要的功能都實作出來。
 繼承該項protocol必須做哪些項目
 */
protocol TodoItemPresenable {//協定：定義cell的長像
    var id:String?{get}
    var textValue:String?{get}
}
struct TodoItemViewModel:TodoItemPresenable {
    var id: String? = "0"
    var textValue: String?
}
protocol TodoItemViewDelegate {//協定：定義cell點擊的動作
    func onTodoItemAdded() ->()
}


struct TodoViewModel {
    var newTodoItem:String?
    var items:[TodoItemPresenable] = [] //cell指定是TodoItemPresenable的長像
    init() {
        let item1 = TodoItemViewModel(id: "1", textValue: "Hello1")
        let item2 = TodoItemViewModel(id: "2", textValue: "Hello2")
        let item3 = TodoItemViewModel(id: "3", textValue: "Hello3")
    //contentsOf把資料包裝起來
        items.append(contentsOf: [item1,item2,item3])
    }
    
}

extension TodoViewModel:TodoItemViewDelegate{
    func onTodoItemAdded() {
        
    }
}
