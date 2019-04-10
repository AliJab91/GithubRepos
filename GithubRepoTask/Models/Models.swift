//
//  Models.swift
//  GithubRepoTask
//
//  Created by Ali Jaber on 4/10/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import Foundation

struct GithubRepository {
    var id: Int?
    var nodeId: String?
    var name: String?
    var fullName: String?
    var privt: Bool?
    var owner: Owner?
    var htmlURL: String?
    var descript: String?
    var fork: Bool?
    var url: String?
    var forkURL: String?
    var keysURL: String?
    var collaboratorURL: String?
    var createdAt: String?
    var updatedAt: String?
    var pushedAt: String?
    var homePage: String?
    var size: Int?
    var startGrazersCount: Int?
    var watchersCount: Int?
    var language: String?
    var hasIssue: Bool?
    var hasProject: Bool?
    var hasDownload:Bool?
    var hasWiki: Bool?
    var hasPage: Bool?
    var forksCont: Int?
    var mirrorURL: String?
    var archived: Bool?
    var openIssueCount: Int?
    var license: License?
    var forks: Int?
    var openIssues: Int?
    var watchers: Int?
    var defaultBranch: String?
    var score: Int?
    init(with json:[String:Any]) {
        self.id = json[.id] as? Int
        self.nodeId = json[.node_id] as? String
        self.name = json[.name] as? String
        self.fullName = json[.full_name] as? String
        self.privt = json[.privat] as? Bool
        self.owner = Owner.init(with: json[.owner] as! [String: Any])
        self.htmlURL = json[.html_url] as? String
        self.descript = json[.description] as? String
        self.fork = json[.fork] as? Bool
        self.url = json[.url] as? String
        self.forkURL = json[.forks_url] as? String
        self.keysURL = json[.keys_url] as? String
        self.collaboratorURL = json[.collaborators_url] as? String
        self.createdAt = json[.created_at] as? String
        self.updatedAt = json[.updated_at] as? String
        self.pushedAt = json[.pushed_at] as? String
        self.homePage = json[.homepg] as? String
        self.size = json[.size] as? Int
        self.startGrazersCount = json[.stargazers_count] as? Int
        self.watchersCount = json[.watchers_count] as? Int
        self.language = json[.language] as? String
        self.hasIssue = json[.has_issues] as? Bool
        self.hasProject =  json[.has_projects] as? Bool
        self.hasDownload = json[.has_downloads] as? Bool
        self.hasWiki = json[.has_wiki] as? Bool
        self.hasPage =  json[.has_pages] as? Bool
        self.forksCont =  json[.forks_count] as? Int
        self.mirrorURL = json[.mirror_url] as? String
        self.archived = json[.archived] as? Bool
        self.openIssueCount = json[.open_issues_count] as? Int
        if let jsonData = json[.licence] as? [String:Any]{
            self.license = License.init(with: jsonData)
        }
        self.forks = json[.forks] as? Int
        self.openIssues = json[.open_issues] as? Int
        self.watchers = json[.watchers] as? Int
        self.defaultBranch = json[.default_branch] as? String
        self.score = json[.score] as? Int
    }
}


struct Owner {
    var login:String?
    var id:Int?
    var nodeId:String?
    var avatarURL:String?
    var gravatarId:String?
    init(with json:[String:Any]) {
        self.login = json[.login] as? String
        self.id = json[.id] as? Int
        self.nodeId = json[.node_id] as? String
        self.avatarURL = json[.avatar_url] as? String
        self.gravatarId = json[.gravatar_id] as? String
    }
}

struct License {
    var key:String?
    var name:String?
    var spdxId:String?
    var url:String?
    var nodeId:String?
    init(with json:[String:Any]) {
        self.key = json[.key] as? String
        self.name = json[.name] as? String
        self.spdxId = json[.spdx_id] as? String
        self.url = json[.url] as? String
        self.nodeId = json[.node_id] as? String
    }
}

extension GithubRepository {
    var starAbbreviation: String {
        if let star = self.startGrazersCount?.formatUsingAbbrevation() {
            return star
        }
        return ""
    }
}

