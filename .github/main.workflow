workflow "Check markdown links" {
  resolves = ["Create Issue From File"]
  on = "push"
}

action "Link Checker" {
  uses = "./"
  args = "-v -r *"
}

action "Create Issue From File" {
  needs = "Link Checker"
  uses = "peter-evans/create-issue-from-file@v1.0.1"
  secrets = ["GITHUB_TOKEN"]
  env = {
    ISSUE_TITLE = "Link Checker Report"
    ISSUE_CONTENT_FILEPATH = "./link-checker/out.md"
    ISSUE_LABELS = "report, automated issue"
    ISSUE_ASSIGNEES = "peter-evans"
  }
}
