import UIKit

class FashionCell: UITableViewCell {
    
    let customImageView = UIImageView()
    let title = UILabel()
    let descriptionLabel = UILabel()
    let time = UILabel()
    
    var model: BlogCellViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        
        [customImageView,title,descriptionLabel,time].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            customImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            title.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 12),
            title.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10.2),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 12),
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0.25),
            
            time.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 12),
            time.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 1)
            
            ])
    }
    
    func configure(blogRow: BlogCellViewModel) {
        self.model = blogRow
        
        customImageView.image = UIImage(named: blogRow.image)
        
        title.text = blogRow.title
        
        descriptionLabel.text = blogRow.description
        
        time.text = blogRow.time
        
        setupCell()
        setupConstraints()
        
    }
    
}
