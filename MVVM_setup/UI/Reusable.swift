//
//  Reusable.swift
//  SetupDemo
//
//  Created by Jeevan on 16/12/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

protocol Reusable {}

extension Reusable where Self: UITableViewCell  {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}
extension UITableViewCell: Reusable {}

extension UITableView {
    func register<T: UITableViewCell>(_ :T.Type) where T: Reusable {
        register(UINib(nibName: T.nibName, bundle:nil), forCellReuseIdentifier: T.reuseIdentifier)
        
    }
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not deque cell")
        }
        return cell
    }
}
