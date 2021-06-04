local obs = import 'observatorium.libsonnet';
{
  apiVersion: 'v1',
  kind: 'Template',
  metadata: { name: 'observatorium-metrics' },
  objects: [
    obs.thanos.manifests[name] {
      metadata+: { namespace:: 'hidden' },
    }
    for name in std.objectFields(obs.thanos.manifests)
    if obs.thanos.manifests[name] != null
  ],
  parameters: [
    { name: 'NAMESPACE', value: 'observatorium-metrics' },
    { name: 'MST_NAMESPACE', value: 'observatorium-mst-production' },

    { name: 'JAEGER_AGENT_IMAGE_TAG', value: '1.15.0' },
    { name: 'JAEGER_AGENT_IMAGE', value: 'quay.io/app-sre/jaegertracing-jaeger-agent' },
    { name: 'JAEGER_COLLECTOR_NAMESPACE', value: '$(NAMESPACE)' },
    { name: 'MEMCACHED_CPU_LIMIT', value: '3' },
    { name: 'MEMCACHED_CPU_REQUEST', value: '500m' },
    { name: 'MEMCACHED_EXPORTER_CPU_LIMIT', value: '200m' },
    { name: 'MEMCACHED_EXPORTER_CPU_REQUEST', value: '50m' },
    { name: 'MEMCACHED_EXPORTER_IMAGE_TAG', value: 'v0.6.0' },
    { name: 'MEMCACHED_EXPORTER_IMAGE', value: 'docker.io/prom/memcached-exporter' },
    { name: 'MEMCACHED_EXPORTER_MEMORY_LIMIT', value: '200Mi' },
    { name: 'MEMCACHED_EXPORTER_MEMORY_REQUEST', value: '50Mi' },
    { name: 'MEMCACHED_IMAGE_TAG', value: '1.5.20-alpine' },
    { name: 'MEMCACHED_IMAGE', value: 'docker.io/memcached' },
    { name: 'MEMCACHED_MEMORY_LIMIT', value: '1844Mi' },
    { name: 'MEMCACHED_MEMORY_REQUEST', value: '1329Mi' },
    { name: 'OAUTH_PROXY_CPU_LIMITS', value: '200m' },
    { name: 'OAUTH_PROXY_CPU_REQUEST', value: '100m' },
    { name: 'OAUTH_PROXY_IMAGE_TAG', value: '4.7.0' },
    { name: 'OAUTH_PROXY_IMAGE', value: 'quay.io/openshift/origin-oauth-proxy' },
    { name: 'OAUTH_PROXY_MEMORY_LIMITS', value: '200Mi' },
    { name: 'OAUTH_PROXY_MEMORY_REQUEST', value: '100Mi' },
    { name: 'SERVICE_ACCOUNT_NAME', value: 'prometheus-telemeter' },
    { name: 'STORAGE_CLASS', value: 'gp2' },
    { name: 'THANOS_COMPACTOR_CPU_LIMIT', value: '1' },
    { name: 'THANOS_COMPACTOR_CPU_REQUEST', value: '100m' },
    { name: 'THANOS_COMPACTOR_LOG_LEVEL', value: 'info' },
    { name: 'THANOS_COMPACTOR_RETENTION_RESOULTION_RAW', value: '14d' },
    { name: 'THANOS_COMPACTOR_RETENTION_RESOULTION_FIVE_MINUTES', value: '1s' },
    { name: 'THANOS_COMPACTOR_RETENTION_RESOULTION_ONE_HOUR', value: '1s' },
    { name: 'THANOS_COMPACTOR_RETENTION_DISABLE_DOWNSAMPLING', value: '--downsampling.disable' },
    { name: 'THANOS_COMPACTOR_MEMORY_LIMIT', value: '5Gi' },
    { name: 'THANOS_COMPACTOR_MEMORY_REQUEST', value: '1Gi' },
    { name: 'THANOS_COMPACTOR_PVC_REQUEST', value: '50Gi' },
    { name: 'THANOS_COMPACTOR_REPLICAS', value: '1' },
    { name: 'THANOS_CONFIG_SECRET', value: 'thanos-objectstorage' },
    { name: 'THANOS_IMAGE_TAG', value: 'master-2020-08-12-70f89d83' },
    { name: 'THANOS_IMAGE', value: 'quay.io/thanos/thanos' },
    { name: 'THANOS_QUERIER_CPU_LIMIT', value: '1' },
    { name: 'THANOS_QUERIER_CPU_REQUEST', value: '100m' },
    { name: 'THANOS_QUERIER_LOG_LEVEL', value: 'info' },
    { name: 'THANOS_QUERIER_MEMORY_LIMIT', value: '1Gi' },
    { name: 'THANOS_QUERIER_MEMORY_REQUEST', value: '256Mi' },
    { name: 'THANOS_QUERIER_REPLICAS', value: '3' },
    { name: 'THANOS_QUERIER_SVC_URL', value: 'http://thanos-querier.observatorium.svc:9090' },
    { name: 'THANOS_QUERY_FRONTEND_CPU_LIMIT', value: '1' },
    { name: 'THANOS_QUERY_FRONTEND_CPU_REQUEST', value: '100m' },
    { name: 'THANOS_QUERY_FRONTEND_LOG_QUERIES_LONGER_THAN', value: '5s' },
    { name: 'THANOS_QUERY_FRONTEND_MAX_RETRIES', value: '0' },
    { name: 'THANOS_QUERY_FRONTEND_MEMORY_LIMIT', value: '1Gi' },
    { name: 'THANOS_QUERY_FRONTEND_MEMORY_REQUEST', value: '256Mi' },
    { name: 'THANOS_QUERY_FRONTEND_REPLICAS', value: '3' },
    { name: 'THANOS_QUERY_FRONTEND_SPLIT_INTERVAL', value: '24h' },
    { name: 'THANOS_RECEIVE_CONTROLLER_IMAGE_TAG', value: 'master-2019-10-18-d55fee2' },
    { name: 'THANOS_RECEIVE_CONTROLLER_IMAGE', value: 'quay.io/observatorium/thanos-receive-controller' },
    { name: 'THANOS_RECEIVE_CPU_LIMIT', value: '1' },
    { name: 'THANOS_RECEIVE_CPU_REQUEST', value: '1' },
    { name: 'THANOS_RECEIVE_DEBUG_ENV', value: '' },
    { name: 'THANOS_RECEIVE_LOG_LEVEL', value: 'info' },
    { name: 'THANOS_RECEIVE_MEMORY_LIMIT', value: '1Gi' },
    { name: 'THANOS_RECEIVE_MEMORY_REQUEST', value: '1Gi' },
    { name: 'THANOS_RECEIVE_REPLICAS', value: '5' },
    { name: 'THANOS_RECEIVE_TSDB_PATH', value: '/var/thanos/receive' },
    { name: 'THANOS_RULER_CPU_LIMIT', value: '1' },
    { name: 'THANOS_RULER_CPU_REQUEST', value: '500m' },
    { name: 'THANOS_RULER_LOG_LEVEL', value: 'info' },
    { name: 'THANOS_RULER_MEMORY_LIMIT', value: '2Gi' },
    { name: 'THANOS_RULER_MEMORY_REQUEST', value: '2Gi' },
    { name: 'THANOS_RULER_PVC_REQUEST', value: '50Gi' },
    { name: 'THANOS_RULER_REPLICAS', value: '2' },
    { name: 'THANOS_S3_SECRET', value: 'telemeter-thanos-stage-s3' },
    { name: 'THANOS_STORE_BUCKET_CACHE_CONNECTION_LIMIT', value: '3072' },
    { name: 'THANOS_STORE_BUCKET_CACHE_MEMCACHED_CPU_LIMIT', value: '3' },
    { name: 'THANOS_STORE_BUCKET_CACHE_MEMCACHED_CPU_REQUEST', value: '500m' },
    { name: 'THANOS_STORE_BUCKET_CACHE_MEMCACHED_MEMORY_LIMIT', value: '3Gi' },
    { name: 'THANOS_STORE_BUCKET_CACHE_MEMCACHED_MEMORY_REQUEST', value: '2558Mi' },
    { name: 'THANOS_STORE_BUCKET_CACHE_MEMORY_LIMIT_MB', value: '2048' },
    { name: 'THANOS_STORE_BUCKET_CACHE_REPLICAS', value: '3' },
    { name: 'THANOS_STORE_CPU_LIMIT', value: '2' },
    { name: 'THANOS_STORE_CPU_REQUEST', value: '500m' },
    { name: 'THANOS_STORE_INDEX_CACHE_CONNECTION_LIMIT', value: '3072' },
    { name: 'THANOS_STORE_INDEX_CACHE_MEMCACHED_CPU_LIMIT', value: '3' },
    { name: 'THANOS_STORE_INDEX_CACHE_MEMCACHED_CPU_REQUEST', value: '500m' },
    { name: 'THANOS_STORE_INDEX_CACHE_MEMCACHED_MEMORY_LIMIT', value: '3Gi' },
    { name: 'THANOS_STORE_INDEX_CACHE_MEMCACHED_MEMORY_REQUEST', value: '2558Mi' },
    { name: 'THANOS_STORE_INDEX_CACHE_MEMORY_LIMIT_MB', value: '2048' },
    { name: 'THANOS_STORE_INDEX_CACHE_REPLICAS', value: '3' },
    { name: 'THANOS_STORE_LOG_LEVEL', value: 'info' },
    { name: 'THANOS_STORE_MEMORY_LIMIT', value: '8Gi' },
    { name: 'THANOS_STORE_MEMORY_REQUEST', value: '1Gi' },
    { name: 'THANOS_STORE_REPLICAS', value: '5' },
    { name: 'CONFIGMAP_RELOADER_IMAGE', value: 'quay.io/openshift/origin-configmap-reloader' },
    { name: 'CONFIGMAP_RELOADER_IMAGE_TAG', value: '4.5.0' },
  ],
}
