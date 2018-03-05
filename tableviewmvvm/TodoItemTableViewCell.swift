//
//  TodoItemTableViewCell.swift
//  tableviewmvvm
//
//  Created by jianwei on 05/03/2018.
//  Copyright © 2018 jianwei. All rights reserved.
//

import UIKit

class TodoItemTableViewCell: UITableViewCell {

    @IBOutlet weak var txtIndex: UILabel!
    @IBOutlet weak var txtTodoItem: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /*!
     * @discussion 這個函式使用viewModel設定cell
     * @param viewModel
     * @return Void
     */
    func configure(withViewModel viewModel: TodoItemPresenable ) -> (Void) {
        txtIndex.text = viewModel.id
        txtTodoItem.text = viewModel.textValue
    }
    
}
