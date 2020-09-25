//
//  LoginService.swift
//  Quickstart
//
//  Created by Salil on 25/09/20.
//  Copyright © 2020 Salil. All rights reserved.
//

import Foundation
import PromisedFuture

struct LoginService {
    func getPosts() -> Future<Posts, Error> {
        return ApiRequest.performRequest(route: APIRouter.posts)
    }
}
