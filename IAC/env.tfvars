# environment_affix = "prod"
# default_composer_service_account = "service-903830707791@cloudcomposer-accounts.iam.gserviceaccount.com"

# Project variables
project_id = "akepka-go-only-playground"
# host_VPC_project_id = "prj-c-dev-net-spoke-f1db"
region = "europe-west3"
zone = "europe-west3-a"

# Composer pipeline variables
ensemble_bucket = "dev-go-pipelines-bucket"
# env_name = "prod-oracle-to-bq-orchestration-dip-automated"
# network_id = "default"
# subnetwork_id = "default-subnet"
# snapshot_path = "gs://prod-pipelines-management-ensemble-bucket/composer_management/Composer_Snapshot"

# GCS to BigQuery Cloud Function pipeline variables
bucket_name_set = [
  "go-load-file-to-bq-upload-bucket",
  "go-load-file-to-bq-upload-bucket-failed",
  "go-load-file-to-bq-upload-bucket-succeed",
]

bq_dataset_name_set = [
  "GO_GCS2BQ",
  # "GCS2BQ_soil_data",
  # "GCS2BQ_seed_results",
  # "COMPOSER_final_raw",
  # "COMPOSER_staging_raw"
]