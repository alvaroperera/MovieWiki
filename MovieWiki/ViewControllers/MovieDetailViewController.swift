//
//  MovieDetailViewController.swift
//  MovieWiki
//
//  Created by Álvaro Perera on 27/1/25.
//

import UIKit

class MovieDetailTableViewController : UITableViewController {
    var imdbID: String?
    var movie: Movie?
    
    @IBOutlet var detailTableView: UITableView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieTitulo: UILabel!
    @IBOutlet weak var movieDuracion: UILabel!
    @IBOutlet weak var movieSinopsis: UILabel!
    @IBOutlet weak var moviePais: UILabel!
    @IBOutlet weak var movieGenero: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovieData()
        
    }
    
    func loadMovieData(){
        Task {
            do {
                self.movie = try await OpenMovieDBAPIHelper.getMovieByImdbID(imdbID: self.imdbID!)
                DispatchQueue.main.async {
                    self.posterImageView.loadFrom(url: URL(string: self.movie!.Poster)!)
                    self.movieYear.text = self.movie!.Year
                    self.movieTitulo.text = self.movie!.Title
                    self.movieDirector.text = self.movie!.Director
                    self.movieGenero.text = self.movie!.Genre
                    self.moviePais.text = self.movie!.Country
                    self.movieDuracion.text = self.movie!.Runtime
                    self.movieSinopsis.text = self.movie!.Plot
                    self.detailTableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
    }
}
