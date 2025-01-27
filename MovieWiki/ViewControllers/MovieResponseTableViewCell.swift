//
//  MovieResponseTableViewCell.swift
//  MovieWiki
//
//  Created by Álvaro Perera on 27/1/25.
//

import UIKit

class MovieResponseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func fillCell(from movieResponse: Movie){
        moviePoster.loadFrom(url: URL(string: movieResponse.poster)!)
        movieTitle.text = "\(movieResponse.title) (\(movieResponse.year))"
    }
}
