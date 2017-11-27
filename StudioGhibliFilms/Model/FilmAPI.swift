//
//  FilmAPI.swift
//  StudioGhibliFilms
//
//  Created by Keshawn Swanston on 11/27/17.
//  Copyright © 2017 Caroline Cruz. All rights reserved.
//

import Foundation

class FilmAPI{
    private init() {}
    static let manager = FilmAPI()
    func getFilm(from urlStr: String,
                  completionHandler: @escaping ([Film]) -> Void,
                  errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let film = try JSONDecoder().decode([Film].self, from: data)
                completionHandler(film)
            }
            catch let error {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url,
                                              completionHandler: completion,
                                              errorHandler: errorHandler)
    }
}
