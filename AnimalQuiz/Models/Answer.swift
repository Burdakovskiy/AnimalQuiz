//
//  Answer.swift
//  AnimalQuiz
//
//  Created by Дмитрий on 23.11.2021.
//

struct Answer {
    let text: String
    let type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var description: String {
        switch self {
        case .dog:
            return "Вам нравиться быть с друзьями. Вы окуружаете себя людьми, которые Вам нравяться и всегда готовы помочь!"
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себе. Цените одиночество!"
        case .rabbit:
            return "Вам нравиться все моягкое. Вы полны здоровья и енергии!"
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на длительных дистанциях!"
        }
    }
}
