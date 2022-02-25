project('sigdb', version: 'main')

signatures_dirs = [
  'elf',
  'pe',
]

sigdb_path = get_option('sigdb_path')
if sigdb_path == ''
  rz_sign_dep = dependency('rz_sign', required: true)
  rz_datdir = rz_sign_dep.get_variable(pkgconfig: 'datdir', cmake: 'rz_sign_DATDIR')
  sigdb_path = get_option('prefix') / rz_datdir / 'sigdb'
endif

summary({
  'Install path: ': sigdb_path,
  'Directories': signatures_dirs,
}, section: 'Summary', list_sep: ', ')

foreach subdir : signatures_dirs
  install_subdir(subdir, install_dir: sigdb_path)
endforeach
