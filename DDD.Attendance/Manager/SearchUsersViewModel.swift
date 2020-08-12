//
//  SearchUsersViewModel.swift
//  DDD.Attendance
//
//  Created by 최혜선 on 2020/07/18.
//  Copyright © 2020 DDD. All rights reserved.
//

import Foundation
import ReactiveSwift

protocol SearchUsersViewModelInputs {
    func remoteAttendanceStatus(name userName: String)
}

protocol SearchUsersViewModelOutputs {
    var fetchAttendanceStatus: Signal<AttendanceStatusModel, Never> { get }
}

protocol SearchUsersViewModelTypes {
    var inputs: SearchUsersViewModelInputs { get }
    
    var outputs: SearchUsersViewModelOutputs { get }
}

class SearchUsersViewModel {
    private let firebase: FirebaseClient
    private let userProperty = MutableProperty<AttendanceStatusModel?>(nil)
    
    init(firebase: FirebaseClient = FirebaseClient()) {
        self.firebase = firebase
    }
}

extension SearchUsersViewModel: SearchUsersViewModelTypes {
    var inputs: SearchUsersViewModelInputs { return self }
    
    var outputs: SearchUsersViewModelOutputs { return self}
}

extension SearchUsersViewModel: SearchUsersViewModelInputs {
    func remoteAttendanceStatus(name userName: String) {
        firebase.fetchUserAttendanceList(name: userName) { [weak self] result in
            switch result {
            case .success(let value):
                self?.userProperty.value = value
            case .failure(let error):
                print("사용자 검색 에러 - \(error)")
            }
        }
    }
}

extension SearchUsersViewModel: SearchUsersViewModelOutputs {
    var fetchAttendanceStatus: Signal<AttendanceStatusModel, Never> {
        return userProperty.signal.skipNil()
    }
}
