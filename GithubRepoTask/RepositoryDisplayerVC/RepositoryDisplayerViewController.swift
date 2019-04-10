//
//  RepositoryDisplayerViewController.swift
//  GithubRepoTask
//
//  Created by Ali Jaber on 4/10/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import UIKit

class RepositoryDisplayerViewController: UIViewController {

    @IBOutlet public weak var tableView: UITableView!
    private let viewModel = RepositoryDisplayerViewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
    }
    
    private func bindViewModel() {
        // listen to isLoading and show/hide loader based on it
        viewModel.isLoading = { [weak self] isLoading in
            guard let self = self else { return }
            isLoading ? self.showloader() : self.hideLoader()
        }
        // listen to didFinishFetching, if there is an error handle it, else reload table
        viewModel.didFinishFetching = { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                // show some error alert
            } else {
                self.tableView.reloadData()
            }
        }
        // after we created listeners, we tell the model to fetch the repos
        viewModel.fetchRepos()
    }
    
    private func setupTableView()  {
        tableView.tableFooterView = .init()
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "RepositoryCell", bundle: nil), forCellReuseIdentifier: "repoCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension RepositoryDisplayerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // ask the viewmodel to increment the page
        if indexPath.row == viewModel.numberOfRowsInSection - 3 {
            viewModel.incrementPage()
        }
        
        let repoCell = tableView.dequeueReusableCell(withIdentifier: "repoCell") as? RepositoryCell
        let repo = viewModel.repository(for: indexPath.row)
        repoCell?.fill(with: repo)
        return repoCell!
    }
}
