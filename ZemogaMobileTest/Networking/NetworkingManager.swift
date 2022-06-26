//
//  NetworkingManager.swift
//  ZemogaMobileTest
//
//  Created by Kevinho Morales on 26/6/22.
//

import Foundation

final class NetworkingManager {
    static let shared: NetworkingManager = {
        return NetworkingManager()
    }()
    
    internal func getPosts(completion: @escaping ([Posts]) -> ()) {
        Loading.show()
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let data = data,
               let response = response,
               error == nil {
                let httpResponse = response as! HTTPURLResponse
                if httpResponse.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let posts = try decoder.decode([Posts].self, from: data)
                        DispatchQueue.main.async {
                            Loading.hide()
                        }
                        print("GET POSTS")
                        completion(posts)
                    } catch (let error) {
                        print("Not parse object -> \(error.localizedDescription)")
                    }
                }
            } else {
                guard let error = error else { return }
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    internal func getCommentId(post: Posts, completion: @escaping (CommentId) -> ()) {
        Loading.show()
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments/\(post.id)") else { return }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let data = data,
               let response = response,
               error == nil {
                let httpResponse = response as! HTTPURLResponse
                if httpResponse.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let commentId = try decoder.decode(CommentId.self, from: data)
                        DispatchQueue.main.async {
                            Loading.hide()
                        }
                        print("GET COMMENT BY ID")
                        completion(commentId)
                    } catch (let error) {
                        print("Not parse object -> \(error.localizedDescription)")
                    }
                }
            } else {
                guard let error = error else { return }
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

    
}
