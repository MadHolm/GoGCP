
####### Cloud Function processing data uploads from GCS to BigQuery
resource "google_cloudfunctions_function" "gcs_to_bigquery" {
  name = "GO_GCS2BQ"
  runtime = "go120"
  region = var.region
  source_archive_bucket = google_storage_bucket.ensamble_bucket.name
  source_archive_object = "GO_GCS2BQ/go_gcs_2_bq.zip"
  entry_point = "HelloWorld"
  trigger_http                 = true
  https_trigger_security_level = "SECURE_ALWAYS"
  available_memory_mb = 4096
  project = var.project_id
  # service_account_email = google_service_account.composer_automation_cf_sa.email
  # event_trigger {
  #   event_type = "google.storage.object.finalize"
  #   resource = var.bucket_name_set[0]
  # }

  # environment_variables = {
  #   project_id = var.project_id
  #   source_bucket = var.bucket_name_set[0]
  #   fail_bucket = var.bucket_name_set[1]
  #   success_bucket = var.bucket_name_set[2]
  #   management_bucket = var.ensemble_bucket
  #   destination_dataset = var.bq_dataset_name_set[0]
  # }


  # lifecycle {
  #   replace_triggered_by = [
  #     google_storage_bucket_object.cf_code.md5hash
  #   ]
  # }

  # depends_on = [
  #   google_storage_bucket_object.cf_code,
  #   google_project_service.gcp_services,
  #   #module.service_account# This can be ignored
  # ]
//  service_account_email = "gcs-to-bq-cf-pipeline-sa@szg-it-dip-dev-prj001-09a1.iam.gserviceaccount.com"
}

