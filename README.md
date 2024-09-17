
# Tailscale Direct Connect Routes Fix

This script fixes the issue where a Tailscale node becomes inaccessible from the local LAN when Tailscale is configured with `accept-routes=true`. By deploying a service and timer to the systemd directory, it ensures that local routes are properly set up, allowing LAN devices to communicate with the Tailscale node.

## How it works:
- Downloads the `.service` and `.timer` files from the repository.
- Places the files in the `/etc/systemd/system` directory on a Debian system.
- Enables and starts the systemd service and timer, which ensure proper routes for local access.
- Cleans up after itself once the deployment is complete.

## How to use:

To deploy this fix, run the following command on your Debian machine:

```bash
curl -sS https://raw.githubusercontent.com/igiannakas/tailscale/main/deploy.sh | sudo bash
```

To uninstall run the following command on your Debian machine:

```bash
curl -sS https://raw.githubusercontent.com/igiannakas/tailscale/main/uninstall.sh | sudo bash
```

This will:
1. Download the necessary files.
2. Move them to the correct location.
3. Enable and start the service and timer to fix the connectivity issue.
