
# AgentCore(AWS Bedrock)

<img width="1468" height="756" alt="image" src="https://github.com/user-attachments/assets/e4e1b433-98c5-4692-aec7-247a4a9b960d" />


# Commands
 1.  agentcore configure --entrypoint agent_example.py
 2.  more .bedrock_agentcore.yaml
 3.  agentcore launch
 4.  agentcore status                                                                                                                                      │
 5.  agentcore invoke '{"prompt": "Hello"}'



# agentcore --help

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



# References:
1. https://strandsagents.com/latest/documentation/docs/user-guide/deploy/deploy_to_bedrock_agentcore/
