

import UIKit

class LabelCell: UITableViewCell  {
    
    
    
    
    let identifer = "FirstLabelCEll"
    
    let label = UILabel()
    let separator = CustomSeparator()
    
    var model: BlogCellViewTitle?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(separator)
        
        setupConstraints()
        
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configure(with viewModel: BlogCellViewTitle) {
        self.model = viewModel
        
        label.text = viewModel.title
        label.font = UIFont(name: "TenorSans-Regular", size: 18)
        
        
    }
    
    func setupConstraints() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            separator.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -120),
            separator.heightAnchor.constraint(equalToConstant: 1)
            
        
        ])
    }
    
}


