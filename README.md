This Bash script utilizes the GitHub API to list users with read access to a repository.

## Usage

```bash
bash ./script.sh <REPO_OWNER> <REPO_NAME>
```

- Replace \`<REPO_OWNER>\` and \`<REPO_NAME>\` with the actual GitHub repository owner and name.

## Prerequisites

- GitHub username and personal access token are required.
- Make sure to have \`jq\` installed (\`sudo apt-get install jq\`).

## Instructions

1. Run the script by providing the repository owner and name.
2. The script will list users with read access to the specified repository.

## Example

```bash
bash ./script.sh your_username your_repository
```

## GitHub Access Token

To use this script, you need a GitHub personal access token. Follow these steps to generate a token:

1. Go to your GitHub account settings.
2. Navigate to "Developer settings" > "Personal access tokens."
3. Click on "Generate token."
4. Provide a name for the token, select the required scopes (at least \`repo\` for accessing repositories), and click "Generate token."
5. Copy the generated token.

Set the generated token as the \`token\` variable in your script:

\`\`\`bash
# GitHub API Script

# GitHub username and personal access token
USERNAME=$username
TOKEN="$token"  # Replace with your actual personal access token


Replace \`"token"\` with the actual access token you generated from GitHub.

**Note:** Keep your access token secure and avoid sharing it publicly. If using the script in a CI/CD environment, consider using environment variables to securely store and pass the token.
