class PostData {
  int postId;
  List<String> gallery;
  int totalLike;
  int totalComment;
  String postTime;
  String caption;

  PostData(
      {this.postId,
      this.gallery,
      this.totalLike,
      this.totalComment,
      this.postTime,
      this.caption});

  int get getPostId => this.postId;
  List<String> get getGallery => this.gallery;
  int get getTotalLike => this.totalLike;
  int get getTotalComment => this.totalComment;
  String get getPostTime => this.postTime;

  set setGallery(List<String> gallery) {
    this.gallery = gallery;
  }

  set setTotalLike(int totalLike) {
    this.totalLike = totalLike;
  }

  set setTotalComment(int totalComment) {
    this.totalComment = totalComment;
  }

  set setPostTime(String postTime) {
    this.postTime = postTime;
  }
}
