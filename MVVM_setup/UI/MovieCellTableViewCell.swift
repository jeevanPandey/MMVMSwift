//
//  MovieCellTableViewCell.swift
//  SetupDemo
//
//  Created by Jeevan on 16/12/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class MovieCellTableViewCell: UITableViewCell {
    
    @IBOutlet var overviewlabel: UILabel!
    @IBOutlet var imageArt: UIImageView!
    
    @IBOutlet var releaseDate: UILabel!
    @IBOutlet var titleLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpWith(_ viewModel: MovieViewModel) {
      
        
        self.titleLable.text = viewModel.title
        self.overviewlabel.text = viewModel.overview
        self.releaseDate.text = viewModel.releaseDate
        
        imageArt.loadImageUsingCacheWithURLString(viewModel.posterPath, placeHolder: nil) { (completed) in
            
            self.layoutIfNeeded()
        }

    }
    
}
