//
//  PostEditorViewModel.swift
//  FollowYourStep2
//
//  Created by 李明哲 on 2024/11/22.
//

import SwiftUI
import CoreLocation

class PostEditorViewModel: ObservableObject {
    @Published var title: String
    @Published var text: String
    @Published var images: [UIImage]
    @Published var selectedLocation: CLLocationCoordinate2D
    
    // 验证状态
    @Published var isTitleValid: Bool = true
    @Published var isTextValid: Bool = true
    
    // 当前编辑的帖子
    private var post: Post
    
    // 初始化方法
    init(post: Post = Post(id: UUID(), title: "", images: [], text: "", likeCount: 0, favoriteCount: 0, latitude: 0.0, longitude: 0.0)) {
        self.post = post
        self.title = post.title
        self.text = post.text
        self.images = post.images
        self.selectedLocation = post.coordinate
        
        // 初始验证状态
        self.isTitleValid = !self.title.isEmpty
        self.isTextValid = !self.text.isEmpty
    }
    
    // 更新标题
    func updateTitle(_ newTitle: String) {
        self.title = newTitle
        isTitleValid = !newTitle.isEmpty
    }
    
    // 更新文本
    func updateText(_ newText: String) {
        self.text = newText
        isTextValid = !newText.isEmpty
    }
    
    // 添加图片
    func addImage(_ image: UIImage) {
        images.append(image)
    }
    
    // 删除图片
    func deleteImage(at index: Int) {
        images.remove(at: index)
    }
    
    // 保存帖子
    func savePost() -> Post {
        // 更新帖子数据
        post.title = title
        post.text = text
        post.images = images
        post.coordinate = selectedLocation
        post.latitude = selectedLocation.latitude
        post.longitude = selectedLocation.longitude
        
        // 返回更新后的Post对象
        return post
    }
}
