# 基于YTKNetwork打造一个较为合理的网络模块
项目中使用 [YTKNetwork] 作为网络框架，经过长时间的使用，封装了一个较为合理的网络模块。考虑的几个点有以下几个
1. 提供统一的code处理
2. 提供统一的返回数据解析
3. code是在与后台约定的指的时候才成功回调

## 设计过程
1. 首先 建个类 LTBaseRequest 集成自 YTKBaseRequest，用于发送网络请求


[YTKNetwork]:https://github.com/yuantiku/YTKNetwork


