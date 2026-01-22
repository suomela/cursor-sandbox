Cursor CLI + Claude Code + Codex Sandbox
========================================

A Docker sandbox for [Cursor CLI](https://cursor.com/cli), [Claude Code](https://www.claude.com/product/claude-code), and [Codex](https://openai.com/codex/).

This should work (at least) on macOS, assuming you already have Docker installed.

Use at your own risk.

One-time setup
--------------

```bash
./cursor-sandbox-build-image
./cursor-sandbox-setup
```

The first command creates an appropriate Docker image, with basic development tools and TeX Live.

The second command sets up a persistent volume that will be visible as `/home/cursor` inside the Docker container, and installs [uv](https://docs.astral.sh/uv/), Rust, [elan](https://github.com/leanprover/elan), Cursor CLI, and Claude Code there.

Usage
-----

The idea is that you can simply run:

- `cursor-sandbox` instead of `cursor-agent`
- `claude-sandbox` instead of `claude`
- `codex-sandbox` instead of `codex`

There is also:

- `codex-sandbox-full-access` that is a shorthand for `codex --sandbox=danger-full-access --ask-for-approval=on-request`

The current working directory of the host computer will be mounted as `/workspace` with read/write access, and the AI agents will be executed within that workspace.

Login
-----

Your Cursor and Claude login information will be stored in the persistent Docker volume. There is nothing special to do; the first time you run `cursor-sandbox`, it will ask you to log in to Cursor as usual, and the same applies to `claude-sandbox`.

For Codex, you will want to use its "device code authentication": run `codex-sandbox login --device-auth`, follow the instructions, and then `codex-sandbox` should work.

Utilities
---------

You can delete all persistent information with `cursor-sandbox-clear` and recreate it with `cursor-sandbox-setup`.

You can get shell access to your sandbox with `cursor-sandbox-helper`.

Hints
-----

You can use `AGENTS-template.md` as a starting point for your `AGENTS.md`.
