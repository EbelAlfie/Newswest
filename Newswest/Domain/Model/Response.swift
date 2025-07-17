enum Response<dataType> {
    case loading
    case success(data: dataType?)
    case error(error: Error)
}
