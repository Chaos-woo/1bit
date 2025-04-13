
# 构建自定义业务HTTP客户端
* 在业务API类中使用INKApiClient
* 使用get/post/delete/put方法
* 请求检查、请求修改、响应检查、响应修改、HTTP错误处理、业务错误码处理通过Interceptor实现，参考 `example_http_client`
* 使用返回的INKApiResult类处理成功、错误、业务异常等处理
* 注意点：在拦截器种处理Dio状态，HTTP状态码，业务状态码时，需要注意添加顺序