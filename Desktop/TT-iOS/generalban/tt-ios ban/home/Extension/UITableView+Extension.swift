//
//  UITableView+Extension.swift
//  home
//
//  Created by 반성준 on 2024/01/16.
//

import UIKit

extension UITableView {
    func register(_ cellType: BaseTableViewCell.Type) {
        register(
            cellType,
            forCellReuseIdentifier: cellType.reuseIdentifier
        )
    }
}
