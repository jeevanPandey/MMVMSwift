//
//  MovieDataSource.swift
//  SetupDemo
//
//  Created by Jeevan on 16/12/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class MovieDataSource: NSObject, UITableViewDataSource,UITableViewDelegate {
    private var movies: [Movie]
    init(movies: [Movie]) {
        self.movies = movies
        super.init()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as MovieCellTableViewCell
        let movie = movies[indexPath.row]
        let viewModel = MovieViewModel(model: movie)
        cell.setUpWith(viewModel)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return section == 0 ? 44 : 30
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        return section == 0 ? nil : getHeaderView()

    }

    func getHeaderView() -> UIView? {

        let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 30))
        let sgement = UISegmentedControl(items: ["My info","My Design"])
        sgement.frame = CGRect(x: 20, y: 0, width: 320-40, height: 30)
        sgement.backgroundColor = UIColor.white
        sgement.tintColor = UIColor.brown
        view.addSubview(sgement)
        return view
    }
    
}
