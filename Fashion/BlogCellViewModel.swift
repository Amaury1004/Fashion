import UIKit

protocol CellViewModelProtocol {}

struct BlogCellViewModel: CellViewModelProtocol {
    let image: String?
    let title: String
    let description: String
    let time: String
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


extension BlogCellViewModel {
    static func mockData() -> [BlogCellViewModel] {
        return [BlogCellViewModel(image: "image1",
                                  title: "2021 STYLE GUIDE: THE BIGGEST FALL TRENDS",
                                  description: "The excitement of fall fashion is here and I’m already loving some of the trend forecasts",
                                  time:"4 days ago" ),
                BlogCellViewModel(image: "image2.jpg" ,
                                  title: "3 PAIRS OF DENIM YOU WON’T BELIEVE" ,
                                  description:"The excitement of fall fashion is here and I’m already loving some of the trend forecasts" ,
                                  time: "5 days ago" ),
                        
                BlogCellViewModel(image:"image3.jpg" ,
                                  title:"5 FALL LOOKS I’M LOVING" ,
                                  description:"The excitement of fall fashion is here and I’m already loving some of the trend forecasts" ,
                                  time:"01/11/2021" ),
                        
                BlogCellViewModel(image:"image4.jpg" ,
                                  title:"5 FALL BOOT TRENDS YOU NEED TO TRY" ,
                                  description:"The excitement of fall fashion is here and I’m already loving some of the trend forecasts" ,
                                  time: "25/10/2021"),
                        
                BlogCellViewModel(image:"image5.jpg" ,
                                  title:"2021 STYLE GUIDE: THE BIGGEST FALL TRENDS" ,
                                  description:"The excitement of fall fashion is here and I’m already loving some of the trend forecasts" ,
                                  time: "16/10/2021"),
                        
                BlogCellViewModel(image:"image6.jpg" ,
                                  title: "3 PAIRS OF DENIM YOU WON’T BELIEVE",
                                  description:"The excitement of fall fashion is here and I’m already loving some of the trend forecasts" ,
                                  time: "10/10/2021"),
                        
        ]
    
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

enum BlogSection {
    case title(BlogCellViewTitle)
    case categories([BlogCellViewScroll])
    case posts([BlogCellViewModel])
    case loadMore(BlogCellViewLoad)
    case socialLinks([BlogCellViewSocial])
}


