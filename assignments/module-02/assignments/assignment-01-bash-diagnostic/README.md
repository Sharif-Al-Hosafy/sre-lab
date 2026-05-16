# Assignment 01 — Bash Diagnostic

**Module:** 2 — DevOps Core Basics
**Roadmap section:** 2.5 (Linux tools) + 2.6 (Bash scripting)
**Status:** PENDING

## Task A — Linux Tool
Run this command on your machine:
```bash
ss -tlnp
```

## Task B — Bash Script
Write a script `check_url.sh` that:
1. Takes a URL as an argument
2. Makes a `curl` request to it
3. Prints the HTTP status code
4. Exits with code `1` if the status is not `200`

Save it as `check_url.sh` in this folder.

## Submission
- Fill in your `ss -tlnp` explanation below
- Drop your `check_url.sh` in this folder
- Come back to Claude and say: "Assignment 01 done"

## Your ss -tlnp explanation
ss -> socket statistics
Options:
    -t ==> means to get only TCP connections
    -l ==> means filter Listen states only
    -n ==> shows the port numbers in socket column
    -p ==> process name using that socket
Headers:
    State => the state of the connection eg.(listen, established)
    Recv-Q ==> for listen state means number of pending connections needs to be accepted, in establish means number of received data not yet accepted by the process
    Send-Q ==> for listen state means the max backlog size of pending connections, in establish means data sent and not yet accepted by the peer 
    Local Address:Port local host socket
    Peer Address:Port remote socket
    Process process name

Real life Example:
    You may find a local address 0.0.0.0:<port> with state listen this means that is accepting connections from all interfaces from the same network on port <port>. as a best practice we need to limit this as it is risky that let's say someone has access to network's wifi can access it, or from docker..etc. 