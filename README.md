Cursor Agent + Claude Code Sandbox
==================================

A Docker sandbox for [Cursor CLI](https://cursor.com/cli) and [Claude Code](https://www.claude.com/product/claude-code).

This should work (at least) on macOS, assuming you already have Docker installed.

Use at your own risk.

One-time setup
--------------

```bash
cursor-sandbox-build-image
cursor-sandbox-setup
```

The first command creates an appropriate Docker image.

The second command sets up a persistent volume that will be visible as `/home/cursor` inside the Docker container, and installs [uv](https://docs.astral.sh/uv/), Rust, Cursor CLI and Claude Code there.

Usage
-----

The idea is that you can simply run:

- `cursor-sandbox` instead of `cursor-agent`
- `claude-sandbox` instead of `claude`

The current working directory of the host computer will be mounted as `/workspace` with read-write access, and `cursor-agent` and `claude` will be executed within that workspace.

Your Cursor and Claude login information will be stored in the persistent Docker volume. There is nothing special to do; the first time you run `cursor-sandbox`, it will ask you to log in to Cursor as usual, and the same applies to `claude-sandbox`.

Utilities
---------

You can delete all persistent information with `cursor-sandbox-clear` and re-create it with `cursor-sandbox-setup`.

You can get shell access to your sandbox with `cursor-sandbox-helper`.
