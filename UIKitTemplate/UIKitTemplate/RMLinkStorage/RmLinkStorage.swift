// RmLinkStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель хранения контента
struct RMLinkStorage {
    let stories: [Stories] = [
        .init(avatarName: "avatar", isWatched: true, login: "Ваша история"),
        .init(avatarName: "avatarPeople", isWatched: false, login: "lavanda123"),
        .init(avatarName: "avatarPeople", isWatched: false, login: "Xomyak37"),
        .init(avatarName: "avatarPeople", isWatched: true, login: "Ios Developer"),
        .init(avatarName: "avatarPeople", isWatched: true, login: "Kung Fu")
    ]
    let posts: [Post] = [
        .init(
            avatarName: "avatarUserDagestan",
            login: "tur_v_dagestan",
            postImagesName: ["hills", "hillsTwo"],
            likeCount: 201,
            postDiscription: "Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!",
            isLikePress: false
        )
    ]
    let recomend: [Recomendation] = [
        .init(avatar: "crimea", login: "сrimea_082", isSubscribed: false),
        .init(avatar: "mary", login: "mary_pol", isSubscribed: false)
    ]

    let otherPost: [Post] = [
        .init(
            avatarName: "avatarUserDagestan",
            login: "AnzorikSuper",
            postImagesName: ["carImage"],
            likeCount: 598,
            postDiscription: "моя приора лайба",
            isLikePress: false
        )
    ]

    var cellPicture: [NotificationCellPicture] = [
        .init(
            image: "avatarPeople",
            userLogin: "Lavanda123",
            postDiscription: "понравился ваш комментарий: Очень красиво! 12ч",
            dateComent: "12ч",
            postPicture: "hills"
        ),
        .init(
            image: "avatarPeople",
            userLogin: "Lavanda123",
            postDiscription: "lavanda123 упомянул(-а) вас в комментарии: @rm Спасибо!",
            dateComent: "12ч",
            postPicture: "hills"
        )
    ]

    var cellButton: [NotificationCellButton] = [
        .init(
            avatar: "avatarPeople",
            userLogin: "Lavanda123",
            postDiscription: "понравился ваш комментарий: Это где? 3д.",
            dateComent: "3д.",
            isPressed: false
        ),
        .init(
            avatar: "dimonUser",
            userLogin: "12miho",
            postDiscription: "появился(-ась) в RMLink. Вы можете быть знакомы",
            dateComent: "3д.",
            isPressed: false
        ),
        .init(
            avatar: "avatarPeople",
            userLogin: "Lavanda123",
            postDiscription: "понравился ваш комментарий: Ты вернулась?",
            dateComent: "7д.",
            isPressed: true
        )
    ]
}
