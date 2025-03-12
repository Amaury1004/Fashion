import UIKit 

class BlogCell: UITableViewCell {
    
    private let memImage = UIImageView()
    private let label = UILabel()
    private let descriptionLabel = UILabel()
    private let descriptionLabel2 = UILabel()
    private let time = UILabel()
    private let imageSetup = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [memImage, label, descriptionLabel, descriptionLabel2, time, imageSetup].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: BlogCellViewModel) {
        label.text = model.title
        descriptionLabel.text = model.description
        descriptionLabel2.text = model.description2
        let formaters = DateFormatter()
        formaters.dateFormat = "dd-MM-yyyy"
        formaters.locale = Locale(identifier: "uk_UA")
        time.text = ("Posted by OpenFashion |   ") + formaters.string(from: model.time)
        
        
        descriptionLabel.numberOfLines = 13
        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionLabel.font = UIFont(name: "TenorSans-Regular", size: 14)
        descriptionLabel.textColor = .gray
        
        descriptionLabel2.numberOfLines = 13
        descriptionLabel2.lineBreakMode = .byTruncatingTail
        descriptionLabel2.font = UIFont(name: "TenorSans-Regular", size: 14)
        descriptionLabel2.textColor = .gray
        
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFont(name: "TenorSans-Regular", size: 18)
        label.textColor = .darkGray
        
        time.textColor = .lightGray
        time.font = UIFont.systemFont(ofSize: 12)
        
        imageSetup.image = UIImage(named: model.image ?? "defaultImage")
        memImage.image = UIImage(named: "surv")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            memImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            memImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            memImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            memImage.heightAnchor.constraint(equalToConstant: 221),
            
            label.topAnchor.constraint(equalTo: memImage.bottomAnchor, constant: 9),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 9),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            imageSetup.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            imageSetup.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageSetup.heightAnchor.constraint(equalToConstant: (400/1.5)),
            imageSetup.widthAnchor.constraint(equalToConstant: (342/1.5)),
            
            descriptionLabel2.topAnchor.constraint(equalTo: imageSetup.bottomAnchor, constant: 9),
            descriptionLabel2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            time.topAnchor.constraint(equalTo: descriptionLabel2.bottomAnchor, constant: 9),
            time.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            time.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

