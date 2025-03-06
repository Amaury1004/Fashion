import UIKit

class CustomSeparator: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUi()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUi() {
        let lineView = UIView()
        lineView.backgroundColor = .lightGray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lineView)
        
        let diamondView = UIView()
        diamondView.backgroundColor = .white
        diamondView.layer.borderColor = UIColor.lightGray.cgColor
        diamondView.layer.borderWidth = 1
        diamondView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(diamondView)
        
        NSLayoutConstraint.activate([
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            diamondView.widthAnchor.constraint(equalToConstant: 12),
            diamondView.heightAnchor.constraint(equalToConstant: 12),
            diamondView.centerXAnchor.constraint(equalTo: centerXAnchor),
            diamondView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        diamondView.transform = CGAffineTransform(rotationAngle: .pi / 4)
    
    }
    
}
