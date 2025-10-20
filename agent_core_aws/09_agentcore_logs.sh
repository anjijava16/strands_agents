^Z
zsh: suspended  aws logs tail /aws/bedrock-agentcore/runtimes/welcome-FKCDEH2f8t-DEFAULT   
(.venv) welcome@jaisairams-Laptop agent_core_aws % 
(.venv) welcome@jaisairams-Laptop agent_core_aws % aws logs tail /aws/bedrock-agentcore/runtimes/welcome-FKCDEH2f8t-DEFAULT --log-stream-name-prefix "2025/10/20/[runtime-logs]" --follow
2025-10-20T05:29:25.990000+00:00 2025/10/20/[runtime-logs]c427bda5-9f9d-4aff-9efc-4ae3e4ef03a6 {"timestamp": "2025-10-20T05:29:25.989Z", "level": "INFO", "message": "Invocation completed successfully (0.799s)", "logger": "bedrock_agentcore.app", "requestId": "8efa7eb6-2326-48bb-874a-b451a64a1111", "sessionId": "389cb995-e18d-4efd-836f-ed96a6fb4b62"}
2025-10-20T05:34:50.118000+00:00 2025/10/20/[runtime-logs]c695e6c5-ba23-4d3a-b034-ea78dceb863d {"timestamp": "2025-10-20T05:34:50.117Z", "level": "INFO", "message": "Invocation completed successfully (1.675s)", "logger": "bedrock_agentcore.app", "requestId": "f1a08975-d1fc-46ea-9ff5-1576f6f3fdb2", "sessionId": "a27ad7ee-b890-4d8a-a85d-45a998fca926"}
2025-10-20T05:36:40.217000+00:00 2025/10/20/[runtime-logs]af91e408-7276-4273-943e-cbdd3e2df2e1 Thank you for your warm greeting! 🙏
2025-10-20T05:36:40.268000+00:00 2025/10/20/[runtime-logs]af91e408-7276-4273-943e-cbdd3e2df2e1 Jai Hanuman! Sai Ram!
2025-10-20T05:36:40.832000+00:00 2025/10/20/[runtime-logs]af91e408-7276-4273-943e-cbdd3e2df2e1 It's wonderful to be welcomed with such devotional spirit. May I assist you with anything today? Whether you have questions about spiritual matters, need help with something practical, or just want to chat, I'm here to help.
2025-10-20T05:36:41.190000+00:00 2025/10/20/[runtime-logs]af91e408-7276-4273-943e-cbdd3e2df2e1 {"timestamp": "2025-10-20T05:36:41.189Z", "level": "INFO", "message": "Invocation completed successfully (2.196s)", "logger": "bedrock_agentcore.app", "requestId": "686faf2a-6e12-454c-b654-761edd017900", "sessionId": "523b4300-c944-452a-850c-5e8c4fa7cd5b"}




(.venv) welcome@jaisairams-Laptop agent_core_aws % aws logs tail /aws/bedrock-agentcore/runtimes/welcome-FKCDEH2f8t-DEFAULT --log-stream-name-prefix "2025/10/20/[runtime-logs]" --since 1h
2025-10-20T05:29:25.990000+00:00 2025/10/20/[runtime-logs]c427bda5-9f9d-4aff-9efc-4ae3e4ef03a6 {"timestamp": "2025-10-20T05:29:25.989Z", "level": "INFO", "message": "Invocation completed successfully (0.799s)", "logger": "bedrock_agentcore.app", "requestId": "8efa7eb6-2326-48bb-874a-b451a64a1111", "sessionId": "389cb995-e18d-4efd-836f-ed96a6fb4b62"}
2025-10-20T05:34:50.118000+00:00 2025/10/20/[runtime-logs]c695e6c5-ba23-4d3a-b034-ea78dceb863d {"timestamp": "2025-10-20T05:34:50.117Z", "level": "INFO", "message": "Invocation completed successfully (1.675s)", "logger": "bedrock_agentcore.app", "requestId": "f1a08975-d1fc-46ea-9ff5-1576f6f3fdb2", "sessionId": "a27ad7ee-b890-4d8a-a85d-45a998fca926"}
2025-10-20T05:36:40.217000+00:00 2025/10/20/[runtime-logs]af91e408-7276-4273-943e-cbdd3e2df2e1 Thank you for your warm greeting! 🙏
2025-10-20T05:36:40.268000+00:00 2025/10/20/[runtime-logs]af91e408-7276-4273-943e-cbdd3e2df2e1 Jai Hanuman! Sai Ram!
2025-10-20T05:36:40.832000+00:00 2025/10/20/[runtime-logs]af91e408-7276-4273-943e-cbdd3e2df2e1 It's wonderful to be welcomed with such devotional spirit. May I assist you with anything today? Whether you have questions about spiritual matters, need help with something practical, or just want to chat, I'm here to help.
2025-10-20T05:36:41.190000+00:00 2025/10/20/[runtime-logs]af91e408-7276-4273-943e-cbdd3e2df2e1 {"timestamp": "2025-10-20T05:36:41.189Z", "level": "INFO", "message": "Invocation completed successfully (2.196s)", "logger": "bedrock_agentcore.app", "requestId": "686faf2a-6e12-454c-b654-761edd017900", "sessionId": "523b4300-c944-452a-850c-5e8c4fa7cd5b"}
(.venv) welcome@jaisairams-Laptop agent_core_aws % 
