//
//  MovieViewModel.swift
//  SetupDemo
//
//  Created by Jeevan on 16/12/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation

struct MovieViewModel: Decodable {
    let title: String
    let posterPath: String
    let overview: String
    let releaseDate: String
    var voteCount: String?
    init(model: Movie) {
        
        self.title = (model.title?.uppercased())!
        self.posterPath = "https://image.tmdb.org/t/p/w342" + model.poster_path!
        self.overview = model.overview!
        self.releaseDate = "Release date:" + " " + model.release_date!
       // self.voteCount = model.voteCount != nil ? "Number Of Reviews \(model.voteCount!)" : "No reviews"
    }
}
