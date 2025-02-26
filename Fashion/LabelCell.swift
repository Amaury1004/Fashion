

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
        
        
    }
    
    func setupConstraints() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            separator.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            separator.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: -48),
            separator.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: 48),
            separator.heightAnchor.constraint(equalToConstant: 1)
            
        
        ])
    }
    
}


