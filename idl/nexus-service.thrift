// 智核微服务
namespace go nexus_microservice

// 函数调用参数
struct FunctionCall{
    1: required string name, // 函数名称
    2: optional string arguments, // 函数参数, json格式
}

struct ToolCall{
    1: required i64 index, // 工具索引
    2: required string id, // 工具ID
    3: required string type, // 默认为function
    4: optional FunctionCall function_call, // 函数调用
}


// 定义消息格式
struct Message{
    1: required string role, // 消息角色
    2: required string content, // 消息内容
    3: optional string name, // 消息工具名称
    4: optional FunctionCall function_call, // 函数调用
    5: optional list<ToolCall> tool_calls, // 工具调用
}

// 定义请求结构体，要接收用户的输入，可能包含文件列表、
struct AskRequest{
    1: optional string model, // 模型名称
    2: optional double top_p, // 生成文本的随机性
    3: optional double temperature, // 生成文本的多样性
    4: optional double presence_penalty, // 生成文本的重复都
    5: optional i32 max_tokens, // 生成文本的最大长度
    6: optional i32 seed, // 随机种子
    7: optional list<string> stop, // 停止词
    8: optional bool enable_search, // 是否启用搜索
    9: required list<Message> messages
}

// 生成的回复
struct Choice{
    1: optional string finish_reason, // 结束原因
    2: list<Message> message, // 生成的文本
    3: i32 index, //消息索引
}

struct AskResponse{
    1: string id, // 生成的调用的唯一标识
    2: string model, // 模型名称
    3:list<Choice> choices, // 生成的文本
}

service NexusService {
    AskResponse AskServer (1: AskRequest req) (streaming.mode="server"),
}