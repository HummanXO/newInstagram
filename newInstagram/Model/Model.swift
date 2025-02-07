import Foundation

struct Post {
    var name: String
    var avatarImage: String
    var image: String
    var description: String
    
    init(name: String, avatarImage: String, image: String, description: String) {
        self.name = name
        self.avatarImage = avatarImage
        self.image = image
        self.description = name + " " + description
    }
}
