#!/bin/bash

# Cleanup background process
trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

npx playwright run-server --reuse-browser --port 8182 &

export PW_TEST_CONNECT_WS_ENDPOINT=ws://127.0.0.1:8182/
export PW_TEST_REUSE_CONTEXT=1

# First run will pass
npx playwright test

# Second run will fail
npx playwright test
