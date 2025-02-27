import UIKit

class SocialIconCell: UITableViewCell {
    
    let stackView = UIStackView()
    let stackView2 = UIStackView()
    let separator = CustomSeparator()
    let separator2 = CustomSeparator()
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        
        label.text = "support@openui.design\n+60 825 876\n08:00 - 22:00 - Everyday"
        label.textAlignment = .center
        label.numberOfLines = 3
        
        label.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator2.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        stackView.spacing = 45
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        stackView2.axis = .horizontal
        stackView2.spacing = 20
        stackView2.alignment = .center
        stackView2.distribution = .fillEqually
        
        contentView.addSubview(label)
        contentView.addSubview(separator)
        contentView.addSubview(stackView)
        
        
        contentView.addSubview(separator2)
        contentView.addSubview(stackView2)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant:  33),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            separator.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 36),
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -120),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            label.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 36),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            
            separator2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 36),
            separator2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120),
            separator2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -120),
            separator2.heightAnchor.constraint(equalToConstant: 1),
            
            stackView2.topAnchor.constraint(equalTo: separator2.bottomAnchor, constant: 32),
            stackView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            stackView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -40)
        ])
    }
    
    func configure(models: [BlogCellViewSocial]) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for model in models {
            let iconView = UIImageView()
            iconView.contentMode = .scaleAspectFit
            iconView.image = UIImage(systemName: model.icon!)
            iconView.widthAnchor.constraint(equalToConstant: 24).isActive = true
            iconView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            iconView.tintColor = .black
            stackView.addArrangedSubview(iconView)
            
        }
        for index in 0..<3 {
            let button = UIButton(type: .system)
            button.tintColor = .black
            
            switch index {
              case 0:
                  button.setTitle("About", for: .normal)
              case 1:
                  button.setTitle("Contact", for: .normal)
              case 2:
                  button.setTitle("Blog", for: .normal)
              default:
                  break
              }
            
            stackView2.addArrangedSubview(button)
            button.heightAnchor.constraint(equalToConstant: 44).isActive = true
            
        }
    }
}
