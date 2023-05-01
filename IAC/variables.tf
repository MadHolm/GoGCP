variable "project_id" {
    type = string
}

# variable "host_VPC_project_id" {
#     type = string
# }

# variable "environment_affix" {
#     type = string
# }

# variable "default_composer_service_account" {
#     type = string
# }

variable "ensemble_bucket" {
    type = string
}

variable "region" {
    type = string
}

# variable "env_name" {
#     type = string
# }

# variable "network_id" {
#     type = string
# }

# variable "subnetwork_id" {
#     type = string
# }

# variable "snapshot_path" {
#     type = string
# }

variable "zone" {
    type = string
}

variable "bucket_name_set" {
    type = list(string)
}

variable "bq_dataset_name_set" {
    type = list(string)
}

# variable "composer_bukcet_files_directory" {
#     type = string
#     default = "/Users/arturkepka/PycharmProjects/Suedzucker/SZG_IT_GCP-DataIntegrationPlatform_/DIP_Composer_Oracle_to_BigQuery/Bucket_Files"
# }

# variable "gcs_2_bq_bukcet_files_directory" {
#     type = string
#     default = "/Users/arturkepka/PycharmProjects/Suedzucker/SZG_IT_GCP-DataIntegrationPlatform_/DIP-GCS-to-BigQuery/Bucket_Files"
# }

variable "gcp_service_list" {
    description ="The list of apis necessary for the project"
    type = list(string)
    default = [
        "cloudfunctions.googleapis.com",
        "cloudbuild.googleapis.com",
        "bigquerystorage.googleapis.com",
        "bigquery.googleapis.com",
        # "cloudscheduler.googleapis.com",
        # "composer.googleapis.com",
        # "secretmanager.googleapis.com",
        # "dataflow.googleapis.com"
  ]
}