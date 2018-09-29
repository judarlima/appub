import Foundation

public class ArrayDataProvider<ViewModel>: CollectionDataProvider {
  var items: [[ViewModel]] = []
  
  init(array: [[ViewModel]]) {
    items = array
  }
  
  public func numberOfSections() -> Int {
    return items.count
  }
  
  public func numberOfItems(in section: Int) -> Int {
    guard section >= 0 && section < items.count else { return 0 }
    return items[section].count
  }
  
  public func item(at indexPath: IndexPath) -> ViewModel? {
    guard isOutOfBounds(indexPath: indexPath) else { return nil }
    return items[indexPath.section][indexPath.row]
  }
  
  public func updateItem(at indexPath: IndexPath, value: ViewModel) {
    guard isOutOfBounds(indexPath: indexPath) else { return }
    items[indexPath.section][indexPath.row] = value
  }
  
  private func isOutOfBounds(indexPath: IndexPath) -> Bool {
    return !(indexPath.section >= 0 &&
      indexPath.section < items.count &&
      indexPath.row >= 0 &&
      indexPath.row < items[indexPath.section].count)
  }
}
