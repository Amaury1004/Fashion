import UIKit

protocol ReloadDateDelegate: AnyObject {
    func reloadData()
}

class ButtonCell: UITableViewCell {
    
    
    let buttonFrame = UIButton(type: .system)
    var model: BlogCellViewLoad?
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .bold, scale: .large)
    
    
    
    weak var delegate: ReloadDateDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 24, weight:.light, scale:.default)
        let plusImage = UIImage(systemName: "plus")?.withConfiguration(largeConfig)
        
        buttonFrame.addTarget(self, action: #selector(reloadingDate), for: .touchUpInside)
        
        
        buttonFrame.setImage(plusImage, for: .normal)
        buttonFrame.semanticContentAttribute = .forceRightToLeft
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
        buttonFrame.layer.borderWidth = 1
        buttonFrame.layer.borderColor = UIColor.lightGray.cgColor
        
        
        
        setupConstraints()
        
        
        
    }
    @objc func reloadingDate(sender: UIButton) {
        delegate?.reloadData()
    }
}
