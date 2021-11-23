//
//  Question.swift
//  AnimalQuiz
//
//  Created by Дмитрий on 23.11.2021.
//

enum ResponseType {
    case single, multiple, range
}

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(
                text: "Какую пищу Вы предпочитаете?",
                type: .single,
                answers: [
                    Answer(text: "Стейк", type: .dog),
                    Answer(text: "Рыба", type: .cat),
                    Answer(text: "Морковь", type: .rabbit),
                    Answer(text: "Кукуруза", type: .turtle)
                ]
            ),
            Question(
                text: "Что Вы любите делать?",
                type: .multiple,
                answers: [
                    Answer(text: "Плавать", type: .dog),
                    Answer(text: "Спать", type: .cat),
                    Answer(text: "Обниматься", type: .rabbit),
                    Answer(text: "Есть", type: .turtle)
                ]
            ),
            Question(
                text: "Любите ли Вы поездки на машине?",
                type: .range,
                answers: [
                    Answer(text: "Обожаю", type: .dog),
                    Answer(text: "Люблю", type: .cat),
                    Answer(text: "Не люблю", type: .rabbit),
                    Answer(text: "Ненавижу", type: .turtle)
                ]
            )
        ]
    }
}
