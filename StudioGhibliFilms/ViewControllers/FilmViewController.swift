//
//  ViewController.swift
//  StudioGhibliFilms
//
//  Created by Keshawn Swanston on 11/27/17.
//  Copyright © 2017 Caroline Cruz. All rights reserved.
//

import UIKit

class FilmViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {
    
    
    var films: [Film] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var searchTerm: String? {
        didSet {
            self.tableView.reloadData()
        }
    }
    var filteredFilmArr: [Film] {
        guard let searchTerm = searchTerm, searchTerm != "" else {
            return films
        }
        return films.filter{$0.title.lowercased().contains(searchTerm.lowercased())}
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        loadData()
    }

    func loadData() {
        let urlStr = "https://ghibliapi.herokuapp.com/films"
        let setFilmToOnlineFilm: ([Film]) -> Void = {(onlineFilm: [Film]) in
            self.films = onlineFilm
        }
        FilmAPI.manager.getFilm(from: urlStr, completionHandler: setFilmToOnlineFilm, errorHandler: {print($0)})
    }
 

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return filteredFilmArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let film = filteredFilmArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Film Cell", for: indexPath)
        cell.textLabel?.text = film.title
        cell.detailTextLabel?.text = film.release_date
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = searchBar.text ?? ""
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchText
    }
    
    // MARK: - Navigation
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FilmDetailViewController {
            destination.film = filteredFilmArr[self.tableView.indexPathForSelectedRow!.row]
        }
    }

}

