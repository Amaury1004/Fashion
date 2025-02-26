import UIKit

class ButtonCell: UITableViewCell {
    
    
    let buttonFrame = UIButton(type: .system)
    var model: BlogCellViewLoad?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupConstraints() {
        
        contentView.addSubview(buttonFrame)
        
        buttonFrame.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            buttonFrame.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            buttonFrame.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            buttonFrame.widthAnchor.constraint(equalToConstant: 211),
            buttonFrame.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    func configure(model: BlogCellViewLoad) {
        self.model = model
        
        buttonFrame.setTitle(model.title, for: .normal)
        buttonFrame.tintColor = .black
        buttonFrame.layer.borderWidth = 2
        buttonFrame.layer.borderColor = UIColor.lightGray.cgColor
        buttonFrame.layer.cornerRadius = 8
        
        setupConstraints()
        
        
        
    }
}
