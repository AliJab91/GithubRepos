//
//  WebRequests.swift
//  GithubRepoTask
//
//  Created by Ali Jaber on 4/10/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import Foundation
import Foundation
import Alamofire
enum URLStrings {
    static let loginUrl = "https://api.github.com/search/repositories"
    
}
class APIRequests  {
    // static var repositoryViewController: RepositoryDisplayerViewController!
    fileprivate static func getRequest (urlString: String!, parameters: Parameters? ,method:HTTPMethod , headers: HTTPHeaders? , completion: @escaping (Bool, Error?,String?,DataResponse<Any>?) ->()) {
        Alamofire.request(urlString, method: method, parameters: parameters, headers: nil).responseJSON { (response) in
            let success = checkIfSucccess(response: response)
            if(!success){
                completion(success, nil, nil, response)
            }else {
                completion (success,response.error, "FAILED",nil)
            }
            
        }
    }
    /// CHECK IF SUCCESS, IF RETURNED FALSE, MEANS WE GOT THE DATA, INCOMPLETE RESULTS = FALSE, ELSE, ERROR OCCURED
    fileprivate static func checkIfSucccess(response: DataResponse<Any>!) -> Bool {
        if let responseDict = response.result.value as? [String:Any] {
            print(responseDict)
            if let repoResult = responseDict["incomplete_results"] as? Bool {
                return  repoResult
            }else {
                return  true
            }
        }else {
            return true
        }
    }
    
    ///GET REPOSITORIES API
    static func getRepositories (page: Int ,date: String , completion : @escaping(Bool,String,Array<GithubRepository>)-> ()) {
        let parameters:Parameters = ["q":String(date),"page":String(page),"sort":"stars","order":"desc"] as [String:Any]
        getRequest(urlString: URLStrings.loginUrl, parameters: parameters,  method: .get, headers:nil) { (success, error, errorMsg, response) in
            if success == false {
                guard let dataDictionary = response?.result.value as? [String: Any] else {
                    return
                }
                if let items = dataDictionary["items"] as! [Any]?  {
                    var tempArray = Array<GithubRepository>()
                    for data in items {
                        let repo = GithubRepository.init(with: data as! Dictionary<String,Any>)
                        tempArray.append(repo)
                    }
                    let allRepos = Array<GithubRepository>.init(tempArray)
                    completion(true,"Success",allRepos)
                }else {
                    completion(false,"Error",[] )
                }
                
            }else {
                completion(false,"Error",[] )
            }
        }
    }
}
