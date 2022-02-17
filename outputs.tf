output "id" {
  value = trimprefix(google_project.my_project.id, "projects/")
}