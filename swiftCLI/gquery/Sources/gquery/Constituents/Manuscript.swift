
public protocol Manuscript: Constituent {
    var id: Int { get }
    var constituentName: String { get }
    var zip: String? { get }
    var title: String { get }
    var imageName: String? { get }
    var type: String? { get }
}
