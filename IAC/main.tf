resource "google_project_service" "gcp_services" {
  for_each = toset(var.gcp_service_list)
  project = var.project_id
  service = each.key
  disable_dependent_services = true
}

resource "google_storage_bucket" "upload_bucket_set" {
  project       = var.project_id
  for_each      = toset(var.bucket_name_set)
  name          = each.value     # note: each.key and each.value are the same for a set
  location      = var.region
  storage_class = "STANDARD"
  force_destroy = true
  uniform_bucket_level_access = true
}

resource "google_bigquery_dataset" "bq_datasets" {
  project = var.project_id
  for_each = toset(var.bq_dataset_name_set)
  dataset_id = each.value
  location = var.region
  depends_on = [
    google_project_service.gcp_services,
  ]
}

resource "google_storage_bucket" "ensamble_bucket" {
  project       = var.project_id
  name          = var.ensemble_bucket
  location      = var.region
  storage_class = "STANDARD"
  force_destroy = true
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "cf_code" {
  bucket = google_storage_bucket.ensamble_bucket.name
  name = "GO_GCS2BQ/go_gcs_2_bq.zip"
  source = "/Users/arturkepka/GoTraining/Go-GCP/Go/Cloud Functions/GCS2BQ/Archive.zip"
}

# resource "google_storage_bucket_object" "cm_cf_code" {
#   bucket = google_storage_bucket.ensamble_bucket.name
#   name = "composer_management/cm_cf_code.zip"
#   source = "/Users/arturkepka/PycharmProjects/Suedzucker/SZG_IT_GCP-DataIntegrationPlatform_/DIP_Composer_Oracle_to_BigQuery/Cloud Function/cm_cf_code.zip"
# }

# resource "null_resource" "upload_composer_folder_content" {
#   triggers = {
#     file_hashes = jsonencode({
#       for fn in fileset(var.composer_bukcet_files_directory, "**"):
#         fn => filesha256("${var.composer_bukcet_files_directory}/${fn}")
#     })
#   }
#   provisioner "local-exec" {
#     command = "gsutil -m cp -r ${var.composer_bukcet_files_directory}/* gs://${var.ensemble_bucket}/composer_management/"
#   }
# }

# resource "null_resource" "upload_gcs2bq_folder_content" {
#   triggers = {
#     file_hashes = jsonencode({
#       for fn in fileset(var.gcs_2_bq_bukcet_files_directory, "**"):
#         fn => filesha256("${var.gcs_2_bq_bukcet_files_directory}/${fn}")
#     })
#   }
#   provisioner "local-exec" {
#     command = "gsutil -m cp -r ${var.gcs_2_bq_bukcet_files_directory}/* gs://${var.ensemble_bucket}/gcs_to_bigquery_cf_pipeline//"
#   }
# }

# resource "google_compute_network" "default" {
#   name = "default"
# }

# resource "google_compute_subnetwork" "default_subnet" {
#   name = "default-subnet"
#   ip_cidr_range = "10.0.0.0/24"
#   network = "default"
# }

# resource "google_cloud_scheduler_job" "run-composer-automation" {
#   project = var.project_id #can i setup a global project id?
#   name = "run-composer-automation"
#   description = "This cron job triggers cloud function managing composer runs."
#   schedule = "0 * * * *"
#   time_zone = "Europe/Berlin"


#   http_target {
#     http_method = "POST"
#     uri         = google_cloudfunctions_function.composer_management.https_trigger_url #"https://europe-west3-szg-np-prj-t-dip-7823.cloudfunctions.net/composer_management_test"
#     body        = base64encode("{\"action\":\"environment_management\"}")

#     oidc_token {
#       # this causes issues, investigate
#       service_account_email = "${google_service_account.composer_automation_cf_sa.email}"
#     }
#   }

#   depends_on = [
#     google_project_service.gcp_services,
#     google_cloudfunctions_function.composer_management
#   ]
# }


