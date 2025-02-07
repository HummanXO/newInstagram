import Foundation

enum NotificationType {
    case like
    case comment
    case followRequest
    case suggestedFriend
}

struct NotificationItem {
    let type: NotificationType
    let userName: String
    let message: String
    let profileImage: String
}

struct NotificationSection {
    let title: String
    let items: [NotificationItem]
}
