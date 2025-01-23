class EditPostState {
  final bool isLoading;
  final bool isSuccess;
  final bool fetchSuccess;
  final String? errorMessage;
  final String? description;
  final String? imageUrl;
  final List<String>? taggedFriends;

  EditPostState({
    required this.isLoading,
    required this.isSuccess,
    required this.fetchSuccess,
    this.errorMessage,
    this.description,
    this.imageUrl,
    this.taggedFriends,
  });

  factory EditPostState.initial() => EditPostState(
        isLoading: false,
        isSuccess: false,
        fetchSuccess: false,
        errorMessage: null,
        description: null,
        imageUrl: null,
        taggedFriends: [],
      );

  EditPostState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? fetchSuccess,
    String? errorMessage,
    String? description,
    String? imageUrl,
    List<String>? taggedFriends,
  }) {
    return EditPostState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      fetchSuccess: fetchSuccess?? this.fetchSuccess,
      errorMessage: errorMessage,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      taggedFriends: taggedFriends ?? this.taggedFriends,
    );
  }
}
