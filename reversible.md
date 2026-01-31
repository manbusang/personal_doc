sequenceDiagram
    participant H as Hypervisor
    participant V as VM

    H->>V: Run_To_PostRun
    V-->>H: ACK
    
    Note over V: Stae: PostRun
    
    alt Timeout 7s
        H->>V: PostRun_To_Run
        V-->>H: ACK
        Note over V: State: Run
    else 超时触发 (Timeout > 7s)
        H->>H: 触发强制重置逻辑
        Note right of H: 记录错误日志
    end
