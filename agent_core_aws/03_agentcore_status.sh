(.venv) welcome@jaisairams-Laptop agent_core_aws % agentcore status
✅ MemoryManager initialized for region: us-east-1
🔎 Retrieving memory resource with ID: welcome_mem-AjKrSEEVh9...
  Found memory: welcome_mem-AjKrSEEVh9
╭───────────────────────────────────────────────────────────────── Agent Status: welcome ──────────────────────────────────────────────────────────────────╮
│ Ready - Agent deployed and endpoint available                                                                                                            │
│                                                                                                                                                          │
│ Agent Details:                                                                                                                                           │
│ Agent Name: welcome                                                                                                                                      │
│ Agent ARN: arn:aws:bedrock-agentcore:us-east-1:907708980274:runtime/welcome-FKCDEH2f8t                                                                   │
│ Endpoint: DEFAULT (READY)                                                                                                                                │
│ Region: us-east-1 | Account: 907708980274                                                                                                                │
│                                                                                                                                                          │
│ Memory: STM only (welcome_mem-AjKrSEEVh9)                                                                                                                │
│                                                                                                                                                          │
│ Deployment Info:                                                                                                                                         │
│ Created: 2025-10-20 05:24:43.824988+00:00                                                                                                                │
│ Last Updated: 2025-10-20 05:25:26.645561+00:00                                                                                                           │
│                                                                                                                                                          │
│ 📋 CloudWatch Logs:                                                                                                                                      │
│    /aws/bedrock-agentcore/runtimes/welcome-FKCDEH2f8t-DEFAULT --log-stream-name-prefix "2025/10/20/[runtime-logs]"                                       │
│    /aws/bedrock-agentcore/runtimes/welcome-FKCDEH2f8t-DEFAULT --log-stream-names "otel-rt-logs"                                                          │
│                                                                                                                                                          │
│ 🔍 GenAI Observability Dashboard:                                                                                                                        │
│    https://console.aws.amazon.com/cloudwatch/home?region=us-east-1#gen-ai-observability/agent-core                                                       │
│                                                                                                                                                          │
│ ⏱️  Note: Observability data may take up to 10 minutes to appear after first launch                                                                       │
│                                                                                                                                                          │
│ 💡 Tail logs with:                                                                                                                                       │
│    aws logs tail /aws/bedrock-agentcore/runtimes/welcome-FKCDEH2f8t-DEFAULT --log-stream-name-prefix "2025/10/20/[runtime-logs]" --follow                │
│    aws logs tail /aws/bedrock-agentcore/runtimes/welcome-FKCDEH2f8t-DEFAULT --log-stream-name-prefix "2025/10/20/[runtime-logs]" --since 1h              │
│                                                                                                                                                          │
│ Ready to invoke:                                                                                                                                         │
│    agentcore invoke '{"prompt": "Hello"}'                                                                                                                │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
(.venv) welcome@jaisairams-Laptop agent_core_aws % 
