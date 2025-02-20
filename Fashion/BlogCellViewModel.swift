import UIKit

struct BlogCellViewModel {
    let image: String
    let title: String
    let description: String
    let time: String
    
    
}

extension BlogCellViewModel {
    static func mockData() -> [BlogCellViewModel] {
        return [BlogCellViewModel(image: "image1.jpg",
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

