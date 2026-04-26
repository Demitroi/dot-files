### LLMs on Docker

LLMs can be run via Docker, this is the recomended way since LLMs can hallucinate and destroy systems and/or data.

In case the machine has a NVIDIA graphics card, this can be used to accelerated the execution of LLMs.

Make sure the ```nvidia-container-toolkit``` package is installed and run the next commands.

```sh
nvidia-ctk runtime configure --runtime=docker
systemctl restart docker
```

Create a normal and an internal network.

```sh
docker network create llm_network
docker network create --internal llm_network_internal
```

The first one will be used to tasks whose internet access is required, the second one for offline LLM usage, ideal to avoid credential steal and remote code execution.

#### Ollama

Run a ollama container with my preferred settings.

Use the --gpus=all option only if the machine has a NVIDIA GPU.

The --network flag is not required, but It's recommended to connect with other tools such as Open WebUI and OpenCode.

```sh
docker run -d --rm --gpus=all --network llm_network -v ollama:/root/.ollama -e OLLAMA_KEEP_ALIVE=30m -e OLLAMA_CONTEXT_LENGTH=32768 -p 11434:11434 --name ollama ollama/ollama
```

Exec a bash inside the container.

```sh
docker exec -ti ollama bash
```

Look for ollama models in the next URL:

https://ollama.com/search

Install some and run them.

```sh
ollama pull gemma4:e4b
ollama run gemma4:e4b
```

#### Open WebUI

Open WebUI is UI for self hosted LLMS.

Run a container connected to the same docker network.

```sh
docker run --rm --network llm_network -d -p 3000:8080 -e OLLAMA_BASE_URL=http://ollama:11434 -v open-webui:/app/backend/data --name open-webui ghcr.io/open-webui/open-webui:main
```

#### OpenCode

OpenCode is an open source coding agent.

Run a ollama container in order to configure the OpenCode models.

Note It's connected to the inernal network and It has an opencode volume attached.

```sh
docker run -d --rm --gpus=all --network llm_network_internal -v ollama:/root/.ollama -v opencode:/root/.config/opencode -e OLLAMA_KEEP_ALIVE=30m -e OLLAMA_CONTEXT_LENGTH=32768 -p 11434:11434 --name ollama ollama/ollama
```

Exec a bash inside the ollama container.

```sh
docker exec -ti ollama bash
```

Create the opencode config. You should run this command when you add or remove models, this is because opencode isn't aware of ollama models.

```sh
ollama launch opencode --config
```

This will create the file ```/root/.config/opencode/opencode.json```.

There's a problem, the file create points to ```0.0.0.0``` IP. Change It to ollama host with sed.

```sh
sed -i s/0.0.0.0/ollama/ /root/.config/opencode/opencode.json
```

Before running OpenCode, It's recommended to create a git worktree for the project.

```sh
cd my_project
git worktree add -b new_feature ../my_project_new_feature
cd ../my_project_new_feature
```

Once created the worktree, run a opencode container with the current working directory.

```sh
docker run -it --network llm_network_internal --rm -w /workspace -v ${PWD}:/workspace -v opencode:/root/.config/opencode -v opencode_share:/root/.local/share/opencode --name opencode ghcr.io/anomalyco/opencode
```

