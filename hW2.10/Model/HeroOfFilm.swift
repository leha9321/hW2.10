//
//  HeroOfFilm.swift
//  hW2.10
//
//  Created by Алексей Трофимов on 28.11.2021.
//

struct HeroOfFilm: Decodable {
    let name: String?
    let gender: String?
    let culture: String?
    let born: String?
    func hero(fail: HeroOfFilm)->[String?] {
        return [name.self, gender.self, culture.self, born.self]
    }
}

