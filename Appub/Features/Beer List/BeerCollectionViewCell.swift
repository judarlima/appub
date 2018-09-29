import UIKit
import Kingfisher

class BeerCollectionViewCell: UICollectionViewCell, ConfigurableCell {
  
  typealias ViewModel = BeerCollectionViewModel
  
  @IBOutlet private weak var beerImage: UIImageView!
  @IBOutlet private weak var beerNameLabel: UILabel!
  @IBOutlet private weak var beerAbvLabel: UILabel!
  @IBOutlet private weak var containerView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    makeRounded()
  }
  
  func bind(_ item: BeerCollectionViewCell.ViewModel, at indexPath: IndexPath) {
    let imageURL = URL(string: item.beerImage)
    beerImage.kf.setImage(with: imageURL)
    beerNameLabel.text = "name: " + item.beerNameLabel
    beerAbvLabel.text = "abv: " + item.beerAbvLabel
  }
  
  private func makeRounded() {
    containerView.layer.cornerRadius = 6
    containerView.layer.masksToBounds = true
  }
}
