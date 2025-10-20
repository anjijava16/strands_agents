(.venv) welcome@jaisairams-Laptop agent_core_aws %  agentcore launch
🚀 Launching Bedrock AgentCore (codebuild mode - RECOMMENDED)...
   • Build ARM64 containers in the cloud with CodeBuild
   • No local Docker required (DEFAULT behavior)
   • Production-ready deployment

💡 Deployment options:
   • agentcore launch                → CodeBuild (current)
   • agentcore launch --local        → Local development
   • agentcore launch --local-build  → Local build + cloud deploy

Creating memory resource for agent: welcome
✅ MemoryManager initialized for region: us-east-1
⠋ Launching Bedrock AgentCore...Creating new STM-only memory...
⠇ Launching Bedrock AgentCore...Created memory: welcome_mem-AjKrSEEVh9
Memory created but flag was False - correcting to True
✅ New memory created: welcome_mem-AjKrSEEVh9 (provisioning in background)
Starting CodeBuild ARM64 deployment for agent 'welcome' to account 907708980274 (us-east-1)
Setting up AWS resources (ECR repository, execution roles)...
Getting or creating ECR repository for agent: welcome
Repository doesn't exist, creating new ECR repository: bedrock-agentcore-welcome
⠧ Launching Bedrock AgentCore...✅ ECR repository available: 907708980274.dkr.ecr.us-east-1.amazonaws.com/bedrock-agentcore-welcome
Getting or creating execution role for agent: welcome
Using AWS region: us-east-1, account ID: 907708980274
Role name: AmazonBedrockAgentCoreSDKRuntime-us-east-1-280d44ab1e
⠋ Launching Bedrock AgentCore...Role doesn't exist, creating new execution role: AmazonBedrockAgentCoreSDKRuntime-us-east-1-280d44ab1e
Starting execution role creation process for agent: welcome
✓ Role creating: AmazonBedrockAgentCoreSDKRuntime-us-east-1-280d44ab1e
Creating IAM role: AmazonBedrockAgentCoreSDKRuntime-us-east-1-280d44ab1e
⠼ Launching Bedrock AgentCore...✓ Role created: arn:aws:iam::907708980274:role/AmazonBedrockAgentCoreSDKRuntime-us-east-1-280d44ab1e
⠇ Launching Bedrock AgentCore...✓ Execution policy attached: BedrockAgentCoreRuntimeExecutionPolicy-welcome
Role creation complete and ready for use with Bedrock AgentCore
✅ Execution role available: arn:aws:iam::907708980274:role/AmazonBedrockAgentCoreSDKRuntime-us-east-1-280d44ab1e
Preparing CodeBuild project and uploading source...
⠸ Launching Bedrock AgentCore...Getting or creating CodeBuild execution role for agent: welcome
Role name: AmazonBedrockAgentCoreSDKCodeBuild-us-east-1-280d44ab1e
⠦ Launching Bedrock AgentCore...CodeBuild role doesn't exist, creating new role: AmazonBedrockAgentCoreSDKCodeBuild-us-east-1-280d44ab1e
Creating IAM role: AmazonBedrockAgentCoreSDKCodeBuild-us-east-1-280d44ab1e
⠧ Launching Bedrock AgentCore...✓ Role created: arn:aws:iam::907708980274:role/AmazonBedrockAgentCoreSDKCodeBuild-us-east-1-280d44ab1e
Attaching inline policy: CodeBuildExecutionPolicy to role: AmazonBedrockAgentCoreSDKCodeBuild-us-east-1-280d44ab1e
⠹ Launching Bedrock AgentCore...✓ Policy attached: CodeBuildExecutionPolicy
Waiting for IAM role propagation...
⠧ Launching Bedrock AgentCore...CodeBuild execution role creation complete: arn:aws:iam::907708980274:role/AmazonBedrockAgentCoreSDKCodeBuild-us-east-1-280d44ab1e
⠙ Launching Bedrock AgentCore...Created S3 bucket: bedrock-agentcore-codebuild-sources-907708980274-us-east-1
Using dockerignore.template with 45 patterns for zip filtering
Including Dockerfile from /Users/welcome/Desktop/Tech_Repos/python_envs/agent_core_aws/.bedrock_agentcore/welcome in source.zip
⠧ Launching Bedrock AgentCore...Uploaded source to S3: welcome/source.zip
⠹ Launching Bedrock AgentCore...Created CodeBuild project: bedrock-agentcore-welcome-builder
Starting CodeBuild build (this may take several minutes)...
⠇ Launching Bedrock AgentCore...Starting CodeBuild monitoring...
⠙ Launching Bedrock AgentCore...🔄 QUEUED started (total: 0s)
⠧ Launching Bedrock AgentCore...✅ QUEUED completed in 1.3s
🔄 PROVISIONING started (total: 2s)
⠇ Launching Bedrock AgentCore...✅ PROVISIONING completed in 9.0s
🔄 DOWNLOAD_SOURCE started (total: 10s)
⠼ Launching Bedrock AgentCore...✅ DOWNLOAD_SOURCE completed in 1.3s
🔄 BUILD started (total: 12s)
⠇ Launching Bedrock AgentCore...✅ BUILD completed in 11.6s
🔄 POST_BUILD started (total: 23s)
⠼ Launching Bedrock AgentCore...✅ POST_BUILD completed in 6.8s
🔄 COMPLETED started (total: 30s)
⠙ Launching Bedrock AgentCore...✅ COMPLETED completed in 1.4s
🎉 CodeBuild completed successfully in 0m 31s
CodeBuild completed successfully
✅ CodeBuild project configuration saved
⠹ Launching Bedrock AgentCore...Deploying to Bedrock AgentCore...
Passing memory configuration to agent: welcome_mem-AjKrSEEVh9
⠇ Launching Bedrock AgentCore...✅ Agent created/updated: arn:aws:bedrock-agentcore:us-east-1:907708980274:runtime/welcome-FKCDEH2f8t
Observability is enabled, configuring Transaction Search...
⠹ Launching Bedrock AgentCore...Created/updated CloudWatch Logs resource policy
⠸ Launching Bedrock AgentCore...Configured X-Ray trace segment destination to CloudWatch Logs
⠹ Launching Bedrock AgentCore...X-Ray indexing rule already configured
✅ Transaction Search configured: resource_policy, trace_destination
🔍 GenAI Observability Dashboard:
   https://console.aws.amazon.com/cloudwatch/home?region=us-east-1#gen-ai-observability/agent-core
Polling for endpoint to be ready...
⠼ Launching Bedrock AgentCore...Agent endpoint: arn:aws:bedrock-agentcore:us-east-1:907708980274:runtime/welcome-FKCDEH2f8t/runtime-endpoint/DEFAULT
Deployment completed successfully - Agent: arn:aws:bedrock-agentcore:us-east-1:907708980274:runtime/welcome-FKCDEH2f8t
╭─────────────────────────────────────────────────────────────────── Deployment Success ───────────────────────────────────────────────────────────────────╮
│ Agent Details:                                                                                                                                           │
│ Agent Name: welcome                                                                                                                                      │
│ Agent ARN: arn:aws:bedrock-agentcore:us-east-1:907708980274:runtime/welcome-FKCDEH2f8t                                                                   │
│ ECR URI: 907708980274.dkr.ecr.us-east-1.amazonaws.com/bedrock-agentcore-welcome:latest                                                                   │
│ CodeBuild ID: bedrock-agentcore-welcome-builder:82c22819-f143-4e81-9184-5920f2a3ef25                                                                     │
│                                                                                                                                                          │
│ 🚀 ARM64 container deployed to Bedrock AgentCore                                                                                                         │
│                                                                                                                                                          │
│ Next Steps:                                                                                                                                              │
│    agentcore status                                                                                                                                      │
│    agentcore invoke '{"prompt": "Hello"}'                                                                                                                │
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
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
(.venv) welcome@jaisairams-Laptop agent_core_aws % 
