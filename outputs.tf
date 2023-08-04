output "id" {
  value = google_project.my_project.id
}

output "project_id" {
  value = trimprefix(google_project.my_project.id, "projects/")
}
output "project_number" {
  value = google_project.my_project.project_number
}