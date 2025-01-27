//
//  ViewController.swift
//  MovieWiki
//
//  Created by Álvaro Perera on 27/1/25.
//

import UIKit

class MovieSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var moviesResponseTableView: UITableView!
    
    var movieItems: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        moviesResponseTableView.dataSource = self
        moviesResponseTableView.delegate = self
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        //navigationItem.searchController = searchController
        
        loadFirstData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieResponseTableViewCell
        let movieResponse = movieItems[indexPath.row]
        cell.fillCell(from: movieResponse)
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text {
            searchMovieByName(name: query)
        } else {
            loadFirstData()
        }
    }
    
    func searchMovieByName(name: String){
        Task {
            do {
                self.movieItems = try await OpenMovieDBAPIHelper.getMoviesBySearchName(name: name)
                DispatchQueue.main.async {
                    self.moviesResponseTableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
    }
    
    
    func loadFirstData(){
        searchMovieByName(name: "Harry Potter")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMovieDetail" {
            if let indexPath = moviesResponseTableView.indexPathForSelectedRow {
                let movieID = movieItems[indexPath.row].imdbID
                let destinationVC = segue.destination as? MovieDetailTableViewController
                destinationVC?.imdbID = movieID }
        }
    }
}
