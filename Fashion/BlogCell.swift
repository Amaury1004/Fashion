import UIKit


class BlogCell: UITableViewCell {
    
    var model: BlogCellViewModel?
    let imageSetup = UIImageView()
    let title = UILabel()
    let descriptionLabel = UILabel()
    let time = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        contentView.addSubview(imageSetup)
        contentView.addSubview(title)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(time)
        
        
        imageSetup.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        time.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            imageSetup.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            imageSetup.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageSetup.widthAnchor.constraint(equalToConstant: 120),
            imageSetup.heightAnchor.constraint(equalToConstant: 155),
            
            title.topAnchor.constraint(equalTo: imageSetup.topAnchor),
            title.leadingAnchor.constraint(equalTo: imageSetup.trailingAnchor,constant: 12),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 3),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageSetup.trailingAnchor, constant: 12),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -16),
            
            time.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 3),
            time.leadingAnchor.constraint(equalTo: imageSetup.trailingAnchor, constant: 12),
            time.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -16),
        
        ])
    }
    
    func configure(model: BlogCellViewModel) {
        self.model = model
        
        imageSetup.image = UIImage(named: model.image!)
        title.text = model.title
        descriptionLabel.text = model.description
        time.text = model.time
        
        descriptionLabel.numberOfLines = 5
        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        
        title.numberOfLines = 3
        title.lineBreakMode = .byTruncatingTail
        
        
        time.textColor = .lightGray
        time.font = UIFont.systemFont(ofSize: 12)
        
        
        setConstraints()
        
    }
}
