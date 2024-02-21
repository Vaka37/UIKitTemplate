// NotificationCellPicture.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Ячейка с фотокартчой
struct NotificationCellPicture {
    ///  Аватар
    let image: String
    /// Логин пользователя оставившего коментарий
    let userLogin: String
    /// Описание коментария
    let postDiscription: String
    /// Дата коментария
    let dateComent: String
    /// Пост который коментировали
    let postPicture: String
}
