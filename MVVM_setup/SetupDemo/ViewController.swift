
import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var movieDataSource:MovieDataSource? {
        didSet{
            tableView.dataSource = movieDataSource
            tableView.delegate = movieDataSource
            self.tableView.reloadData()
        }
    }
    
    var movieResult:MovieFeedResult?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(MovieCellTableViewCell.self)
        self.tableView.register(MenuCell.self)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension

        MovieClient.sharedClient.getFeed(from: .nowPlaying) { result in
            switch result {
            case .success(let movieFeedResult):

                guard let movieResults = movieFeedResult?.results else { return }
                print(movieResults)
                self.movieResult = movieFeedResult
                self.movieDataSource = MovieDataSource(movies: movieResults)
            case .failure(let error):
                print("the error \(error)")
            }
        }
    }
}

