import UIKit

protocol CellViewModelProtocol {}

struct BlogCellViewModel: CellViewModelProtocol {
    let image: String?
    let title: String
    let description: String
    let time: Date
    let description2: String?
    let imageSet: [String]?
}

struct DateModel {
    static let calendar = Calendar.current
    
    static let post1: Date = calendar.date(from: DateComponents(year: 2025, month: 4, day: 6)) ?? Date()
    static let post2: Date = calendar.date(from: DateComponents(year: 2025, month: 4, day: 5)) ?? Date()
    static let post3: Date = calendar.date(from: DateComponents(year: 2021, month: 10, day: 25)) ?? Date()
    static let post4: Date = calendar.date(from: DateComponents(year: 2021, month: 10, day: 16)) ?? Date()
    static let post5: Date = calendar.date(from: DateComponents(year: 2021, month: 10, day: 10)) ?? Date()
    static let post6: Date = calendar.date(from: DateComponents(year: 2021, month: 11, day: 10)) ?? Date()

}

enum ContentBlog: Int {
    case one = 1
    case two
    case three
    case four
    case five
    case six
}

enum Section: Int, CaseIterable {
    case title
    case scroll
    case blogs
    case button
    case social
    
}





struct BlogCellViewTitle: CellViewModelProtocol {
    let title: String
}
struct BlogCellViewScroll: CellViewModelProtocol {
    let title: String
}
struct BlogCellViewLoad: CellViewModelProtocol{
    let title: String
}
struct BlogCellViewSocial: CellViewModelProtocol {
    let icon: String?
    
}

enum contentGuideBlog {
    case blog1, blog2, blog3, blog4, blog5, blog6
}


extension BlogCellViewModel {
    static func mockData() -> [BlogCellViewModel] {
        return [BlogCellViewModel(image: "image1",
                                  title: "World of Warcraft: Best Transmog Sets for Warriors",
                                  description: "A Warrior on the frontlines should be able to instill hope among their comrades",
                                  time: DateModel.post1,
                                  description2: "The armor itself features a wrap-around undersuit with muscle toning, giving the impression of micro-plates made to fit the player’s figure. The leg guards and gauntlets are more significant than the rest of the piece, as expected in Warcraft design tradition. Setting this armor apart are its pauldrons and headpiece, which seem to have plate-like protrusions that give the impression of wings. In turn, a Warrior can wear this armor to give the ambiance of a formally-trained knight — knowledgeable enough in martial affairs to be skilled in combat, but not too holy to be a Paladin",
                                  imageSet: ["war1","war2", "war3"]),
                BlogCellViewModel(image: "image2.jpg" ,
                                  title: "3 PAIRS OF DENIM YOU WON’T BELIEVE" ,
                                  description:"The excitement of fall fashion is here and I’m already loving some of the trend forecasts" ,
                                  time: DateModel.post2, description2: "", imageSet: nil ),
                        
                BlogCellViewModel(image:"image3.jpg" ,
                                  title:"5 FALL LOOKS I’M LOVING" ,
                                  description:"The excitement of fall fashion is here and I’m already loving some of the trend forecasts" ,
                                  time: DateModel.post3, description2: "", imageSet: nil),
                        
                BlogCellViewModel(image:"image4.jpg" ,
                                  title:"5 FALL BOOT TRENDS YOU NEED TO TRY" ,
                                  description:"The excitement of fall fashion is here and I’m already loving some of the trend forecasts" ,
                                  time: DateModel.post4, description2: "", imageSet: nil),
                        
                BlogCellViewModel(image:"image5.jpg" ,
                                  title:"2021 STYLE GUIDE: THE BIGGEST FALL TRENDS" ,
                                  description:"The excitement of fall fashion is here and I’m already loving some of the trend forecasts" ,
                                  time: DateModel.post5, description2: "", imageSet: nil),
                        
                BlogCellViewModel(image:"image6.jpg" ,
                                  title: "3 PAIRS OF DENIM YOU WON’T BELIEVE",
                                  description:"The excitement of fall fashion is here and I’m already loving some of the trend forecasts" ,
                                  time: DateModel.post6, description2: "", imageSet: nil),
                        
        ]
    
    }
}

extension BlogCellViewModel {
    static func randomBlog() -> [BlogCellViewModel] {
        let count = Int.random(in: 2...4)
        let blogModel = mockData()
        var result: [BlogCellViewModel] = []
        
        guard !blogModel.isEmpty else {
            return result
        }
        
        (0..<count).forEach { _ in
            if let randomElement = blogModel.randomElement() {
                result.append(randomElement)
            }
        }
        
        return result
    }
}




extension BlogCellViewTitle {
    static func setupTitle() -> BlogCellViewTitle {
        return BlogCellViewTitle(title: "BLOG")
    }
}

extension BlogCellViewScroll {
    static func setupScroll() -> [String] {
        return [
            "Fashion",
            "Promo",
            "Policy",
            "Lookbook",
            "Sale",
            "Стартовать",
            "За Вара",
            "Срочно",
            "!!!!!!!"
        ]
    }
}

extension BlogCellViewLoad {
    static func setupTLoad() -> BlogCellViewLoad {
        return BlogCellViewLoad(title: "LOAD MORE")
    }
}
    
extension BlogCellViewSocial {
    static func setupSocial() -> [BlogCellViewSocial] {
        return [BlogCellViewSocial(icon: "xmark"),
                BlogCellViewSocial(icon: "camera"),
                BlogCellViewSocial(icon: "play.rectangle"),
                ]
        }
    }

enum HeightForRow: Int {
    case sectionLabel = 0
    case sectionScroll = 1
    case sectionBlog = 2
    case sectionLoad = 3
    case sectionSocial = 4
    
    var height: CGFloat {
        switch self {
        case .sectionLabel: return 64
        case .sectionScroll: return 50
        case .sectionBlog: return 180
        case .sectionLoad: return 54
        case .sectionSocial: return 340
        }
    }
    
    static let defaultHeight: CGFloat = 100
}

