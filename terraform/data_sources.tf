data "azuredevops_variable_group" "library" {
  project_id = var.azuredevops_library_project_id
  name       = var.azuredevops_library_name
}
