Cursor Agent Sandbox
====================

Docker sandbox for [Cursor CLI](https://cursor.com/cli).

This should work (at least) on macOS, assuming you have Docker installed already.

Use at your own risk.

One-time setup
--------------

```bash
cursor-sandbox-build-image
cursor-sandbox-setup
```

The first command creates an appropriate Docker image.

The second command sets up a persistent volume that will be visible as `/home/cursor` inside the Docker container, and installs there [uv](https://docs.astral.sh/uv/) and `cursor-agent`.

Usage
-----

The idea is that you can simply run `cursor-sandbox` instead of `cursor-agent`.

The current working directory of the host computer will be read-write mounted as `/workspace`, and `cursor-agent`.

Your Cursor login information will be stored in the persistent Docker volume. There is nothing special to do; the first time you run `cursor-sandbox` it should ask you to log on to Cursor as usual.

Utilities
---------

You can delete all persistent information with `cursor-sandbox-clear` and re-create it with `cursor-sandbox-setup`.

You can get shell access to your sandbox with `cursor-sandbox-helper`.
