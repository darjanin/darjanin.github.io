workflow "Deploy" {
  resolves = ["GitHub Action for Zeit"]
  on = "deployment"
}

action "GitHub Action for Zeit" {
  uses = "actions/zeit-now@5c51b26db987d15a0133e4c760924896b4f1512f"
  secrets = ["GITHUB_TOKEN"]
}
