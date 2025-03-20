import UIKit

class BlogCell: UITableViewCell {
    
    let label = UILabel()
    let descriptionLabel = UILabel()
    let descriptionLabel2 = UILabel()
    let time = UILabel()
    let scrol = UIScrollView()
    let pageControl = UIPageControl()
    var images: [String] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [label, descriptionLabel, descriptionLabel2, time, scrol, pageControl].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        setupScrollView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: BlogCellViewModel) {
        label.text = model.title
        label.lineBreakMode = .byWordWrapping
        descriptionLabel.text = model.description
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel2.text = model.description2
        descriptionLabel2.lineBreakMode = .byWordWrapping
        let formaters = DateFormatter()
        formaters.dateFormat = "dd-MM-yyyy"
        formaters.locale = Locale(identifier: "uk_UA")
        time.text = ("Posted by OpenFashion |   ") + formaters.string(from: model.time)
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionLabel.font = UIFont(name: "TenorSans-Regular", size: 14)
        descriptionLabel.textColor = .gray
        
        descriptionLabel2.numberOfLines = 0
        descriptionLabel2.lineBreakMode = .byTruncatingTail
        descriptionLabel2.font = UIFont(name: "TenorSans-Regular", size: 14)
        descriptionLabel2.textColor = .gray
        
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFont(name: "TenorSans-Regular", size: 18)
        label.textColor = .darkGray
        
        time.textColor = .lightGray
        time.font = UIFont.systemFont(ofSize: 12)
        
        if let imageSet = model.imageSet {
            images = imageSet
            setupImageScrollView()
        }
    }
    
     func setupScrollView() {
        scrol.isPagingEnabled = true
        scrol.showsHorizontalScrollIndicator = false
        scrol.delegate = self
    }
    
     func setupImageScrollView() {
        scrol.subviews.forEach { $0.removeFromSuperview() }
        
        for (index, imageName) in images.enumerated() {
            let imageView = UIImageView()
            imageView.image = UIImage(named: imageName)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            scrol.addSubview(imageView)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalTo: scrol.heightAnchor).isActive = true
            imageView.widthAnchor.constraint(equalTo: scrol.widthAnchor).isActive = true
            imageView.leadingAnchor.constraint(equalTo: scrol.leadingAnchor, constant: CGFloat(index) * scrol.frame.width).isActive = true
        }
        
        scrol.contentSize = CGSize(width: CGFloat(images.count) * scrol.frame.width, height: scrol.frame.height)
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
    }
    
     func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            label.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            scrol.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            scrol.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            scrol.heightAnchor.constraint(equalToConstant: 200),
            scrol.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            descriptionLabel2.topAnchor.constraint(equalTo: scrol.bottomAnchor, constant: 10),
            descriptionLabel2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            time.topAnchor.constraint(equalTo: descriptionLabel2.bottomAnchor, constant: 10),
            time.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            time.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            pageControl.topAnchor.constraint(equalTo: scrol.bottomAnchor, constant: 10),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}

extension BlogCell: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = page
    }
}
