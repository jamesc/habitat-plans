pkg_name=prometheus
pkg_origin=jamesc
pkg_version=0.20.0
pkg_maintainer="James Casey <jamesc.000@gmail.com>"
pkg_license=('apache')
pkg_upstream_url="https://github.com/jamesc/habitat-plans/"
pkg_description=$(cat << EOF
  # Prometheus
  This is the habitat package for Prometheus, the open source monitoring solution.

  See [https://prometheus.io](https://prometheus.io) for more details.
EOF
)

pkg_source=https://github.com/prometheus/${pkg_name}/releases/download/${pkg_version}/${pkg_name}-${pkg_version}.linux-amd64.tar.gz
pkg_shasum=660ba94efb1f4cff4934dc55bfe1b920f9bc4630bf731de4a67599b048c42c5c
pkg_filename=${pkg_name}-${pkg_version}.linux-amd64.tar.gz
pkg_dirname=${pkg_name}-${pkg_version}.linux-amd64

pkg_bin_dirs=(sbin)

pkg_svc_run="sbin/prometheus \
  -config.file ${pkg_svc_config_path}/prometheus.yml \
  -storage.local.path ${pkg_svc_data_path} \
  -web.console.libraries=${pkg_svc_var_path}/console_libraries \
  -web.console.templates=${pkg_svc_var_path}/consoles"

pkg_expose=(9090)

do_build() {
  return 0
}

do_strip() {
  return 0
}

do_install() {
  cp LICENSE NOTICE ${pkg_prefix}
  mkdir -p ${pkg_prefix}/sbin
  cp prometheus promtool ${pkg_prefix}/sbin
  cp -r consoles ${pkg_prefix}
  cp -r console_libraries ${pkg_prefix}
}
