Devcontainer for Chrome extension development

This devcontainer provides a Node.js development environment tailored for building and debugging Chrome extensions.

What it includes

- Node.js (from the VS Code devcontainers image)
- Chromium (stable) and required libraries
- Recommended VS Code extensions: ESLint, Chrome Debugger, GitLens, Browser Preview
- A helper script to start Chromium with remote debugging enabled
- Port 9222 forwarded to the host so you can attach the Chrome debugger

Quick start

1. Reopen the workspace in the container (VS Code: Remote-Containers: Reopen in Container).
2. After the container builds, the `postCreateCommand` runs `npm install`.
3. Start Chromium inside the container (terminal inside container):

```bash
./.devcontainer/run_chromium.sh 9222
```

4. In your host Chrome, open `chrome://inspect` and configure to discover `localhost:9222` if needed, or use the VS Code "Launch Chrome against localhost" launch configuration from the Chrome Debugger extension.

Loading the extension

- Build the extension files (if you have a build step) or use the repo's root folder as the extension directory.
- In the running Chromium instance open `chrome://extensions`, enable Developer mode, click "Load unpacked", and select the repo folder.

Notes and tips

- The container runs Chromium as the `node` user; a profile directory `.chrome-profile` is created in the workspace to persist state.
- If you need a GUI-hosted Chrome instead of in-container Chromium, you can still run the host Chrome and attach to `localhost:9222` if you start host Chrome with remote debugging.
- For reliable in-container runs, the `mounts` setting provides extra /dev/shm size via a Docker volume named `devcontainer-shm`.

E2E (headless) smoke runs

- This repository includes a simple Playwright-based runner at `test/run_e2e.js` that loads the unpacked extension and performs a minimal smoke check.
- Run it inside the container (xvfb is installed in the container):

```bash
npm run e2e
```

- The runner uses the system-installed Chromium in the container and keeps a persistent profile in `.e2e-profile` for quick iteration.
- If you prefer to attach from a host Chrome instead, start host Chrome with `--remote-debugging-port=9222` and use the VS Code Chrome debugger to attach.
