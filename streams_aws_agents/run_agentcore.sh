sh-5.2$ sudo -u ec2-user -i
KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 ~]$ git clone https://github.com/aws-samples/spot-anomalies-flink-workshop-resources.git
cd spot-anomalies-flink-workshop-resources/code/mcp_server/

TOKEN=`curl -X PUT -s "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
export AWS_REGION=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/region)
Cloning into 'spot-anomalies-flink-workshop-resources'...
remote: Enumerating objects: 503, done.
remote: Counting objects: 100% (137/137), done.
remote: Compressing objects: 100% (99/99), done.
remote: Total 503 (delta 46), reused 45 (delta 38), pack-reused 366 (from 2)
Receiving objects: 100% (503/503), 143.55 KiB | 5.98 MiB/s, done.
Resolving deltas: 100% (212/212), done.
KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$ ls -ltr
total 12
-rw-r--r--. 1 ec2-user ec2-user  890 Nov 14 12:51 test_mcp_server_agentcore.py
-rw-r--r--. 1 ec2-user ec2-user 1222 Nov 14 12:51 server.py
-rw-r--r--. 1 ec2-user ec2-user   77 Nov 14 12:51 requirements.txt
KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$ source ~/.venv/bin/activate

python server.py > mcp.log 2>&1 &
[1] 82767
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$ more mcp.log
INFO:botocore.credentials:Found credentials from IAM Role: anomaly-cfn-EC2Role-eDl50a2l6oDu
INFO:     Started server process [82767]
INFO:     Waiting for application startup.
INFO:mcp.server.streamable_http_manager:StreamableHTTP session manager started
INFO:     Application startup complete.
INFO:     Uvicorn running on http://0.0.0.0:8000 (Press CTRL+C to quit)
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$ ls -ltr
total 16
-rw-r--r--. 1 ec2-user ec2-user  890 Nov 14 12:51 test_mcp_server_agentcore.py
-rw-r--r--. 1 ec2-user ec2-user 1222 Nov 14 12:51 server.py
-rw-r--r--. 1 ec2-user ec2-user   77 Nov 14 12:51 requirements.txt
-rw-r--r--. 1 ec2-user ec2-user  367 Nov 14 12:51 mcp.log
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$ more server.py
from mcp.server.fastmcp import FastMCPimport boto3
import os
import logging
logging.basicConfig(level=logging.INFO)

mcp = FastMCP(host="0.0.0.0", stateless_http=True)

# Environment variables
REGION_NAME = os.environ["AWS_REGION"]
ACCOUNT_ID = boto3.client("sts").get_caller_identity()["Account"]
TOPIC_ARN = f"arn:aws:sns:{REGION_NAME}:{ACCOUNT_ID}:AnomalyReportSNSTopic"

sns_client = boto3.client("sns", region_name=REGION_NAME)

@mcp.tool()
def send_notification(severity: str, subject: str, message: str) -> str:
    """Sends security alerts to the response team based on event severity and details"""

    if severity in ['2', '3']:
        if TOPIC_ARN:
            try:
                sns_client.publish(
                    TopicArn=TOPIC_ARN,
                    Message=message,
                    Subject=subject
                )
                return "notification sent successfully"
            except Exception as e:
                return f"notification failed: {str(e)}"
        else:
            return "notification failed: no topic ARN configured"
    else:
        return "notification skipped - severity below threshold"

if __name__ == "__main__":
    mcp.run(transport="streamable-http")
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$ cmcp http://localhost:8000 tools/list
{
  "tools": [
    {
      "name": "send_notification",
      "description": "Sends security alerts to the response team based on event severity and details",
      "inputSchema": {
        "properties": {
          "severity": {
            "title": "Severity",
            "type": "string"
          },
          "subject": {
            "title": "Subject",
            "type": "string"
          },
          "message": {
            "title": "Message",
            "type": "string"
          }
        },
        "required": [
          "severity",
          "subject",
          "message"
        ],
        "title": "send_notificationArguments",
        "type": "object"
      },
      "outputSchema": {
        "properties": {
          "result": {
            "title": "Result",
            "type": "string"
          }
        },
        "required": [
          "result"
        ],
        "title": "send_notificationOutput",
        "type": "object"
      }
    }
  ]
}

(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$ man cmd
No manual entry for cmd
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$ man cmcp
No manual entry for cmcp
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$ cmcp
usage: cmcp [-h] [-v] cmd_or_url method [items ...]
cmcp: error: the following arguments are required: cmd_or_url, method, items
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$ ls -ltr
total 16
-rw-r--r--. 1 ec2-user ec2-user  890 Nov 14 12:51 test_mcp_server_agentcore.py
-rw-r--r--. 1 ec2-user ec2-user 1222 Nov 14 12:51 server.py
-rw-r--r--. 1 ec2-user ec2-user   77 Nov 14 12:51 requirements.txt
-rw-r--r--. 1 ec2-user ec2-user  791 Nov 14 12:53 mcp.log
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$ more requirements.txt
mcp>=1.10.0
fastapi
boto3
bedrock-agentcore
bedrock-agentcore-starter-toolkit
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$ agentcore configure \
    --entrypoint server.py \
    --name incident_management_mcp_server \
    --execution-role $(aws iam list-roles | jq -r '.Roles[].Arn' | grep McpRuntimeRole) \
    --protocol MCP \
    --region $AWS_REGION \
    --non-interactive

agentcore launch --agent incident_management_mcp_server --env AWS_REGION="${AWS_REGION}"
Configuring Bedrock AgentCore...
✓ Using detected requirements file: requirements.txt
✓ Will auto-create ECR repository
✓ Using default IAM authorization
✓ Using default request header configuration
Configuring BedrockAgentCore agent: incident_management_mcp_server
Will create new memory with mode: STM_ONLY
Memory configuration: Short-term memory only

⚠️ Platform mismatch: Current system is 'linux/amd64' but Bedrock AgentCore requires 'linux/arm64', so local builds won't work.
Please use default launch command which will do a remote cross-platform build using code build.For deployment other options and workarounds, see:
https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/getting-started-custom.html

Generated .dockerignore
Generated Dockerfile: .bedrock_agentcore/incident_management_mcp_server/Dockerfile
Setting 'incident_management_mcp_server' as default agent
╭────────────────────────────────────────────────────────────────────────────────── Configuration Success ───────────────────────────────────────────────────────────────────────────────────╮
│ Agent Details                                                                                                                                                                              │
│ Agent Name: incident_management_mcp_server                                                                                                                                                 │
│ Runtime: Docker                                                                                                                                                                            │
│ Region: us-west-2                                                                                                                                                                          │
│ Account: 194071577680                                                                                                                                                                      │
│                                                                                                                                                                                            │
│ Configuration                                                                                                                                                                              │
│ Execution Role: arn:aws:iam::194071577680:role/cfn-anomaly-genai-workshop-McpRuntimeRoleE7337EE0-7frecFXphYwo                                                                              │
│ ECR Repository: Auto-create                                                                                                                                                                │
│ Authorization: IAM (default)                                                                                                                                                               │
│                                                                                                                                                                                            │
│                                                                                                                                                                                            │
│ Memory: Short-term memory (30-day retention)                                                                                                                                               │
│                                                                                                                                                                                            │
│ 📄 Config saved to: /home/ec2-user/spot-anomalies-flink-workshop-resources/code/mcp_server/.bedrock_agentcore.yaml                                                                         │
│                                                                                                                                                                                            │
│ Next Steps:                                                                                                                                                                                │
│    agentcore launch                                                                                                                                                                        │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
🚀 Launching Bedrock AgentCore (codebuild mode - RECOMMENDED)...
   • Build ARM64 containers in the cloud with CodeBuild
   • No local Docker required (DEFAULT behavior)
   • Production-ready deployment

💡 Deployment options:
   • agentcore launch                → CodeBuild (current)
   • agentcore launch --local        → Local development
   • agentcore launch --local-build  → Local build + cloud deploy

Creating memory resource for agent: incident_management_mcp_server
✅ MemoryManager initialized for region: us-west-2
⠹ Launching Bedrock AgentCore...Creating new STM-only memory...
⠦ Launching Bedrock AgentCore...Created memory: incident_management_mcp_server_mem-ysbrmk9tJK
Memory created but flag was False - correcting to True
✅ New memory created: incident_management_mcp_server_mem-ysbrmk9tJK (provisioning in background)
Starting CodeBuild ARM64 deployment for agent 'incident_management_mcp_server' to account 194071577680 (us-west-2)
Setting up AWS resources (ECR repository, execution roles)...
Getting or creating ECR repository for agent: incident_management_mcp_server
Repository doesn't exist, creating new ECR repository: bedrock-agentcore-incident_management_mcp_server
⠋ Launching Bedrock AgentCore...✅ ECR repository available: 194071577680.dkr.ecr.us-west-2.amazonaws.com/bedrock-agentcore-incident_management_mcp_server
Using execution role from config: arn:aws:iam::194071577680:role/cfn-anomaly-genai-workshop-McpRuntimeRoleE7337EE0-7frecFXphYwo
Preparing CodeBuild project and uploading source...
⠹ Launching Bedrock AgentCore...Getting or creating CodeBuild execution role for agent: incident_management_mcp_server
Role name: AmazonBedrockAgentCoreSDKCodeBuild-us-west-2-e7f544950c
⠴ Launching Bedrock AgentCore...CodeBuild role doesn't exist, creating new role: AmazonBedrockAgentCoreSDKCodeBuild-us-west-2-e7f544950c
Creating IAM role: AmazonBedrockAgentCoreSDKCodeBuild-us-west-2-e7f544950c
⠏ Launching Bedrock AgentCore...✓ Role created: arn:aws:iam::194071577680:role/AmazonBedrockAgentCoreSDKCodeBuild-us-west-2-e7f544950c
Attaching inline policy: CodeBuildExecutionPolicy to role: AmazonBedrockAgentCoreSDKCodeBuild-us-west-2-e7f544950c
⠙ Launching Bedrock AgentCore...✓ Policy attached: CodeBuildExecutionPolicy
Waiting for IAM role propagation...
⠦ Launching Bedrock AgentCore...CodeBuild execution role creation complete: arn:aws:iam::194071577680:role/AmazonBedrockAgentCoreSDKCodeBuild-us-west-2-e7f544950c
⠧ Launching Bedrock AgentCore...Created S3 bucket: bedrock-agentcore-codebuild-sources-194071577680-us-west-2
Using dockerignore.template with 45 patterns for zip filtering
Including Dockerfile from /home/ec2-user/spot-anomalies-flink-workshop-resources/code/mcp_server/.bedrock_agentcore/incident_management_mcp_server in source.zip
⠇ Launching Bedrock AgentCore...Uploaded source to S3: incident_management_mcp_server/source.zip
⠙ Launching Bedrock AgentCore...Created CodeBuild project: bedrock-agentcore-incident_management_mcp_server-builder
Starting CodeBuild build (this may take several minutes)...
⠸ Launching Bedrock AgentCore...Starting CodeBuild monitoring...
⠼ Launching Bedrock AgentCore...🔄 QUEUED started (total: 0s)
⠦ Launching Bedrock AgentCore...✅ QUEUED completed in 1.0s
🔄 PROVISIONING started (total: 1s)
⠦ Launching Bedrock AgentCore...✅ PROVISIONING completed in 7.2s
🔄 DOWNLOAD_SOURCE started (total: 8s)
⠹ Launching Bedrock AgentCore...✅ DOWNLOAD_SOURCE completed in 2.1s
🔄 BUILD started (total: 10s)
⠴ Launching Bedrock AgentCore...✅ BUILD completed in 11.4s
🔄 POST_BUILD started (total: 22s)
⠙ Launching Bedrock AgentCore...✅ POST_BUILD completed in 6.2s
🔄 FINALIZING started (total: 28s)
⠼ Launching Bedrock AgentCore...✅ FINALIZING completed in 1.0s
🔄 COMPLETED started (total: 29s)
✅ COMPLETED completed in 0.0s
🎉 CodeBuild completed successfully in 0m 28s
CodeBuild completed successfully
✅ CodeBuild project configuration saved
Deploying to Bedrock AgentCore...
Passing memory configuration to agent: incident_management_mcp_server_mem-ysbrmk9tJK
⠏ Launching Bedrock AgentCore...✅ Agent created/updated: arn:aws:bedrock-agentcore:us-west-2:194071577680:runtime/incident_management_mcp_server-nZGdUX5rw7
Observability is enabled, configuring Transaction Search...
⠙ Launching Bedrock AgentCore...Created/updated CloudWatch Logs resource policy
⠹ Launching Bedrock AgentCore...Transaction Search configuration failed: An error occurred (AccessDeniedException) when calling the UpdateTraceSegmentDestination operation: User: arn:aws:sts::194071577680:assumed-role/anomaly-cfn-EC2Role-eDl50a2l6oDu/i-0712fff6ef5bf7fb4 is not authorized to perform: xray:UpdateTraceSegmentDestination because no identity-based policy allows thexray:UpdateTraceSegmentDestination action
Agent launch will continue without Transaction Search
🔍 GenAI Observability Dashboard:
   https://console.aws.amazon.com/cloudwatch/home?region=us-west-2#gen-ai-observability/agent-core
Polling for endpoint to be ready...
⠇ Launching Bedrock AgentCore...Agent endpoint: arn:aws:bedrock-agentcore:us-west-2:194071577680:runtime/incident_management_mcp_server-nZGdUX5rw7/runtime-endpoint/DEFAULT
Deployment completed successfully - Agent: arn:aws:bedrock-agentcore:us-west-2:194071577680:runtime/incident_management_mcp_server-nZGdUX5rw7
╭──────────────────────────────────────────────────────────────────────────────────── Deployment Success ────────────────────────────────────────────────────────────────────────────────────╮
│ Agent Details:                                                                                                                                                                             │
│ Agent Name: incident_management_mcp_server                                                                                                                                                 │
│ Agent ARN: arn:aws:bedrock-agentcore:us-west-2:194071577680:runtime/incident_management_mcp_server-nZGdUX5rw7                                                                              │
│ ECR URI: 194071577680.dkr.ecr.us-west-2.amazonaws.com/bedrock-agentcore-incident_management_mcp_server:latest                                                                              │
│ CodeBuild ID: bedrock-agentcore-incident_management_mcp_server-builder:0ad9a72d-354b-408d-a374-396e9f9f9d03                                                                                │
│                                                                                                                                                                                            │
│ 🚀 ARM64 container deployed to Bedrock AgentCore                                                                                                                                           │
│                                                                                                                                                                                            │
│ Next Steps:                                                                                                                                                                                │
│    agentcore status                                                                                                                                                                        │
│    agentcore invoke '{"prompt": "Hello"}'                                                                                                                                                  │
│                                                                                                                                                                                            │
│ 📋 CloudWatch Logs:                                                                                                                                                                        │
│    /aws/bedrock-agentcore/runtimes/incident_management_mcp_server-nZGdUX5rw7-DEFAULT --log-stream-name-prefix "2025/11/14/[runtime-logs]"                                                  │
│    /aws/bedrock-agentcore/runtimes/incident_management_mcp_server-nZGdUX5rw7-DEFAULT --log-stream-names "otel-rt-logs"                                                                     │
│                                                                                                                                                                                            │
│ 🔍 GenAI Observability Dashboard:                                                                                                                                                          │
│    https://console.aws.amazon.com/cloudwatch/home?region=us-west-2#gen-ai-observability/agent-core                                                                                         │
│                                                                                                                                                                                            │
│ ⏱️  Note: Observability data may take up to 10 minutes to appear after first launch                                                                                                         │
│                                                                                                                                                                                            │
│ 💡 Tail logs with:                                                                                                                                                                         │
│    aws logs tail /aws/bedrock-agentcore/runtimes/incident_management_mcp_server-nZGdUX5rw7-DEFAULT --log-stream-name-prefix "2025/11/14/[runtime-logs]" --follow                           │
│    aws logs tail /aws/bedrock-agentcore/runtimes/incident_management_mcp_server-nZGdUX5rw7-DEFAULT --log-stream-name-prefix "2025/11/14/[runtime-logs]" --since 1h                         │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$ export MCP_RUNTIME_ARN=$(aws bedrock-agentcore-control list-agent-runtimes | jq -r '.agentRuntimes[].agentRuntimeArn' | grep mcp_server)
python test_mcp_server_agentcore.py | jq '.'
ERROR:root:Unhandled exception in receive loop: Received response with an unknown request ID: SessionMessage(message=JSONRPCMessage(root=JSONRPCError(jsonrpc='2.0', id='8d5a9ff8-956a-4b2f-9d52-e187327ca763', error=ErrorData(code=-32603, message='An internal error occurred while processing the request.', data=None))), metadata=None)
Traceback (most recent call last):
  File "/home/ec2-user/.venv/lib64/python3.11/site-packages/mcp/shared/session.py", line 418, in _receive_loop
    await self._handle_incoming(
  File "/home/ec2-user/.venv/lib64/python3.11/site-packages/mcp/client/session.py", line 424, in _handle_incoming
    await self._message_handler(req)
  File "/home/ec2-user/.venv/lib64/python3.11/site-packages/strands/tools/mcp/mcp_client.py", line 386, in _handle_error_message
    raise message
RuntimeError: Received response with an unknown request ID: SessionMessage(message=JSONRPCMessage(root=JSONRPCError(jsonrpc='2.0', id='8d5a9ff8-956a-4b2f-9d52-e187327ca763', error=ErrorData(code=-32603, message='An internal error occurred while processing the request.', data=None))), metadata=None)
ERROR:strands.tools.mcp.mcp_client:client failed to initialize
  + Exception Group Traceback (most recent call last):
  |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/strands/tools/mcp/mcp_client.py", line 124, in start
  |     self._init_future.result(timeout=self._startup_timeout)
  |   File "/usr/lib64/python3.11/concurrent/futures/_base.py", line 456, in result
  |     return self.__get_result()
  |            ^^^^^^^^^^^^^^^^^^^
  |   File "/usr/lib64/python3.11/concurrent/futures/_base.py", line 401, in __get_result
  |     raise self._exception
  |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/strands/tools/mcp/mcp_client.py", line 397, in _async_background_thread
  |     async with self._transport_callable() as (read_stream, write_stream, *_):
  |   File "/usr/lib64/python3.11/contextlib.py", line 231, in __aexit__
  |     await self.gen.athrow(typ, value, traceback)
  |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/mcp_lambda/client/streamable_http_sigv4.py", line 143, in streamablehttp_client_with_sigv4
  |     async with streamablehttp_client(
  |   File "/usr/lib64/python3.11/contextlib.py", line 231, in __aexit__
  |     await self.gen.athrow(typ, value, traceback)
  |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/mcp/client/streamable_http.py", line 478, in streamablehttp_client
  |     async with anyio.create_task_group() as tg:
  |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/anyio/_backends/_asyncio.py", line 781, in __aexit__
  |     raise BaseExceptionGroup(
  | ExceptionGroup: unhandled errors in a TaskGroup (1 sub-exception)
  +-+---------------- 1 ----------------
    | Exception Group Traceback (most recent call last):
    |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/mcp/client/streamable_http.py", line 502, in streamablehttp_client
    |     yield (
    |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/mcp_lambda/client/streamable_http_sigv4.py", line 152, in streamablehttp_client_with_sigv4
    |     yield result
    |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/strands/tools/mcp/mcp_client.py", line 399, in _async_background_thread
    |     async with ClientSession(
    |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/mcp/shared/session.py", line 218, in __aexit__
    |     return await self._task_group.__aexit__(exc_type, exc_val, exc_tb)
    |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/anyio/_backends/_asyncio.py", line 781, in __aexit__
    |     raise BaseExceptionGroup(
    | ExceptionGroup: unhandled errors in a TaskGroup (1 sub-exception)
    +-+---------------- 1 ----------------
      | Traceback (most recent call last):
      |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/strands/tools/mcp/mcp_client.py", line 403, in _async_background_thread
      |     await session.initialize()
      |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/mcp/client/session.py", line 151, in initialize
      |     result = await self.send_request(
      |              ^^^^^^^^^^^^^^^^^^^^^^^^
      |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/mcp/shared/session.py", line 286, in send_request
      |     raise McpError(response_or_error.error)
      | mcp.shared.exceptions.McpError: Connection closed
      +------------------------------------
  + Exception Group Traceback (most recent call last):
  |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/strands/tools/mcp/mcp_client.py", line 124, in start
  |     self._init_future.result(timeout=self._startup_timeout)
  |   File "/usr/lib64/python3.11/concurrent/futures/_base.py", line 456, in result
  |     return self.__get_result()
  |            ^^^^^^^^^^^^^^^^^^^
  |   File "/usr/lib64/python3.11/concurrent/futures/_base.py", line 401, in __get_result
  |     raise self._exception
  |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/strands/tools/mcp/mcp_client.py", line 397, in _async_background_thread
  |     async with self._transport_callable() as (read_stream, write_stream, *_):
  |   File "/usr/lib64/python3.11/contextlib.py", line 231, in __aexit__
  |     await self.gen.athrow(typ, value, traceback)
  |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/mcp_lambda/client/streamable_http_sigv4.py", line 143, in streamablehttp_client_with_sigv4
  |     async with streamablehttp_client(
  |   File "/usr/lib64/python3.11/contextlib.py", line 231, in __aexit__
  |     await self.gen.athrow(typ, value, traceback)
  |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/mcp/client/streamable_http.py", line 478, in streamablehttp_client
  |     async with anyio.create_task_group() as tg:
  |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/anyio/_backends/_asyncio.py", line 781, in __aexit__
  |     raise BaseExceptionGroup(
  | ExceptionGroup: unhandled errors in a TaskGroup (1 sub-exception)
  +-+---------------- 1 ----------------
    | Exception Group Traceback (most recent call last):
    |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/mcp/client/streamable_http.py", line 502, in streamablehttp_client
    |     yield (
    |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/mcp_lambda/client/streamable_http_sigv4.py", line 152, in streamablehttp_client_with_sigv4
    |     yield result
    |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/strands/tools/mcp/mcp_client.py", line 399, in _async_background_thread
    |     async with ClientSession(
    |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/mcp/shared/session.py", line 218, in __aexit__
    |     return await self._task_group.__aexit__(exc_type, exc_val, exc_tb)
    |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/anyio/_backends/_asyncio.py", line 781, in __aexit__
    |     raise BaseExceptionGroup(
    | ExceptionGroup: unhandled errors in a TaskGroup (1 sub-exception)
    +-+---------------- 1 ----------------
      | Traceback (most recent call last):
      |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/strands/tools/mcp/mcp_client.py", line 403, in _async_background_thread
      |     await session.initialize()
      |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/mcp/client/session.py", line 151, in initialize
      |     result = await self.send_request(
      |              ^^^^^^^^^^^^^^^^^^^^^^^^
      |   File "/home/ec2-user/.venv/lib64/python3.11/site-packages/mcp/shared/session.py", line 286, in send_request
      |     raise McpError(response_or_error.error)
      | mcp.shared.exceptions.McpError: Connection closed
      +------------------------------------

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/home/ec2-user/spot-anomalies-flink-workshop-resources/code/mcp_server/test_mcp_server_agentcore.py", line 23, in <module>
    streamable_http_mcp_client.start()
  File "/home/ec2-user/.venv/lib64/python3.11/site-packages/strands/tools/mcp/mcp_client.py", line 137, in start
    raise MCPClientInitializationError("the client initialization failed") from e
strands.types.exceptions.MCPClientInitializationError: the client initialization failed
/usr/lib64/python3.11/asyncio/base_events.py:679: RuntimeWarning: coroutine 'MCPClient.stop.<locals>._set_close_event' was never awaited
(.venv) KafkaClientEC2Instance1 [ec2-user@ip-10-0-1-124 mcp_server]$
