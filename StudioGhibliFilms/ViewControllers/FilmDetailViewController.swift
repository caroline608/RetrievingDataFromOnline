//
//  FilmDetailViewController.swift
//  StudioGhibliFilms
//
//  Created by Keshawn Swanston on 11/27/17.
//  Copyright © 2017 Caroline Cruz. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController {
    
    var film: Film!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var directorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = film.title
        nameLabel.text = film.title
        peopleLabel.text = String(describing: film.people)
        releaseDateLabel.text = film.release_date
        producerLabel.text = film.producer
        descriptionTextView.text = film.description
        directorLabel.text = film.director
    
    }
  
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
