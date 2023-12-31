#!/bin/bash

# Author: Musaib Bashir
# Date: 14/11/23
# Version: v1

# This script will print the users having read access to the repo

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # echo "$endpoint"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # echo "printing collaborators"
    # echo "$collaborators"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}
required_cmd_args=$#
function helper {

	if [ "$required_cmd_args" -ne 2 ]; then
		echo "Please enter 2 argugments"
		exit 1
	fi
}
# Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
helper
list_users_with_read_access
