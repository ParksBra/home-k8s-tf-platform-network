locals {
  # DNS configuration
  external_parent_domain = "parkl.ee"
  create_dns_records = true
  dns_ttl_seconds = 1 # 1 is Automatic TTL
  dns_records_proxy_enabled = false
  dns_records_default_comment = "Managed by Terraform"
  cloudflare_provider_api_token_infisical_secret_name = "cloudflare-tf-provider-api-token"
}

locals {
  # OpenEBS ZFS configuration
  zfs_pool_name = "zfspv-pool"
}

locals {
  # Network configuration
  pod_network_cidr = "10.244.0.0/16"
  pod_service_cidr = "10.96.0.0/12"
  cluster_domain = "cluster.local"

  cert_manager_namespace = "cert-manager"

  tailscale_operator_namespace = "tailscale-operator"

  tigera_operator_namespace = "tigera-operator"

  ingress_nginx_namespace = "ingress-nginx"

  tailscale_oauth_client_id_infisical_secret_name = "tailscale-client-id"
  tailscale_oauth_client_secret_infisical_secret_name = "tailscale-client-secret"

  tailscale_operator_default_tags = [
    "tag:k8s-operator"
  ]
  tailscale_proxy_default_tags = [
    "tag:k8s"
  ]

  cert_manager_create_cluster_issuer = true
  cert_manager_cluster_issuer_name = "letsencrypt"
  cert_manager_acme_email_infisical_secret_name = "cloudflare-email"
  cert_manager_dns_provider = "cloudflare"
  cert_manager_dns_provider_email_infisical_secret_name = "cloudflare-email"
  cert_manager_dns_provider_api_token_infisical_secret_name = "cloudflare-api-token"
}

locals {
  # Platform storage configuration
  openebs_namespace = "openebs"

  minio_operator_namespace = "minio-operator"

  velero_namespace = "velero"
  velero_minio_pool_user_id = 1002
  velero_minio_pool_group_id = 1002
  velero_minio_pool_size_gb = 16
  velero_minio_pool_server_count = 1
  velero_minio_pool_volume_count = 1
  velero_minio_pool_node_selector = {
    "node-role.kubernetes.io/control-plane" = ""
  }
  velero_minio_pool_tolerations = [
    { # Tolerate control-plane nodes, to allow creation of backup storage on control-plane node
      key      = "node-role.kubernetes.io/control-plane"
      operator = "Exists"
      effect   = "NoSchedule"
    }
  ]

  velero_internal_kubectl_repository = "bitnamilegacy/kubectl"
  velero_internal_kubectl_tag = "1.33.4" # Old kubectl version as newest container version isn't available through bitnamilegacy/kubectl

  velero_scheduled_backups = {
    "daily" = {
      schedule = ["0", "2", "*", "*", "*"] # At 02:00 every day
      ttl_minutes = 100080 # 7 days
      included_namespaces = ["*"]
      excluded_namespaces = []
      included_resources = ["*"]
      excluded_resources = []
      include_cluster_resources = true
      selected_labels = {}
      schedule_labels = {
        "backup-type" = "daily"
      }
      schedule_annotations = {}
    }
  }
  velero_scheduled_backup_common_labels = {}
  velero_scheduled_backup_common_annotations = {}
}

locals {
  # Storage class configuration for services
  service_storageclass_name = "service-sc"
  service_storageclass_volume_binding_mode = "WaitForFirstConsumer"
  service_storageclass_reclaim_policy = "Delete"
  service_storageclass_provisioner = "zfs.csi.openebs.io"
  service_storageclass_parameters = {
    poolname      = local.zfs_pool_name
    recordsize    = "128K"
    compression   = "off"
    deduplication = "off"
    fstype        = "zfs"
  }
  service_storageclass_annotations = {}
  service_storageclass_labels = {}
}

locals {
  # Storage class configuration for Velero
  velero_storageclass_name = "velero-sc"
  velero_storageclass_provisioner = "kubernetes.io/no-provisioner"
  velero_storageclass_reclaim_policy = "Retain"
  velero_storageclass_volume_binding_mode = "WaitForFirstConsumer"
  velero_storageclass_parameters = {}
  velero_storageclass_annotations = {}
  velero_storageclass_labels = {}
}

locals {
  # Persistent volume configuration for Velero
  velero_persistentvolume_name = "velero-pv"
  velero_persistentvolume_reclaim_policy = "Retain"
  velero_persistentvolume_host_path = "/mnt/minio-velero-data"
  velero_persistentvolume_host_path_type = "DirectoryOrCreate"
  velero_persistentvolume_access_modes = ["ReadWriteOnce"]
  velero_persistentvolume_node_affinity_matched_expressions = {
    key = "node-role.kubernetes.io/control-plane"
    operator = "Exists"
  }
  velero_persistentvolume_capacity_gb = 32
}
