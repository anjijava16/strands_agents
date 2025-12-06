
# AgentCore(AWS Bedrock)

<img width="1468" height="756" alt="image" src="https://github.com/user-attachments/assets/e4e1b433-98c5-4692-aec7-247a4a9b960d" />

# Agent Core and Runtime

Amazon Bedrock AgentCore Runtime is a secure, serverless runtime designed for deploying and scaling AI agents and tools. It supports any frameworks, models, and protocols, enabling developers to transform local prototypes into production-ready solutions with minimal code changes.

An AgentCore Runtime is the foundational component that hosts your AI agent or tool code. It represents a containerized application that processes user inputs, maintains context, and executes actions using AI capabilities. When you create an agent, you define its behavior, capabilities, and the tools it can access. For example, a customer support agent might answer product questions, process returns, and escalate complex issues to human representatives.

You can build and deploy agents to AgentCore Runtime using the AgentCore Python SDK or directly through AWS SDKs. With the Python SDK, you can define your agent using popular frameworks like LangGraph, CrewAI, or Strands Agents. The SDK handles infrastructure complexities, allowing you to focus on the agent's logic and capabilities.

Amazon BedrockAgentCore Python SDK provides a lightweight wrapper that helps you deploy your agent functions as HTTP services that are compatible with Amazon Bedrock. It handles all the HTTP server details so you can focus on your agent's core functionality.

All you need to do is decorate your function with the @app.entrypoint decorator and use the configure and launch capabilities of the SDK to deploy your agent to AgentCore Runtime. Your application is then able to invoke this agent using the SDK or any of the AWS's developer tools such as boto3, AWS SDK for JavaScript or the AWS SDK for Java.

<img width="2362" height="1218" alt="image" src="https://github.com/user-attachments/assets/a2cd7de6-b2e0-48a3-ad1a-a7067fb15a58" />



# Commands
 1.  agentcore configure --entrypoint agent_example.py
 2.  more .bedrock_agentcore.yaml
 3.  agentcore launch
 4.  agentcore status                                                                                                                                      │
 5.  agentcore invoke '{"prompt": "Hello"}'



# agentcore --help

```
(.venv) welcome@jaisairams-Laptop agent_core_aws % agentcore --help
                                                                                                                                                            
 Usage: agentcore [OPTIONS] COMMAND [ARGS]...                                                                                                               
                                                                                                                                                            
 BedrockAgentCore CLI                                                                                                                                       
                                                                                                                                                            
╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ --help          Show this message and exit.                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯


╭─ Commands ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮

│ invoke                      Invoke Bedrock AgentCore endpoint.                                                                                           │

│ status                      Get Bedrock AgentCore status including config and runtime details.                                                           │

│ launch                      Launch Bedrock AgentCore with three deployment modes.                                                                        │

│ import-agent                Use a Bedrock Agent to generate a LangChain or Strands agent with AgentCore primitives.                                      │

│ destroy                     Destroy Bedrock AgentCore resources.                                                                                         │

│ create_mcp_gateway          Creates an MCP Gateway.                                                                                                      │

│ create_mcp_gateway_target   Creates an MCP Gateway Target.                                                                                               │

│ configure                   Configuration management                                                                                                     │

│ gateway                     Manage Bedrock AgentCore Gateways                                                                                            │

╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

# References:
1. https://strandsagents.com/latest/documentation/docs/user-guide/deploy/deploy_to_bedrock_agentcore/
