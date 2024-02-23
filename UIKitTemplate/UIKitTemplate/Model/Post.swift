// Post.swift
// Copyright © RoadMap. All rights reserved.

///  наших постов
struct Post {
    /// Аватар
    let avatarName: String
    /// Логин
    let login: String
    /// Картинки в посте
    let postImagesName: [String]
    /// Количество лайков на посте
    let likeCount: Int
    /// Описание поста
    let postDiscription: String
    /// Поставлен ли лайк
    let isLikePress: Bool
}
