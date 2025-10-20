(.venv) welcome@jaisairams-Laptop agent_core_aws % agentcore destroy
⚠️  About to destroy resources for agent 'welcome'

Current deployment:
  • Agent ARN: arn:aws:bedrock-agentcore:us-east-1:907708980274:runtime/welcome-FKCDEH2f8t
  • Agent ID: welcome-FKCDEH2f8t
  • ECR Repository: 907708980274.dkr.ecr.us-east-1.amazonaws.com/bedrock-agentcore-welcome
  • Execution Role: arn:aws:iam::907708980274:role/AmazonBedrockAgentCoreSDKRuntime-us-east-1-280d44ab1e

This will permanently delete AWS resources and cannot be undone!
Are you sure you want to destroy the agent 'welcome' and all its resources? [y/N]: y
Starting destroy operation for agent: welcome (dry_run=False, delete_ecr_repo=False)
⠏ Destroying Bedrock AgentCore resources...DEFAULT endpoint will be automatically deleted with agent
⠙ Destroying Bedrock AgentCore resources...Deleted AgentCore agent: arn:aws:bedrock-agentcore:us-east-1:907708980274:runtime/welcome-FKCDEH2f8t
Checking ECR repository: bedrock-agentcore-welcome in region: us-east-1
⠇ Destroying Bedrock AgentCore resources...Deleted 1 ECR images from bedrock-agentcore-welcome
⠙ Destroying Bedrock AgentCore resources...Deleted CodeBuild project: bedrock-agentcore-welcome-builder
⠹ Destroying Bedrock AgentCore resources...✅ MemoryManager initialized for region: us-east-1
⠼ Destroying Bedrock AgentCore resources...Deleted memory: welcome_mem-AjKrSEEVh9
Deleted memory: welcome_mem-AjKrSEEVh9
Deleted memory (was created by toolkit): welcome_mem-AjKrSEEVh9
⠴ Destroying Bedrock AgentCore resources...Deleted inline policy CodeBuildExecutionPolicy from role AmazonBedrockAgentCoreSDKCodeBuild-us-east-1-280d44ab1e
⠏ Destroying Bedrock AgentCore resources...Deleted CodeBuild IAM role: AmazonBedrockAgentCoreSDKCodeBuild-us-east-1-280d44ab1e
⠸ Destroying Bedrock AgentCore resources...Deleted IAM role: AmazonBedrockAgentCoreSDKRuntime-us-east-1-280d44ab1e
Removed agent configuration: welcome
Cleared default agent (no agents remaining)
Removed configuration file: /Users/welcome/Desktop/Tech_Repos/python_envs/agent_core_aws/.bedrock_agentcore.yaml
Destroy operation completed. Resources removed: 8, Warnings: 0, Errors: 0
✅ Successfully destroyed resources for agent 'welcome'

╭──────────────────────────────────────────────────────────── Resources Successfully Destroyed ────────────────────────────────────────────────────────────╮
│   ✓ AgentCore agent: arn:aws:bedrock-agentcore:us-east-1:907708980274:runtime/welcome-FKCDEH2f8t                                                         │
│   ✓ ECR images: 1 images from bedrock-agentcore-welcome                                                                                                  │
│   ✓ CodeBuild project: bedrock-agentcore-welcome-builder                                                                                                 │
│   ✓ Memory: welcome_mem-AjKrSEEVh9                                                                                                                       │
│   ✓ Deleted CodeBuild IAM role: AmazonBedrockAgentCoreSDKCodeBuild-us-east-1-280d44ab1e                                                                  │
│   ✓ IAM execution role: AmazonBedrockAgentCoreSDKRuntime-us-east-1-280d44ab1e                                                                            │
│   ✓ Agent configuration: welcome                                                                                                                         │
│   ✓ Configuration file (no agents remaining)                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

Next steps:
  • Run 'agentcore configure --entrypoint <file>' to set up a new agent
  • Run 'agentcore launch' to deploy to Bedrock AgentCore
(.venv) welcome@jaisairams-Laptop agent_core_aws % 
